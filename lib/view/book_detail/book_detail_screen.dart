import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookapp/controller/api/book/add_save_book.dart';
import 'package:bookapp/controller/api/book/book_detail.dart';
import 'package:bookapp/controller/api/payment/shop_card/buy_book.dart';
import 'package:bookapp/controller/api/payment/shop_card/get_shopcard_list.dart';
import 'package:bookapp/controller/api/search_fillter/search_fillter.dart';
import 'package:bookapp/controller/provider/book_detail_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/controller/service/replace.dart';
import 'package:bookapp/controller/service/split_number.dart';
import 'package:bookapp/model/api/generated/tikonline.enums.swagger.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/components/categorytext_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class BookDetailScreen extends StatefulWidget {
  final String bookId;
  const BookDetailScreen({super.key, required this.bookId});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  Future<File>? _cachedImageFuture;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadBookDetails();
    // getBookDetails(context: context, bookId: widget.bookId).then(
    //   (value) {
    //     url = BookDetailState.bookDetail!.imageUrl.toString();
    //   },
    // ).then(
    //   (value) {
    //     _cachedImageFuture = _getCachedImageFile(url);
    //   },
    // );
  }

  TextEditingController searchNumber = TextEditingController();
  CrossAxisAlignment getColumnAlignment(String text) {
    return getTextDirection(text) == TextDirection.rtl
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.end;
  }

  MainAxisAlignment getRowAlignment(String text) {
    return getTextDirection(text) == TextDirection.rtl
        ? MainAxisAlignment.start
        : MainAxisAlignment.end;
  }

  bool writerVisible = true;
  TextDirection getTextDirection(String text) {
    // بررسی حروف فارسی و عربی
    final rtlRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]');
    if (rtlRegex.hasMatch(text)) {
      return TextDirection.rtl;
    } else {
      writerVisible = false;
      // اگر حروف لاتین باشد
      return TextDirection.ltr;
    }
  }

  Future<void> _loadBookDetails() async {
    try {
      // دریافت جزئیات کتاب
      await getBookDetails(context: context, bookId: widget.bookId);

      if (BookDetailState.bookDetail != null) {
        // مقداردهی به URL تصویر
        url = BookDetailState.bookDetail!.imageUrl.toString();

        // بارگذاری تصویر کش شده
        setState(() {
          _cachedImageFuture =
              _getCachedImageFile(url); // مقداردهی به _cachedImageFuture
          isLoading =
              false; // بعد از بارگذاری تصویر وضعیت بارگذاری را تغییر می‌دهیم
        });
      }
    } catch (e) {
      // مدیریت خطا
      print("Error loading book details: $e");
    }
  }

  Future<File> _getCachedImageFile(String url) async {
    try {
      // استفاده از cache manager برای دانلود و کش کردن فایل تصویر
      var file = await DefaultCacheManager().getSingleFile(url);
      return file; // فایل کش شده تصویر
    } catch (e) {
      // مدیریت خطا در بارگذاری فایل
      print("Error caching image: $e");
      rethrow;
    }
  }
  // Future<File> _getCachedImageFile(String url) async {
  //   // استفاده از cache manager برای دانلود و کش کردن فایل تصویر
  //   var file = await DefaultCacheManager().getSingleFile(url);
  //   return file; // فایل کش شده تصویر
  // }

  late String url;

  bool descVisible = false;
  bool loadingVisible = true;
  bool shopCardPhisicalVisible = true;
  bool loadingPhisicalVisible = true;
  bool shelfVisible = false;
  bool readVisible = false;
  bool likeVisible = false;
  bool shopCardVisible = true;

  double _rating = 3.0;
  bool saveVisible = true;
  void _sharePage(BuildContext context, String? bookId) {
    // final String link = 'https://translate.google.com';
    // final String link =
    //     'https://nikoobook.com/target-page?bookId=${bookId ?? ''}';
    final String link = 'https://nikoobook.com';
    Share.share('Check out this page: $link');
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, MyRoutes.profileScreen);
                                    },
                                    icon: Image(
                                      image: AssetImage(
                                          'lib/assets/images/miniicon.png'),
                                      width: 15,
                                    )),
                                SizedBox(
                                  height: 20,
                                  width: 1,
                                  child: VerticalDivider(),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, MyRoutes.shopCardScreen);
                                    },
                                    icon: Image(
                                      image: AssetImage(
                                          'lib/assets/images/handbag.png'),
                                      width: 15,
                                    )),
                                SizedBox(
                                  height: 20,
                                  width: 1,
                                  child: VerticalDivider(),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.home_outlined,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.navigationBarScreen);
                                  },
                                )
                              ],
                            ),
                            // Consumer<BookDetailState>(
                            //   builder: (context, value, child) => SizedBox(
                            //     width: 250,
                            //     child: AutoSizeText(
                            //       textDirection: getTextDirection(
                            //           BookDetailState.bookDetail!.title
                            //               .toString()),
                            //       minFontSize: 8,
                            //       maxLines: 2,
                            //       BookDetailState.bookDetail!.title!
                            //           .replaceAll("*", ""),
                            //       style: GoogleFonts.vazirmatn(
                            //           fontSize: 10,
                            //           fontWeight: FontWeight.w500,
                            //           color: primaryColor),
                            //     ),
                            //   ),
                            // ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.navigationBarScreen);
                                // context.read<BookDetailState>().reset();
                              },
                              icon: Icon(
                                Icons.close,
                                size: 20,
                              ),
                            )
                            // Image(
                            //   image: AssetImage(
                            //       'lib/assets/images/logo.png'),
                            //   width: 70,
                            // )
                          ],
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 30,
                          child: TextField(
                            controller: searchNumber,
                            onSubmitted: (value) {
                              searchAndFillter(
                                context: context,
                                body: BookSearchDto(name: searchNumber.text),
                              ).then(
                                (value) {
                                  Navigator.pushNamed(
                                      context, MyRoutes.searchFillterScreen);
                                },
                              );
                            },
                            cursorHeight: 20,
                            textAlignVertical: TextAlignVertical
                                .center, // مرکز قرار دادن عمودی متن
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12), // تنظیم عمودی محتوا
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              label: Text(
                                'جستجو در نیکو بوک',
                                style: GoogleFonts.vazirmatn(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              filled: true,
                              fillColor: backgroundColor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Consumer<BookDetailState>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 0),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Consumer<BookDetailState>(
                            builder: (context, bookDetailState, child) {
                              // اگر هنوز بارگذاری تمام نشده باشد
                              if (isLoading) {
                                return SizedBox(
                                  height: 280,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 0.5,
                                  )),
                                );
                              }

                              // اگر تصویر کش شده وجود داشته باشد
                              return _cachedImageFuture != null
                                  ? SizedBox(
                                      width: 200,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: FutureBuilder<File>(
                                          future: _cachedImageFuture!,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              if (snapshot.hasData) {
                                                return Image.file(
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Center(
                                                    child: Text(
                                                      'خطا در بارگزاری تصویر',
                                                      style:
                                                          GoogleFonts.vazirmatn(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ),
                                                  snapshot.data!,
                                                  fit: BoxFit.fill,
                                                );
                                              } else {
                                                return SizedBox(
                                                  height: 180,
                                                  child: Center(
                                                    child: Text(
                                                      'خطا در بارگزاری تصویر',
                                                      style:
                                                          GoogleFonts.vazirmatn(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                  ),
                                                );
                                              }
                                            } else if (snapshot
                                                    .connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        strokeWidth: 0.5),
                                              );
                                            } else {
                                              return SizedBox(
                                                height: 180,
                                                child: Center(
                                                  child: Text(
                                                    'بارگذاری تصویر...',
                                                    style:
                                                        GoogleFonts.vazirmatn(
                                                            color: Colors.grey),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  : SizedBox(height: 300);
                            },
                          ),

                          // SizedBox(
                          //   width: 200,
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(10),
                          //     child: FutureBuilder<File>(
                          //       future: _cachedImageFuture,
                          //       builder: (context, snapshot) {
                          //         if (snapshot.connectionState ==
                          //             ConnectionState.done) {
                          //           if (snapshot.hasData) {
                          //             return Image.file(
                          //               snapshot.data!,
                          //               fit: BoxFit.fill,
                          //             );
                          //           } else {
                          //             return SizedBox(
                          //               height: 180,
                          //               child: Center(
                          //                 child: Text(
                          //                   'خطا در بارگزاری تصویر',
                          //                   style: GoogleFonts.vazirmatn(
                          //                       color: Colors.grey),
                          //                 ),
                          //               ),
                          //             );
                          //           }
                          //         } else {
                          //           return Center(
                          //             child: CircularProgressIndicator(
                          //               strokeWidth: 0.5,
                          //             ),
                          //           );
                          //         }
                          //       },
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: AutoSizeText(
                                  textAlign: TextAlign.center,
                                  textDirection: getTextDirection(
                                      BookDetailState.bookDetail!.title
                                          .toString()),
                                  minFontSize: 12,
                                  maxLines: 2,
                                  BookDetailState.bookDetail!.title!
                                      .replaceAll("*", ""),
                                  style: GoogleFonts.vazirmatn(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      _sharePage(context, widget.bookId),
                                  child: Icon(
                                    Icons.share,
                                    size: 27,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Visibility(
                                  visible: saveVisible,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        saveVisible = !saveVisible;
                                      });
                                      addBookSave(
                                          context: context,
                                          bookId:
                                              BookDetailState.bookDetail!.id,
                                          st: SaveType.like);
                                    },
                                    child: Icon(Icons.bookmark),
                                  ),
                                  replacement: InkWell(
                                    onTap: () {
                                      setState(() {
                                        saveVisible = !saveVisible;
                                      });
                                      addBookSave(
                                          context: context,
                                          bookId:
                                              BookDetailState.bookDetail!.id,
                                          st: SaveType.like);
                                    },
                                    child: Icon(
                                      Icons.bookmark_outline,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            replacement: Column(
                              children: [
                                Center(
                                  child: AutoSizeText(
                                    textDirection: getTextDirection(
                                        BookDetailState.bookDetail!.nevisande
                                            .toString()),
                                    minFontSize: 8,
                                    maxLines: 3,
                                    BookDetailState.bookDetail!.nevisande !=
                                            null
                                        ? BookDetailState.bookDetail!.nevisande!
                                            .replaceAll("*", "")
                                        : "",
                                    style: GoogleFonts.vazirmatn(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                              ],
                            ),
                            visible: writerVisible,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: AutoSizeText(
                                    textDirection: getTextDirection(
                                        BookDetailState.bookDetail!.nevisande
                                            .toString()),
                                    minFontSize: 8,
                                    maxLines: 3,
                                    BookDetailState.bookDetail!.nevisande !=
                                            null
                                        ? BookDetailState.bookDetail!.nevisande!
                                            .replaceAll("*", "")
                                        : "",
                                    style: GoogleFonts.vazirmatn(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Icon(
                                              Icons.star,
                                              size: 20,
                                              color: Colors.amber,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${BookDetailState.bookDetail!.rating.toString().toPersianNumbers()}",
                                                style: GoogleFonts.vazirmatn(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2),
                                                child: Text(
                                                  " ( ${BookDetailState.bookDetail!.viewCount.toString().toPersianNumbers()} )",
                                                  style: GoogleFonts.vazirmatn(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 7),
                                                child: Icon(
                                                  Icons.description_outlined,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            textDirection: TextDirection.rtl,
                                            BookDetailState.bookDetail!.price
                                                .toString()
                                                .toPersianNumbers()
                                                .formatNumber(),
                                            style: GoogleFonts.vazirmatn(
                                                decoration: BookDetailState
                                                            .bookDetail!
                                                            .discountPrice !=
                                                        0
                                                    ? TextDecoration.lineThrough
                                                    : TextDecoration.none,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            textDirection: TextDirection.rtl,
                                            ' تومان ',
                                            style: GoogleFonts.vazirmatn(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  BookDetailState.bookDetail!.discountPrice != 0
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              textDirection: TextDirection.rtl,
                                              BookDetailState
                                                  .bookDetail!.totalPrice
                                                  .toString()
                                                  .toPersianNumbers()
                                                  .formatNumber(),
                                              style: GoogleFonts.vazirmatn(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              textDirection: TextDirection.rtl,
                                              ' تومان ',
                                              style: GoogleFonts.vazirmatn(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BookDetailState.bookDetail!.zirNazar != null
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'زیر نظر : ',
                                                style: GoogleFonts.vazirmatn(
                                                    color: Color.fromARGB(
                                                        255, 30, 133, 56),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 1.5),
                                                child: AutoSizeText(
                                                  textDirection:
                                                      getTextDirection(
                                                          BookDetailState
                                                              .bookDetail!
                                                              .zirNazar
                                                              .toString()),
                                                  minFontSize: 10,
                                                  maxLines: 1,
                                                  BookDetailState.bookDetail!
                                                              .zirNazar !=
                                                          null
                                                      ? BookDetailState
                                                          .bookDetail!.zirNazar!
                                                          .replaceAll("*", "")
                                                      : "",
                                                  style: GoogleFonts.vazirmatn(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: primaryColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  BookDetailState.bookDetail!.motarjem != null
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,

                                            // آیتم‌ها در یک راستا قرار می‌گیرند
                                            children: [
                                              Text(
                                                'مترجمین : ',
                                                style: GoogleFonts.vazirmatn(
                                                  color: const Color.fromARGB(
                                                      255, 30, 133, 56),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              // حذف Expanded و استفاده از Flexible برای حفظ اندازه متن
                                              Flexible(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2),
                                                  child: AutoSizeText(
                                                    BookDetailState
                                                        .bookDetail!.motarjem!
                                                        .replaceAll("*",
                                                            ""), // فقط محتوای موردنیاز را نشان دهید
                                                    textDirection:
                                                        getTextDirection(
                                                      BookDetailState
                                                          .bookDetail!.motarjem
                                                          .toString(),
                                                    ),
                                                    minFontSize: 10,
                                                    maxLines: 3,
                                                    style:
                                                        GoogleFonts.vazirmatn(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Visibility(
                                    replacement: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        'مطالعه کتاب',
                                        style: GoogleFonts.vazirmatn(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      minWidth: 180,
                                      color: Colors.black,
                                      onPressed: () async {
                                        Navigator.pushNamed(
                                            context, MyRoutes.pdfScreen,
                                            arguments: BookDetailState
                                                .bookDetail!.pdfLink
                                                .toString());
                                      },
                                    ),
                                    visible:
                                        BookDetailState.bookDetail!.buy == true
                                            ? false
                                            : true,
                                    child: Column(
                                      children: [
                                        IgnorePointer(
                                          ignoring:
                                              shopCardPhisicalVisible == false
                                                  ? true
                                                  : false,
                                          child: Visibility(
                                            replacement: MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                'مشاهده سبدخرید',
                                                style: GoogleFonts.vazirmatn(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              minWidth: 180,
                                              color: Colors.black,
                                              onPressed: () async {
                                                Navigator.pushNamed(context,
                                                    MyRoutes.shopCardScreen);
                                              },
                                            ),
                                            visible: shopCardVisible,
                                            child: Visibility(
                                              replacement: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                  'مشاهده سبدخرید',
                                                  style: GoogleFonts.vazirmatn(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                minWidth: 180,
                                                color: Colors.black,
                                                onPressed: () async {
                                                  Navigator.pushNamed(context,
                                                      MyRoutes.shopCardScreen);
                                                },
                                              ),
                                              visible: loadingVisible,
                                              child: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                  'خرید کتاب',
                                                  style: GoogleFonts.vazirmatn(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                minWidth: 180,
                                                color: Colors.black,
                                                onPressed: () async {
                                                  getShopCardList(
                                                      context: context);
                                                  setState(() {
                                                    loadingVisible = false;
                                                  });
                                                  addOrRemoveBook(
                                                          context: context,
                                                          remove: false,
                                                          bookId:
                                                              BookDetailState
                                                                  .bookDetail!
                                                                  .id
                                                                  .toString())
                                                      .then(
                                                    (value) {
                                                      setState(() {
                                                        loadingVisible = true;
                                                        shopCardVisible = false;
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                style: GoogleFonts.vazirmatn(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                'کتاب با موفقیت به سبد خرید اضافه شد'),
                                                          ),
                                                        );
                                                      });
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            'مشاهده نمونه',
                                            style: GoogleFonts.vazirmatn(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          minWidth: 180,
                                          color: Colors.black,
                                          onPressed: () async {
                                            Navigator.pushNamed(
                                                context, MyRoutes.pdfScreen,
                                                arguments: BookDetailState
                                                    .bookDetail!.samplePdfLink
                                                    .toString());
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                    visible: BookDetailState.bookDetail!.buy!,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.verified,
                                            size: 17,
                                            color: Color.fromARGB(
                                                255, 30, 133, 56),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'شما این کتاب را خریده اید',
                                            style: GoogleFonts.vazirmatn(
                                                color: Color.fromARGB(
                                                    255, 30, 133, 56),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8),
                                        child: AutoSizeText(
                                          textDirection: getTextDirection(
                                              BookDetailState.bookDetail!.title
                                                  .toString()),
                                          minFontSize: 12,
                                          maxLines: 2,
                                          BookDetailState.bookDetail!.title !=
                                                  null
                                              ? BookDetailState
                                                  .bookDetail!.title!
                                                  .replaceAll("*", "")
                                              : "",
                                          style: GoogleFonts.vazirmatn(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AutoSizeText(
                                          overflow: TextOverflow.ellipsis,
                                          textDirection: getTextDirection(
                                              BookDetailState
                                                  .bookDetail!.description
                                                  .toString()),
                                          minFontSize: 10,
                                          maxLines: 5,
                                          BookDetailState
                                              .bookDetail!.description!
                                              .replaceAll("*", ""),
                                          style: GoogleFonts.vazirmatn(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                            child: Container(
                                              width: 300,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Directionality(
                                                        textDirection:
                                                            getTextDirection(
                                                                BookDetailState
                                                                    .bookDetail!
                                                                    .title
                                                                    .toString()),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 250,
                                                              child:
                                                                  AutoSizeText(
                                                                textDirection: getTextDirection(
                                                                    BookDetailState
                                                                        .bookDetail!
                                                                        .title
                                                                        .toString()),
                                                                minFontSize: 12,
                                                                maxLines: 3,
                                                                BookDetailState
                                                                    .bookDetail!
                                                                    .title!
                                                                    .replaceAll(
                                                                        "*",
                                                                        ""),
                                                                style: GoogleFonts.vazirmatn(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        primaryColor),
                                                              ),
                                                            ),
                                                            InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                  Icons.close,
                                                                  size: 20,
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      AutoSizeText(
                                                        textDirection:
                                                            getTextDirection(
                                                                BookDetailState
                                                                    .bookDetail!
                                                                    .description
                                                                    .toString()),
                                                        minFontSize: 10,
                                                        BookDetailState
                                                            .bookDetail!
                                                            .description!
                                                            .replaceAll(
                                                                "*", ""),
                                                        style: GoogleFonts
                                                            .vazirmatn(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    primaryColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '... توضیحات بیشتر',
                                            style: GoogleFonts.vazirmatn(
                                              color: Color.fromARGB(
                                                  255, 30, 133, 56),
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'دسته ها : ',
                                        style: GoogleFonts.vazirmatn(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: BookDetailState
                                          .bookDetail!.bookCategories!.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: CategoryTextCard(
                                          name: BookDetailState
                                              .bookDetail!
                                              .bookCategories![index]
                                              .categoryTitle
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.coins,
                                          size: 30,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 2),
                                              left: BorderSide(width: 2),
                                              right: BorderSide(width: 0.1),
                                              top: BorderSide(width: 0.1))),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${BookDetailState.bookDetail!.pdfSize != null ? BookDetailState.bookDetail!.pdfSize.toString().toPersianNumbers().replaceAll('مگ', "") : ''}',
                                          style: GoogleFonts.vazirmatn(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 0,
                                        ),
                                        Text(
                                          'مگابایت',
                                          style: GoogleFonts.vazirmatn(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Icon(
                                        Icons.auto_stories_outlined,
                                        size: 35,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 2),
                                              left: BorderSide(width: 2),
                                              right: BorderSide(width: 0.1),
                                              top: BorderSide(width: 0.1))),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${BookDetailState.bookDetail!.pages != null ? BookDetailState.bookDetail!.pages.toString().toPersianNumbers() : ''}',
                                          style: GoogleFonts.vazirmatn(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          'صفحه',
                                          style: GoogleFonts.vazirmatn(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.filePdf,
                                          size: 30,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 2),
                                              left: BorderSide(width: 2),
                                              right: BorderSide(width: 0.1),
                                              top: BorderSide(width: 0.1))),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'PDF',
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                            child: Container(
                                                width: 300,
                                                child:
                                                    Consumer<BookDetailState>(
                                                  builder:
                                                      (context, value, child) =>
                                                          SizedBox(
                                                    child: Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 20,
                                                                vertical: 20),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'شناسنامه',
                                                                  style: GoogleFonts.vazirmatn(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    size: 23,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .sarparastMotarjem !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'سرپرست مترجمین : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.sarparastMotarjem.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .sarparastMoalef !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'سرپرست مولفین : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.sarparastMoalef.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .baHamkari !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'با همکاری : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.baHamkari.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .beKooshesh !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'به کوشش : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.beKooshesh.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .gerdAvariVaTaalif !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'گردآوری و تالیف : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.gerdAvariVaTaalif.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .baMoqadameVaNezarat !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'با مقدمه و نظارت : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.baMoqadameVaNezarat.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .virastar !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'ویراستار : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.virastar.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .virastarElmi !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'ویراستار علمی : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.virastarElmi.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .virayeshElmi !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'ویرایش علمی : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.virayeshElmi.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox
                                                                    .shrink(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .nobatChap !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'نوبت چاپ : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.nobatChap.toString().toPersianNumbers(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .tarikhChap !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'تاریخ چاپ : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.tarikhChap.toString().toPersianNumbers(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .rangChap !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'رنگ چاپ : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.rangChap.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .qatKetab !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'قطع کتاب : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.qatKetab.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .noSahafi !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'نوع صحافی : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.noSahafi.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .noKaqaz !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'نوع کاغذ : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.noKaqaz.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .shomareShabak !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'شماره شابک : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.shomareShabak!.toPersianNumbers(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .formatMohtava !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'فرمت محتوا : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.formatMohtava.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .zamanMotalee !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'زمان تقریبی مطالعه : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.zamanMotalee!.toPersianNumbers(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .zaban !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'زبان : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.zaban.toString(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .qeymatArzi !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'قیمت ارزی ( دلار ) : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                " \$ ",
                                                                                style: GoogleFonts.vazirmatn(color: Colors.grey.shade600, fontWeight: FontWeight.w500, fontSize: 10),
                                                                              ),
                                                                              Text(
                                                                                BookDetailState.bookDetail!.qeymatArzi!.toPersianNumbers().formatNumber(),
                                                                                style: GoogleFonts.vazirmatn(color: Colors.grey.shade600, fontWeight: FontWeight.w500, fontSize: 12),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Divider(),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                            BookDetailState
                                                                        .bookDetail!
                                                                        .zirNazar !=
                                                                    null
                                                                ? Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'قیمت چاپی : ',
                                                                            style:
                                                                                GoogleFonts.vazirmatn(fontWeight: FontWeight.w500, fontSize: 12),
                                                                          ),
                                                                          Text(
                                                                            BookDetailState.bookDetail!.qeymatChapi!.toString().toPersianNumbers().formatNumber(),
                                                                            style: GoogleFonts.vazirmatn(
                                                                                color: Colors.grey.shade600,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 12),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  )
                                                                : SizedBox(),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ))));
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: Icon(
                                          Icons.pending_outlined,
                                          size: 35,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(width: 2),
                                                left: BorderSide(width: 2),
                                                right: BorderSide(width: 0.1),
                                                top: BorderSide(width: 0.1))),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'بیشتر',
                                        style: GoogleFonts.vazirmatn(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Divider(
                                thickness: 0.5,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.toc,
                                      size: 33,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'فهرست مطالب',
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap:
                                      BookDetailState.bookDetail!.fehrestUrl !=
                                              null
                                          ? () {
                                              Navigator.pushNamed(
                                                  context, MyRoutes.listScreen,
                                                  arguments: BookDetailState
                                                      .bookDetail!.fehrestUrl
                                                      .toString());
                                            }
                                          : null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                      color: BookDetailState
                                                  .bookDetail!.fehrestUrl !=
                                              null
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                        child: Icon(
                                          Icons.local_library_outlined,
                                          size: 35,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 0.1),
                                              left: BorderSide(width: 0.1),
                                              right: BorderSide(width: 2),
                                              top: BorderSide(width: 2))),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'مطالعه شده',
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Visibility(
                                        replacement: Icon(
                                          Icons.bookmark,
                                          size: 35,
                                        ),
                                        visible:
                                            BookDetailState.bookDetail!.like ==
                                                    true
                                                ? false
                                                : true,
                                        child: Icon(
                                          Icons.bookmark_border_outlined,
                                          size: 35,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 0.1),
                                              left: BorderSide(width: 0.1),
                                              right: BorderSide(width: 2),
                                              top: BorderSide(width: 2))),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'نشان شده',
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                        child: Icon(
                                          Icons.library_books_outlined,
                                          size: 30,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(width: 0.1),
                                              left: BorderSide(width: 0.1),
                                              right: BorderSide(width: 2),
                                              top: BorderSide(width: 2))),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'کتابخانه',
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Consumer<BookDetailState>(
                          builder: (context, value, child) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.ratingScreen,
                                  arguments: BookDetailState.bookDetail!.id);
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'نقد و امتیاز من',
                                          style: GoogleFonts.vazirmatn(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RatingBar(
                                  ignoreGestures: true,
                                  updateOnDrag: false,
                                  onRatingUpdate: (value) {},
                                  initialRating:
                                      BookDetailState.bookDetail!.myReview !=
                                              null
                                          ? BookDetailState
                                              .bookDetail!.myReview!.rate!
                                              .toDouble()
                                          : 0,
                                  wrapAlignment: WrapAlignment.center,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 12),
                                  itemSize: 40,
                                  itemCount: 5,
                                  unratedColor: Colors.amber,
                                  ratingWidget: RatingWidget(
                                    full: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: Colors.amber)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    half: Icon(Icons.star),
                                    empty: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.grade_outlined,
                                          color: Colors.grey,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        Text(
                                          '  ${BookDetailState.bookDetail!.rating.toString()}' +
                                              " از " +
                                              "5",
                                          style: GoogleFonts.vazirmatn(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Text(
                                        "بر اساس رأی ${BookDetailState.bookDetail!.bookReviewss!.length.toString()} مخاطب",
                                        style: GoogleFonts.vazirmatn(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 165,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              '5  ',
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 10),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                value: List.generate(
                                                        BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length,
                                                        (index) =>
                                                            BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .where(
                                                              (element) =>
                                                                  BookDetailState
                                                                      .bookDetail!
                                                                      .bookReviewss![
                                                                          index]
                                                                      .rate ==
                                                                  5,
                                                            )).length /
                                                    (BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .length !=
                                                            0
                                                        ? BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length
                                                        : 1),
                                                minHeight: 5,
                                                color: Colors.amber,
                                                backgroundColor:
                                                    Colors.grey[300],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              '4  ',
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 10),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                value: List.generate(
                                                        BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length,
                                                        (index) =>
                                                            BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .where(
                                                              (element) =>
                                                                  BookDetailState
                                                                      .bookDetail!
                                                                      .bookReviewss![
                                                                          index]
                                                                      .rate ==
                                                                  4,
                                                            )).length /
                                                    (BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .length !=
                                                            0
                                                        ? BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length
                                                        : 1),
                                                minHeight: 5,
                                                color: Colors.amber,
                                                backgroundColor:
                                                    Colors.grey[300],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              '3  ',
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 10),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                value: List.generate(
                                                        BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length,
                                                        (index) =>
                                                            BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .where(
                                                              (element) =>
                                                                  BookDetailState
                                                                      .bookDetail!
                                                                      .bookReviewss![
                                                                          index]
                                                                      .rate ==
                                                                  3,
                                                            )).length /
                                                    (BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .length !=
                                                            0
                                                        ? BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length
                                                        : 1),
                                                minHeight: 5,
                                                color: Colors.amber,
                                                backgroundColor:
                                                    Colors.grey[300],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              '2  ',
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 10),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                value: List.generate(
                                                        BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length,
                                                        (index) =>
                                                            BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .where(
                                                              (element) =>
                                                                  BookDetailState
                                                                      .bookDetail!
                                                                      .bookReviewss![
                                                                          index]
                                                                      .rate ==
                                                                  2,
                                                            )).length /
                                                    (BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .length !=
                                                            0
                                                        ? BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length
                                                        : 1),
                                                minHeight: 5,
                                                color: Colors.amber,
                                                backgroundColor:
                                                    Colors.grey[300],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              '1  ',
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 10),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                value: List.generate(
                                                        BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length,
                                                        (index) =>
                                                            BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .where(
                                                              (element) =>
                                                                  BookDetailState
                                                                      .bookDetail!
                                                                      .bookReviewss![
                                                                          index]
                                                                      .rate ==
                                                                  1,
                                                            )).length /
                                                    (BookDetailState
                                                                .bookDetail!
                                                                .bookReviewss!
                                                                .length !=
                                                            0
                                                        ? BookDetailState
                                                            .bookDetail!
                                                            .bookReviewss!
                                                            .length
                                                        : 1),
                                                minHeight: 5,
                                                color: Colors.amber,
                                                backgroundColor:
                                                    Colors.grey[300],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  BookDetailState.bookDetail!.bookReviewss!.length != 0
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 5, top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListView.builder(
                              itemCount: BookDetailState
                                  .bookDetail!.bookReviewss!.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: Image(
                                                image: AssetImage(
                                                    'lib/assets/images/iconcm.png'),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey.shade400),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                BookDetailState
                                                    .bookDetail!
                                                    .bookReviewss![index]
                                                    .userFirstName
                                                    .toString(),
                                                style: GoogleFonts.vazirmatn(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                BookDetailState
                                                    .bookDetail!
                                                    .bookReviewss![index]
                                                    .userLastName
                                                    .toString(),
                                                style: GoogleFonts.vazirmatn(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "1402-05-05",
                                            style: GoogleFonts.vazirmatn(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '5 ',
                                            style: GoogleFonts.vazirmatn(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 22,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                      BookDetailState.bookDetail!
                                          .bookReviewss![index].message
                                          .toString()),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Divider(
                                      thickness: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 8),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Row(
                                  //         children: [
                                  //           Image(
                                  //             image: AssetImage(
                                  //                 'lib/assets/images/like.png'),
                                  //             width: 20,
                                  //             height: 20,
                                  //           ),
                                  //           SizedBox(
                                  //             width: 5,
                                  //           ),
                                  //           Text(
                                  //             '10',
                                  //             style: GoogleFonts.vazirmatn(
                                  //                 color: Colors.grey,
                                  //                 fontSize: 12),
                                  //           ),
                                  //           SizedBox(
                                  //             width: 15,
                                  //           ),
                                  //           Image(
                                  //             image: AssetImage(
                                  //                 'lib/assets/images/pm.png'),
                                  //             width: 21,
                                  //             height: 21,
                                  //           ),
                                  //           SizedBox(
                                  //             width: 5,
                                  //           ),
                                  //           Text(
                                  //             '10',
                                  //             style: GoogleFonts.vazirmatn(
                                  //                 color: Colors.grey,
                                  //                 fontSize: 12),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       Padding(
                                  //         padding: const EdgeInsets.only(
                                  //             bottom: 5),
                                  //         child: Image(
                                  //           image: AssetImage(
                                  //               'lib/assets/images/!.png'),
                                  //           fit: BoxFit.cover,
                                  //           width: 21,
                                  //           height: 21,
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, bottom: 5, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'از همین دسته بخوانید',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'همه',
                                          style: GoogleFonts.vazirmatn(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 10,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                                child: ListView.builder(
                                  itemCount: BookDetailState
                                      .bookDetail!.similarBooks!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BookCardWidget(
                                      discountCount:
                                          "${((BookDetailState.bookDetail!.similarBooks![index].price! - BookDetailState.bookDetail!.similarBooks![index].totalPrice!) / BookDetailState.bookDetail!.similarBooks![index].price! * 100).toStringAsFixed(0)}",
                                      discountPrice: BookDetailState.bookDetail!
                                          .similarBooks![index].totalPrice
                                          .toString(),
                                      viewCont: BookDetailState.bookDetail!
                                          .similarBooks![index].viewCount!,
                                      bookId: BookDetailState
                                          .bookDetail!.similarBooks![index].id!,
                                      bookWriter: BookDetailState.bookDetail!
                                          .similarBooks![index].nevisande
                                          .toString(),
                                      bookRate: BookDetailState.bookDetail!
                                          .similarBooks![index].rating!
                                          .toDouble(),
                                      bookPrice: BookDetailState.bookDetail!
                                          .similarBooks![index].price
                                          .toString(),
                                      bookName: BookDetailState.bookDetail!
                                          .similarBooks![index].title
                                          .toString(),
                                      bookImage: BookDetailState.bookDetail!
                                          .similarBooks![index].imageUrl
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 15, right: 15, bottom: 5, top: 5),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(10),
                  //       child: Column(
                  //         children: [
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text(
                  //                 'گذاشتن این عنوان در ...',
                  //                 style: GoogleFonts.rubik(
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 12),
                  //               ),
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             height: 15,
                  //           ),
                  //           Padding(
                  //             padding:
                  //                 const EdgeInsets.symmetric(horizontal: 25),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 // SizedBox(
                  //                 //   width: 80,
                  //                 //   child: Visibility(
                  //                 //     child: InkWell(
                  //                 //       onTap: () {
                  //                 //         setState(() {
                  //                 //           shelfVisible = !shelfVisible;
                  //                 //         });
                  //                 //         addBookSave(
                  //                 //             context: context,
                  //                 //             bookId: BookDetailState
                  //                 //                 .bookDetail!.id,
                  //                 //             st: SaveType.shelf);
                  //                 //       },
                  //                 //       child: Column(
                  //                 //         children: [
                  //                 //           Container(
                  //                 //             child: Padding(
                  //                 //               padding:
                  //                 //                   const EdgeInsets.all(13),
                  //                 //               child: Image(
                  //                 //                 color: Colors.white,
                  //                 //                 image: AssetImage(
                  //                 //                     'lib/assets/images/library.png'),
                  //                 //               ),
                  //                 //             ),
                  //                 //             width: 55,
                  //                 //             height: 55,
                  //                 //             decoration: BoxDecoration(
                  //                 //                 color: secondaryColor,
                  //                 //                 border: Border.all(
                  //                 //                     color: Colors.grey,
                  //                 //                     width: 0.5),
                  //                 //                 borderRadius:
                  //                 //                     BorderRadius.circular(8)),
                  //                 //           ),
                  //                 //           SizedBox(
                  //                 //             height: 3,
                  //                 //           ),
                  //                 //           Padding(
                  //                 //             padding: const EdgeInsets.only(
                  //                 //                 right: 15),
                  //                 //             child: Row(
                  //                 //               children: [
                  //                 //                 Text(
                  //                 //                   'کتابخانه من',
                  //                 //                   style: GoogleFonts.vazirmatn(
                  //                 //                       fontSize: 12,
                  //                 //                       fontWeight:
                  //                 //                           FontWeight.w500),
                  //                 //                 ),
                  //                 //                 Icon(
                  //                 //                   Icons.done,
                  //                 //                   size: 12,
                  //                 //                   color: Colors.green,
                  //                 //                 ),
                  //                 //               ],
                  //                 //             ),
                  //                 //           ),
                  //                 //         ],
                  //                 //       ),
                  //                 //     ),
                  //                 //     visible: shelfVisible,
                  //                 //     replacement: InkWell(
                  //                 //       onTap: () {
                  //                 //         setState(() {
                  //                 //           shelfVisible = !shelfVisible;
                  //                 //         });
                  //                 //         addBookSave(
                  //                 //             context: context,
                  //                 //             bookId: BookDetailState
                  //                 //                 .bookDetail!.id,
                  //                 //             st: SaveType.shelf);
                  //                 //       },
                  //                 //       child: Column(
                  //                 //         children: [
                  //                 //           Container(
                  //                 //             child: Padding(
                  //                 //               padding:
                  //                 //                   const EdgeInsets.all(13),
                  //                 //               child: Image(
                  //                 //                 image: AssetImage(
                  //                 //                     'lib/assets/images/library.png'),
                  //                 //               ),
                  //                 //             ),
                  //                 //             width: 55,
                  //                 //             height: 55,
                  //                 //             decoration: BoxDecoration(
                  //                 //                 border: Border.all(
                  //                 //                     color: Colors.grey,
                  //                 //                     width: 0.5),
                  //                 //                 borderRadius:
                  //                 //                     BorderRadius.circular(8)),
                  //                 //           ),
                  //                 //           SizedBox(
                  //                 //             height: 3,
                  //                 //           ),
                  //                 //           Text(
                  //                 //             'کتابخانه من',
                  //                 //             style: GoogleFonts.vazirmatn(
                  //                 //                 fontSize: 12,
                  //                 //                 fontWeight: FontWeight.w500),
                  //                 //           ),
                  //                 //         ],
                  //                 //       ),
                  //                 //     ),
                  //                 //   ),
                  //                 // ),
                  //                 SizedBox(
                  //                   width: 80,
                  //                   child: Visibility(
                  //                     child: InkWell(
                  //                       onTap: () {
                  //                         setState(() {
                  //                           saveVisible = !saveVisible;
                  //                         });
                  //                         addBookSave(
                  //                             context: context,
                  //                             bookId: BookDetailState
                  //                                 .bookDetail!.id,
                  //                             st: SaveType.like);
                  //                       },
                  //                       child: Column(
                  //                         children: [
                  //                           Container(
                  //                             child: Padding(
                  //                               padding:
                  //                                   const EdgeInsets.all(5),
                  //                               child: Image(
                  //                                 color: Colors.white,
                  //                                 image: AssetImage(
                  //                                     'lib/assets/images/saves.png'),
                  //                               ),
                  //                             ),
                  //                             width: 55,
                  //                             height: 55,
                  //                             decoration: BoxDecoration(
                  //                                 color: secondaryColor,
                  //                                 border: Border.all(
                  //                                     color: Colors.grey,
                  //                                     width: 0.5),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(8)),
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3,
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(
                  //                                 right: 11),
                  //                             child: Row(
                  //                               children: [
                  //                                 Text(
                  //                                   'نشان شده ها',
                  //                                   style:
                  //                                       GoogleFonts.vazirmatn(
                  //                                           fontSize: 12,
                  //                                           fontWeight:
                  //                                               FontWeight
                  //                                                   .w500),
                  //                                 ),
                  //                                 Icon(
                  //                                   Icons.done,
                  //                                   size: 12,
                  //                                   color: Colors.green,
                  //                                 )
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                     visible: saveVisible,
                  //                     replacement: InkWell(
                  //                       onTap: () {
                  //                         setState(() {
                  //                           saveVisible = !saveVisible;
                  //                         });
                  //                         addBookSave(
                  //                             context: context,
                  //                             bookId: BookDetailState
                  //                                 .bookDetail!.id,
                  //                             st: SaveType.like);
                  //                       },
                  //                       child: Column(
                  //                         children: [
                  //                           Container(
                  //                             child: Padding(
                  //                               padding:
                  //                                   const EdgeInsets.all(5),
                  //                               child: Image(
                  //                                 image: AssetImage(
                  //                                     'lib/assets/images/saves.png'),
                  //                               ),
                  //                             ),
                  //                             width: 55,
                  //                             height: 55,
                  //                             decoration: BoxDecoration(
                  //                                 border: Border.all(
                  //                                     color: Colors.grey,
                  //                                     width: 0.5),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(8)),
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3,
                  //                           ),
                  //                           Text(
                  //                             'نشان شده ها',
                  //                             style: GoogleFonts.vazirmatn(
                  //                                 fontSize: 12,
                  //                                 fontWeight: FontWeight.w500),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   width: 80,
                  //                   child: Visibility(
                  //                     child: InkWell(
                  //                       onTap: () {
                  //                         setState(() {
                  //                           readVisible = !readVisible;
                  //                         });
                  //                         addBookSave(
                  //                             context: context,
                  //                             bookId: BookDetailState
                  //                                 .bookDetail!.id,
                  //                             st: SaveType.read);
                  //                       },
                  //                       child: Column(
                  //                         children: [
                  //                           Container(
                  //                             child: Padding(
                  //                               padding:
                  //                                   const EdgeInsets.all(10),
                  //                               child: Image(
                  //                                 color: Colors.white,
                  //                                 image: AssetImage(
                  //                                     'lib/assets/images/readed.png'),
                  //                               ),
                  //                             ),
                  //                             width: 55,
                  //                             height: 55,
                  //                             decoration: BoxDecoration(
                  //                                 color: secondaryColor,
                  //                                 border: Border.all(
                  //                                     color: Colors.grey,
                  //                                     width: 0.5),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(8)),
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3,
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(
                  //                                 right: 11),
                  //                             child: Row(
                  //                               children: [
                  //                                 Text(
                  //                                   'مطالعه شده ها',
                  //                                   style:
                  //                                       GoogleFonts.vazirmatn(
                  //                                           fontSize: 12,
                  //                                           fontWeight:
                  //                                               FontWeight
                  //                                                   .w500),
                  //                                 ),
                  //                                 Icon(
                  //                                   Icons.done,
                  //                                   size: 12,
                  //                                   color: Colors.green,
                  //                                 )
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                     visible: readVisible,
                  //                     replacement: InkWell(
                  //                       onTap: () {
                  //                         setState(() {
                  //                           readVisible = !readVisible;
                  //                         });
                  //                         addBookSave(
                  //                             context: context,
                  //                             bookId: BookDetailState
                  //                                 .bookDetail!.id,
                  //                             st: SaveType.read);
                  //                       },
                  //                       child: Column(
                  //                         children: [
                  //                           Container(
                  //                             child: Padding(
                  //                               padding:
                  //                                   const EdgeInsets.all(10),
                  //                               child: Image(
                  //                                 image: AssetImage(
                  //                                     'lib/assets/images/readed.png'),
                  //                               ),
                  //                             ),
                  //                             width: 55,
                  //                             height: 55,
                  //                             decoration: BoxDecoration(
                  //                                 border: Border.all(
                  //                                     color: Colors.grey,
                  //                                     width: 0.5),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(8)),
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3,
                  //                           ),
                  //                           Text(
                  //                             'مطالعه شده ها',
                  //                             style: GoogleFonts.vazirmatn(
                  //                                 fontSize: 12,
                  //                                 fontWeight: FontWeight.w500),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // SizedBox(
                  //   child: InkWell(
                  //     onTap: () {
                  //       print(List.generate(
                  //           BookDetailState.bookDetail!.bookReviewss!.length,
                  //           (index) =>
                  //               BookDetailState.bookDetail!.bookReviewss!.where(
                  //                 (element) =>
                  //                     BookDetailState.bookDetail!
                  //                         .bookReviewss![index].rate ==
                  //                     1,
                  //               )).length);
                  //     },
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
