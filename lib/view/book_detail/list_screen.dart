import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ListScreen extends StatefulWidget {
  final String pdfLink;
  ListScreen({super.key, required this.pdfLink});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late PdfViewerController _pdfViewerController;

  Future<String> _getCachedPdfFile(String url) async {
    // استفاده از cache manager برای دانلود و کش کردن فایل
    var file = await DefaultCacheManager().getSingleFile(url);
    return file.path; // مسیر فایل کش شده
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _getCachedPdfFile(widget.pdfLink),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SfPdfViewer.file(
                canShowPaginationDialog: true,
                canShowScrollHead: true,
                canShowScrollStatus: true,
                enableTextSelection: false,
                File(snapshot.data!),
                controller: _pdfViewerController,
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
}
