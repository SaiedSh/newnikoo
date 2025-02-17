import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookapp/controller/provider/book_detail_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/controller/service/replace.dart';
import 'package:bookapp/controller/service/split_number.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookCardWidget extends StatefulWidget {
  final String bookImage;
  final String bookName;
  final String bookPrice;
  final String bookWriter;
  final double bookRate;
  final String bookId;
  final int viewCont;
  final String discountPrice;
  final String discountCount;
  BookCardWidget(
      {super.key,
      required this.bookImage,
      required this.bookName,
      required this.bookPrice,
      required this.bookWriter,
      required this.bookRate,
      required this.bookId,
      required this.viewCont,
      required this.discountPrice,
      required this.discountCount});

  @override
  State<BookCardWidget> createState() => _BookCardWidgetState();
}

class _BookCardWidgetState extends State<BookCardWidget> {
  final bool discountVisible = false;

  final bool nikoPlusVisible = false;

  final bool physicalVisivle = false;

  final bool onlineVisible = false;

  CrossAxisAlignment getColumnAlignment(String text) {
    return getTextDirection(text) == TextDirection.rtl
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.end;
  }

  Future<File> _getCachedImageFile(String url) async {
    // استفاده از cache manager برای دانلود و کش کردن فایل تصویر
    var file = await DefaultCacheManager().getSingleFile(url);
    return file; // فایل کش شده تصویر
  }

  late String url;

  @override
  void initState() {
    super.initState();
    url = widget.bookImage.toString();
  }

  TextDirection getTextDirection(String text) {
    // بررسی حروف فارسی و عربی
    final rtlRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]');
    if (rtlRegex.hasMatch(text)) {
      return TextDirection.rtl;
    }
    // اگر حروف لاتین باشد
    return TextDirection.ltr;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topLeft, children: [
      InkWell(
        onTap: () {
          context.read<BookDetailState>().reset();
          Navigator.pushNamed(
            context,
            MyRoutes.bookDetail,
            arguments: widget.bookId,
          );
        },
        child: Container(
          height: 320,
          width: 180,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                spreadRadius: 0,
                blurRadius: 2,
                color: const Color.fromARGB(20, 00, 00, 00)),
          ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: Alignment.bottomRight, children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 6, bottom: 10, left: 4, right: 4),
                      child: Container(
                        width: 160,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: FutureBuilder<File>(
                            future: _getCachedImageFile(url),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  // نمایش تصویر از فایل کش شده
                                  return Image.file(
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                          child: Text(
                                        'خطا در بارگزاری تصویر',
                                        style: GoogleFonts.vazirmatn(
                                            color: Colors.grey),
                                      ));
                                    },
                                    snapshot.data!,
                                    fit: BoxFit.fitHeight,
                                  );
                                } else {
                                  return Center(
                                      child: Text(
                                    'خطا در بارگزاری تصویر',
                                    style: GoogleFonts.vazirmatn(
                                        color: Colors.grey),
                                  ));
                                }
                              } else {
                                return Center(
                                    child: CircularProgressIndicator(
                                  strokeWidth: 0.5,
                                ));
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: physicalVisivle,
                      child: Positioned(
                          bottom: 10,
                          right: 30,
                          child: Image(
                            image: AssetImage('lib/assets/images/byke.png'),
                            width: 15,
                          )),
                    ),
                    Visibility(
                      visible: onlineVisible,
                      child: Positioned(
                          bottom: 10,
                          right: 12,
                          child: Image(
                            image: AssetImage('lib/assets/images/booky.png'),
                            width: 15,
                          )),
                    )
                  ]),
                  SizedBox(
                    height: 90,
                    child: Column(
                      crossAxisAlignment: getColumnAlignment(widget.bookName),
                      children: [
                        SizedBox(
                          height: 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AutoSizeText(
                                  widget.bookName.replaceAll("*", ""),
                                  textDirection:
                                      getTextDirection(widget.bookName),
                                  minFontSize: 14,
                                  maxLines:
                                      2, // حداکثر تعداد خطوط را به 2 محدود می‌کنیم
                                  overflow: TextOverflow
                                      .ellipsis, // متن بیش از حد را با سه نقطه نشان می‌دهد
                                  style: GoogleFonts.vazirmatn(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                widget.bookWriter != "null"
                                    ? widget.bookWriter.replaceAll("*", "")
                                    : "",
                                textDirection:
                                    getTextDirection(widget.bookWriter),
                                minFontSize: 10,
                                maxLines:
                                    2, // حداکثر تعداد خطوط را به 2 محدود می‌کنیم
                                overflow: TextOverflow
                                    .ellipsis, // متن بیش از حد را با سه نقطه نشان می‌دهد
                                style: GoogleFonts.vazirmatn(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            "${widget.bookRate.toString().toPersianNumbers()}  ",
                            style: GoogleFonts.vazirmatn(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "( ${widget.viewCont.toString().toPersianNumbers()} )",
                          style: GoogleFonts.vazirmatn(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1.5),
                          child: Text(
                            textDirection: TextDirection.rtl,
                            widget.bookPrice.formatNumber().toPersianNumbers(),
                            style: GoogleFonts.vazirmatn(
                              decoration: widget.discountCount != "0"
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                        Text(
                          textDirection: TextDirection.rtl,
                          ' تومان ',
                          style: GoogleFonts.vazirmatn(
                            fontSize: 12,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.discountCount != '0'
                      ? Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 1.5),
                                child: Text(
                                  textDirection: TextDirection.rtl,
                                  widget.discountPrice
                                      .formatNumber()
                                      .toPersianNumbers(),
                                  style: GoogleFonts.vazirmatn(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                              Text(
                                textDirection: TextDirection.rtl,
                                ' تومان ',
                                style: GoogleFonts.vazirmatn(
                                  fontSize: 12,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox.shrink(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 5),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.bookmark_outline,
                  //         size: 20,
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: nikoPlusVisible,
        child: Positioned(
            left: 12,
            child: Image(
              image: AssetImage('lib/assets/images/plusicon.png'),
              width: 20,
            )),
      ),
      Visibility(
        visible: widget.discountCount != "0" ? true : false,
        child: Positioned(
          child: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '%',
                      style: GoogleFonts.vazirmatn(
                          color: Colors.white, fontSize: 10),
                    ),
                    Text(
                      widget.discountCount,
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            height: 27,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/discount.png'),
                    fit: BoxFit.fill)),
          ),
          left: 17,
        ),
      )
    ]);
  }
}

class BookCardListWidget extends StatelessWidget {
  final String bookImage;
  final String bookName;
  final String bookPrice;
  final String bookWriter;
  final double bookRate;
  final String? bookId;
  const BookCardListWidget(
      {super.key,
      required this.bookImage,
      required this.bookName,
      required this.bookPrice,
      required this.bookWriter,
      required this.bookRate,
      this.bookId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 160,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, left: 5, right: 5),
                      child: Container(
                        width: 110,
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Center(
                                child: Text(
                                  'تصویر بارگذاری نشد',
                                  style: GoogleFonts.vazirmatn(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              );
                            },
                            fit: BoxFit.fill,
                            bookImage,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                // تصویر لود شده است
                                return child;
                              }
                              // تصویر هنوز در حال لود است
                              return Center(
                                  child: CircularProgressIndicator(
                                strokeWidth: 1,
                                color: secondaryColor,
                              ));
                            },
                          ),
                        ),

                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(12),
                        //   child: Image.network(
                        //     bookImage,
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookName,
                            style: GoogleFonts.vazirmatn(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            bookWriter,
                            style: GoogleFonts.vazirmatn(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'ناشر : ',
                            style: GoogleFonts.vazirmatn(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                          ),
                          Text(
                            "4.8 ( 585 )",
                            style: GoogleFonts.vazirmatn(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            textDirection: TextDirection.rtl,
                            bookPrice + " تومان ",
                            style: GoogleFonts.vazirmatn(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Text(
                      //       textDirection: TextDirection.rtl,
                      //       "ثبت نقد و امتیاز من",
                      //       style: GoogleFonts.vazirmatn(
                      //           fontSize: 12,
                      //           color: Color.fromARGB(255, 0, 174, 212)),
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(top: 2.5),
                      //       child: Icon(
                      //         Icons.arrow_forward_ios,
                      //         size: 11,
                      //         color: Color.fromARGB(255, 0, 174, 212),
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
