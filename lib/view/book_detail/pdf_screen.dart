import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  final String pdfLink;
  PdfScreen({super.key, required this.pdfLink});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late PdfViewerController _pdfViewerController;
  int? _lastPage;
  List<int> _bookmarks = [];
  PdfTextSearchResult _searchResult = PdfTextSearchResult();
  TextEditingController _searchController = TextEditingController();
  bool isVertical = true;
  String url = "";
  List<int> bookmarks = [];
  @override
  void initState() {
    super.initState();
    _loadSavedPage();
    _loadBookmarks();
    url = widget.pdfLink.toString();
    _pdfViewerController = PdfViewerController();
  }

  _searchText(String searchText) async {
    _searchResult = await _pdfViewerController.searchText(searchText);
    if (mounted) {
      setState(() {});
    }
  }

  Future<String> _getCachedPdfFile(String url) async {
    // استفاده از cache manager برای دانلود و کش کردن فایل
    var file = await DefaultCacheManager().getSingleFile(url);
    return file.path; // مسیر فایل کش شده
  }

  Future<void> _loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? bookmarkData = prefs.getString('${widget.pdfLink}_bookmarks');
    if (bookmarkData != null) {
      setState(() {
        bookmarks = bookmarkData.split(',').map((e) => int.parse(e)).toList();
      });
    }
  }

  Future<void> _saveBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('${widget.pdfLink}_bookmarks', bookmarks.join(','));
  }

  void _toggleBookmark(int page) {
    if (!bookmarks.contains(page)) {
      bookmarks.add(page);
      _saveBookmarks();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'صفحه $page ذخیره شد',
          textDirection: TextDirection.rtl,
        )),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'صفحه $page قبلا ذخیره شده است',
          textDirection: TextDirection.rtl,
        )),
      );
    }
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    currentPageNotifier.dispose();
    super.dispose();
  }

  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(1);
  late int totalPages = 0;
  void _goToBookmark(int page) {
    _pdfViewerController.jumpToPage(page);
  }

  Future<void> _saveCurrentPage(int pageNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(widget.pdfLink, pageNumber);
  }

  Future<void> _loadSavedPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedPage = prefs.getInt(widget.pdfLink);
    if (savedPage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pdfViewerController.jumpToPage(savedPage);
      });
    }
  }

  void _addNoteToPage(int page) async {
    TextEditingController noteController = TextEditingController();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? existingNote =
        prefs.getString('${widget.pdfLink}_page${page}_note');

    if (existingNote != null) {
      noteController.text = existingNote;
    }

    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(
              'یادداشت برای صفحه $page',
              style: GoogleFonts.vazirmatn(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            content: TextField(
              controller: noteController,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: 'یادداشت خود را وارد کنید...',
                  hintStyle: GoogleFonts.vazirmatn(fontSize: 14)),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('لغو'),
              ),
              TextButton(
                onPressed: () async {
                  await prefs.setString('${widget.pdfLink}_page${page}_note',
                      noteController.text);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('یادداشت ذخیره شد')),
                  );
                },
                child: Text('ذخیره'),
              ),
            ],
          ),
        );
      },
    );
  }

  // نمایش یادداشت‌های صفحه فعلی
  void _showNoteForPage(int page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? note = prefs.getString('${widget.pdfLink}_page${page}_note');

    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(
              'یادداشت برای صفحه $page',
              style: GoogleFonts.vazirmatn(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text(
              note ?? 'هیچ یادداشتی برای این صفحه وجود ندارد.',
              style: GoogleFonts.vazirmatn(fontSize: 14),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('بستن'),
              ),
            ],
          ),
        );
      },
    );
  }
  // @override
  // void dispose() {
  //   _searchController
  //       .dispose(); // اگر تایمر یا کنترلری دارید باید در اینجا پاکسازی شود
  //   _pdfViewerController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.note_add),
            onPressed: () {
              _addNoteToPage(_pdfViewerController.pageNumber ?? 1);
            },
          ),
          IconButton(
            icon: Icon(Icons.note),
            onPressed: () {
              _showNoteForPage(_pdfViewerController.pageNumber ?? 1);
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmarks),
            onPressed: () {
              _showBookmarksDialog();
            },
          ),
          IconButton(
            icon: Icon(Icons.bookmark_add),
            onPressed: () {
              _toggleBookmark(_pdfViewerController.pageNumber ?? 1);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.directions,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                isVertical = !isVertical;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _getCachedPdfFile(widget.pdfLink),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  SfPdfViewer.file(
                    canShowPaginationDialog: true,
                    canShowScrollHead: true,
                    canShowScrollStatus: true,
                    enableTextSelection: false,
                    File(snapshot.data!),
                    controller: _pdfViewerController,
                    scrollDirection: isVertical
                        ? PdfScrollDirection.vertical
                        : PdfScrollDirection.horizontal,
                    onPageChanged: (details) {
                      _saveCurrentPage(details.newPageNumber);
                      currentPageNotifier.value = details.newPageNumber;
                      totalPages = _pdfViewerController.pageCount;
                      // setState(() {
                      //   currentPage = details.newPageNumber;
                      // });
                    },
                  ),
                  Positioned(
                    bottom: 16,
                    right: 0,
                    child: ValueListenableBuilder<int>(
                      valueListenable: currentPageNotifier,
                      builder: (context, currentPage, _) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                          child: Text(
                            'صفحه $currentPage از ${totalPages ?? 0}',
                            style: GoogleFonts.vazirmatn(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                  child: Text(
                'پی دی اف هنوز اپلود نشده است',
                style: GoogleFonts.vazirmatn(fontSize: 20),
              ));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _showBookmarksDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('صفحات ذخیره شده'),
          content: bookmarks.isNotEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: bookmarks
                      .map((page) => Directionality(
                            textDirection: TextDirection.rtl,
                            child: ListTile(
                              title: Text('صفحه $page'),
                              onTap: () {
                                Navigator.pop(context);
                                _goToBookmark(page);
                              },
                            ),
                          ))
                      .toList(),
                )
              : Text('No bookmarks added'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}



  // _showSearchDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Search'),
  //         content: TextField(
  //           controller: _searchController,
  //           decoration: InputDecoration(hintText: 'Enter text to search'),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               _searchText(_searchController.text);
  //               Navigator.pop(context);
  //             },
  //             child: Text('Search'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('Cancel'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

