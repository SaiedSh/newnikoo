import 'package:auto_size_text/auto_size_text.dart';
import 'package:bookapp/controller/api/discount_Code/disocuntCheck.dart';
import 'package:bookapp/controller/api/payment/shop_card/buy_book.dart';
import 'package:bookapp/controller/api/payment/shop_card/final_payment.dart';
import 'package:bookapp/controller/api/payment/shop_card/get_shopcard_list.dart';
import 'package:bookapp/controller/api/payment/shop_card/payment.dart';
import 'package:bookapp/controller/api/profile/get_profile.dart';
import 'package:bookapp/controller/api/search_fillter/search_fillter.dart';
import 'package:bookapp/controller/provider/discountCheck.dart';
import 'package:bookapp/controller/provider/profile_state.dart';
import 'package:bookapp/controller/provider/shop_card_state.dart';
import 'package:bookapp/controller/provider/wallet_payment.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/controller/service/replace.dart';
import 'package:bookapp/controller/service/split_number.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopCardScreen extends StatefulWidget {
  const ShopCardScreen({
    super.key,
  });

  @override
  State<ShopCardScreen> createState() => _ShopCardScreenState();
}

class _ShopCardScreenState extends State<ShopCardScreen> {
  TextEditingController price = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfile(
      context: context,
    );
    getShopCardList(context: context).then(
      (value) {
        setState(() {
          finalValue = (ShopCardState.shopCardList!.rawPrice)! -
              (ShopCardState.shopCardList!.totalPrice!);
        });
      },
    );
  }

  bool massageVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController discountCodeController = TextEditingController();
  TextDirection getTextDirection(String text) {
    // بررسی حروف فارسی و عربی
    final rtlRegex = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]');
    if (rtlRegex.hasMatch(text)) {
      return TextDirection.rtl;
    }
    // اگر حروف لاتین باشد
    return TextDirection.ltr;
  }

  Future<void> handlePayment(BuildContext context) async {
    try {
      final value = await shopCardPayment(
        wallet: false,
        context: context,
      );

      final String paymentUrl = ShopCardChargeState.link.toString();

      // هدایت کاربر به صفحه پرداخت داخلی با WebView
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentWebViewPage(paymentUrl: paymentUrl),
        ),
      );
    } catch (e) {
      print("Error: $e");
    }
  }
  // Future<void> handlePayment(BuildContext context) async {
  //   try {
  //     // final finalSubId = price;
  //     // if (price == null) {
  //     //   // اگر مقدار قیمت معتبر نبود، کاری انجام نده
  //     //   return;
  //     // }

  //     final value = await shopCardPayment(
  //       wallet: false,
  //       context: context,
  //     );

  //     final String paymentUrl =
  //         ShopCardChargeState.link.toString(); // لینک درگاه پرداخت

  //     // باز کردن لینک با Custom Tabs
  //     await launchUrl(
  //       Uri.parse(paymentUrl),
  //       mode: LaunchMode
  //           .externalApplication, // باز کردن در برنامه‌های خارجی مانند کروم
  //     );

  //     // پس از باز شدن درگاه پرداخت، کاربر را به صفحه دیگری هدایت می‌کنیم
  //     Navigator.pushNamed(
  //       context,
  //       MyRoutes.navigationBarScreen,
  //     );
  //   } catch (e) {
  //     // در صورت بروز خطا، پیام خطا را نشان بده
  //     print("Error: $e");
  //   } finally {
  //     // در نهایت، فیلد قیمت را پاک می‌کنیم
  //   }
  // }

  int? selectedCheckbox = 1; // 1 یا 2 برای شناسایی انتخاب

  void _handleAction() {
    if (selectedCheckbox == 1) {
      handlePayment(context);
      print("چک‌باکس اول انتخاب شده");
      // اینجا اکشن مخصوص چک‌باکس اول
    } else if (selectedCheckbox == 2) {
      ProfileState.profile!.walletAmount! <
              ShopCardState.shopCardList!.totalPrice!
          ? showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Container(
                  width: 280,
                  height: 300,
                  child: Center(
                    child: Text(
                      "موجودی کیف پول کافی نیست",
                      style: GoogleFonts.vazirmatn(
                          fontSize: 18, color: Colors.red),
                    ),
                  ),
                ),
              ),
            )
          : payment(context: context, wallet: true);

      print("چک‌باکس دوم انتخاب شده");
      // اینجا اکشن مخصوص چک‌باکس دوم
    } else {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            width: 280,
            height: 300,
            child: Center(
              child: Text(
                "شیوه پرداخت را انتخاب کنید",
                style: GoogleFonts.vazirmatn(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ),
      );
      print("هیچ گزینه‌ای انتخاب نشده");
    }
  }

  TextEditingController searchNumber = TextEditingController();
  int finalValue = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // بازگشت غیرفعال می‌شود
        Navigator.pushNamed(context, MyRoutes.navigationBarScreen);
        return true;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          bottomSheet: ShopCardState.shopCardList!.shopCardItems!.length != 0
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 8, bottom: 8),
                    child: RawMaterialButton(
                      onPressed: _handleAction,
                      fillColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'پرداخت',
                                style: GoogleFonts.vazirmatn(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: Colors.white,
                                  )),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Consumer<ShopCardState>(
                                      builder: (context, value, child) => Text(
                                        ShopCardState
                                                    .shopCardList!.totalPrice !=
                                                null
                                            ? ShopCardState
                                                .shopCardList!.totalPrice
                                                .toString()
                                                .toPersianNumbers()
                                                .formatNumber()
                                            : "0",
                                        style: GoogleFonts.vazirmatn(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      'تومان',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      // onPressed: () async {
                      //   ProfileState.profile!.walletAmount! >=
                      //           ShopCardState.shopCardList!.totalPrice!
                      //       ? showDialog(
                      //           context: context,
                      //           builder: (context) => Dialog(
                      //             child: Container(
                      //               height: 400,
                      //               child: Column(
                      //                 children: [
                      //                   SizedBox(
                      //                     height: 30,
                      //                   ),
                      //                   Directionality(
                      //                     textDirection: TextDirection.rtl,
                      //                     child: Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.center,
                      //                       children: [
                      //                         Padding(
                      //                           padding: const EdgeInsets.only(
                      //                               bottom: 3),
                      //                           child: Text(
                      //                             'موجودی کیف پول : ',
                      //                             style: GoogleFonts.vazirmatn(
                      //                                 color: Colors.black,
                      //                                 fontWeight:
                      //                                     FontWeight.bold,
                      //                                 fontSize: 16),
                      //                           ),
                      //                         ),
                      //                         Text(
                      //                           ProfileState
                      //                               .profile!.walletAmount
                      //                               .toString()
                      //                               .formatNumber(),
                      //                           style: GoogleFonts.vazirmatn(
                      //                               fontSize: 15,
                      //                               color: Colors.black),
                      //                         ),
                      //                         SizedBox(
                      //                           width: 3,
                      //                         ),
                      //                         Text(
                      //                           'تومان',
                      //                           style: GoogleFonts.vazirmatn(
                      //                               fontSize: 14,
                      //                               color: Colors.black),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 100,
                      //                   ),
                      //                   MaterialButton(
                      //                     color: Colors.black,
                      //                     minWidth: 180,
                      //                     child: Text(
                      //                       'پرداخت با کیف پول',
                      //                       style: GoogleFonts.vazirmatn(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.bold),
                      //                     ),
                      //                     onPressed: () {
                      //                       ShopCardState
                      //                                   .shopCardList!
                      //                                   .shopCardItems!
                      //                                   .length !=
                      //                               0
                      //                           ? payment(
                      //                               context: context,
                      //                               wallet: true)
                      //                           : showDialog(
                      //                               context: context,
                      //                               builder: (context) =>
                      //                                   Dialog(
                      //                                 child: Container(
                      //                                   height: 250,
                      //                                   child: Center(
                      //                                     child: Text(
                      //                                       'سبد خرید خالی است',
                      //                                       style: GoogleFonts
                      //                                           .vazirmatn(
                      //                                               fontSize:
                      //                                                   18,
                      //                                               fontWeight:
                      //                                                   FontWeight
                      //                                                       .bold,
                      //                                               color: Colors
                      //                                                   .red),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             );
                      //                     },
                      //                   ),
                      //                   SizedBox(
                      //                     height: 10,
                      //                   ),
                      //                   MaterialButton(
                      //                     color: Colors.black,
                      //                     minWidth: 180,
                      //                     child: Text(
                      //                       'پرداخت با درگاه',
                      //                       style: GoogleFonts.vazirmatn(
                      //                           color: Colors.white,
                      //                           fontWeight: FontWeight.bold),
                      //                     ),
                      //                     onPressed: () {
                      //                       ShopCardState
                      //                                   .shopCardList!
                      //                                   .shopCardItems!
                      //                                   .length !=
                      //                               0
                      //                           ? handlePayment(context)
                      //                           : showDialog(
                      //                               context: context,
                      //                               builder: (context) =>
                      //                                   Dialog(
                      //                                 child: Container(
                      //                                   height: 250,
                      //                                   child: Center(
                      //                                     child: Text(
                      //                                       'سبد خرید خالی است',
                      //                                       style: GoogleFonts
                      //                                           .vazirmatn(
                      //                                               fontSize:
                      //                                                   18,
                      //                                               fontWeight:
                      //                                                   FontWeight
                      //                                                       .bold,
                      //                                               color: Colors
                      //                                                   .red),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             );
                      //                       ;
                      //                     },
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         )
                      //       : handlePayment(context);
                      //   ;
                      // },
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.white),
                )
              : SizedBox.shrink(),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(110),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: backgroundColor,
                flexibleSpace: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.home_outlined,
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            MyRoutes.navigationBarScreen);
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 1,
                                      child: VerticalDivider(),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, MyRoutes.profileScreen);
                                        },
                                        icon: Image(
                                          image: AssetImage(
                                              'lib/assets/images/miniicon.png'),
                                          width: 17,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'سبد خرید',
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            MyRoutes.navigationBarScreen);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        size: 20,
                                      ),
                                    )
                                  ],
                                ),

                                // Image(
                                //   image: AssetImage(
                                //       'lib/assets/images/logo.png'),
                                //   width: 70,
                                // )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width - 30,
                              child: TextField(
                                style: GoogleFonts.vazirmatn(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                controller: searchNumber,
                                onSubmitted: (value) {
                                  searchAndFillter(
                                    context: context,
                                    body:
                                        BookSearchDto(name: searchNumber.text),
                                  ).then(
                                    (value) {
                                      Navigator.pushNamed(context,
                                          MyRoutes.searchFillterScreen);
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
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: ShopCardState.shopCardList!.shopCardItems!.length != 0
                ? Column(
                    children: [
                      Consumer<ShopCardState>(
                        builder: (context, value, child) => ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              ShopCardState.shopCardList!.shopCardItems != null
                                  ? ShopCardState
                                      .shopCardList!.shopCardItems!.length
                                  : 0,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 5, top: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Image(
                                        //   image: AssetImage(
                                        //       'lib/assets/images/book.png'),
                                        //   fit: BoxFit.fill,
                                        //   width: 120,
                                        //   height: 100,
                                        // ),
                                        Image.network(
                                          errorBuilder: (BuildContext context,
                                              Object error,
                                              StackTrace? stackTrace) {
                                            return Center(
                                              child: Text(
                                                'تصویر بارگذاری نشد',
                                                style: GoogleFonts.vazirmatn(
                                                    fontSize: 16,
                                                    color: Colors.grey),
                                              ),
                                            );
                                          },
                                          fit: BoxFit.fill,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              // تصویر لود شده است
                                              return child;
                                            }
                                            // تصویر هنوز در حال لود است
                                            return CircularProgressIndicator();
                                          },
                                          ShopCardState.shopCardList!
                                                      .shopCardItems !=
                                                  null
                                              ? ShopCardState
                                                  .shopCardList!
                                                  .shopCardItems![index]
                                                  .bookImageUrl
                                                  .toString()
                                              : "",
                                          width: 120,
                                          height: 100,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 180,
                                                child: AutoSizeText(
                                                  maxLines: 3,
                                                  minFontSize: 10,
                                                  textDirection:
                                                      getTextDirection(
                                                          ShopCardState
                                                              .shopCardList!
                                                              .shopCardItems![
                                                                  index]
                                                              .bookTitle
                                                              .toString()),
                                                  ShopCardState.shopCardList!
                                                              .shopCardItems !=
                                                          null
                                                      ? ShopCardState
                                                          .shopCardList!
                                                          .shopCardItems![index]
                                                          .bookTitle
                                                          .toString()
                                                      : "",
                                                  style: GoogleFonts.vazirmatn(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 180,
                                                child: AutoSizeText(
                                                  maxLines: 3,
                                                  minFontSize: 10,
                                                  textDirection:
                                                      getTextDirection(
                                                          ShopCardState
                                                              .shopCardList!
                                                              .shopCardItems![
                                                                  index]
                                                              .bookNevisande
                                                              .toString()),
                                                  ShopCardState
                                                              .shopCardList!
                                                              .shopCardItems![
                                                                  index]
                                                              .bookNevisande !=
                                                          null
                                                      ? ShopCardState
                                                          .shopCardList!
                                                          .shopCardItems![index]
                                                          .bookNevisande
                                                          .toString()
                                                          .replaceAll("*", "")
                                                      : "",
                                                  style: GoogleFonts.vazirmatn(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              // Text(
                                              //   ShopCardState
                                              //               .shopCardList!
                                              //               .shopCardItems![index]
                                              //               .bookNevisande !=
                                              //           null
                                              //       ? ShopCardState
                                              //           .shopCardList!
                                              //           .shopCardItems![index]
                                              //           .bookNevisande
                                              //           .toString()
                                              //       : "",
                                              //   style: GoogleFonts.vazirmatn(
                                              //       fontSize: 12,
                                              //       fontWeight: FontWeight.w500,
                                              //       color: Colors.black),
                                              // ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              addOrRemoveBook(
                                                      context: context,
                                                      bookId: ShopCardState
                                                          .shopCardList!
                                                          .shopCardItems![index]
                                                          .bookId,
                                                      remove: true)
                                                  .then(
                                                (value) {
                                                  getShopCardList(
                                                      context: context);
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 70,
                                              height: 30,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.delete_forever,
                                                      color: Colors.red,
                                                      size: 23,
                                                    ),
                                                    Text(
                                                      'حذف',
                                                      style:
                                                          GoogleFonts.vazirmatn(
                                                              fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                style: GoogleFonts.vazirmatn(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                ShopCardState.shopCardList!
                                                            .shopCardItems !=
                                                        null
                                                    ? ShopCardState
                                                        .shopCardList!
                                                        .shopCardItems![index]
                                                        .bookTotalPrice
                                                        .toString()
                                                        .toPersianNumbers()
                                                        .formatNumber()
                                                    : "",
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                'تومان',
                                                style: GoogleFonts.vazirmatn(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
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
                            left: 15, right: 15, bottom: 5, top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'فاکتور',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Divider(),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'جمع کل',
                                          style: GoogleFonts.vazirmatn(
                                              fontSize: 14,
                                              color: Colors.grey.shade600),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Consumer<ShopCardState>(
                                          builder: (context, value, child) =>
                                              Text(
                                            '( ${ShopCardState.shopCardList!.shopCardItems != null ? ShopCardState.shopCardList!.shopCardItems!.length.toString() : '0'} عنوان )',
                                            style: GoogleFonts.vazirmatn(
                                                fontSize: 14,
                                                color: Colors.grey.shade600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2),
                                          child: Consumer<ShopCardState>(
                                            builder: (context, value, child) =>
                                                Text(
                                              ShopCardState.shopCardList!
                                                          .shopCardItems !=
                                                      null
                                                  ? ShopCardState
                                                      .shopCardList!.rawPrice
                                                      .toString()
                                                      .toPersianNumbers()
                                                      .formatNumber()
                                                  : "",
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade600),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'تومان',
                                            style: GoogleFonts.vazirmatn(
                                                fontSize: 13,
                                                color: Colors.grey.shade600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'سود شما از این خرید',
                                          style: GoogleFonts.vazirmatn(
                                              fontSize: 14,
                                              color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          finalValue
                                              .toString()
                                              .formatNumber()
                                              .toPersianNumbers(),
                                          style: GoogleFonts.vazirmatn(
                                              fontSize: 15,
                                              color: Colors.grey.shade600),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'تومان',
                                            style: GoogleFonts.vazirmatn(
                                                fontSize: 13,
                                                color: Colors.grey.shade600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'قابل پرداخت',
                                          style: GoogleFonts.vazirmatn(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Consumer<ShopCardState>(
                                          builder: (context, value, child) =>
                                              Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: Text(
                                              ShopCardState.shopCardList!
                                                          .totalPrice !=
                                                      null
                                                  ? ShopCardState
                                                      .shopCardList!.totalPrice
                                                      .toString()
                                                      .toPersianNumbers()
                                                      .formatNumber()
                                                  : "0",
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'تومان',
                                            style: GoogleFonts.vazirmatn(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 5, top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'کد تخفیف',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Form(
                                      key: _formKey,
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SizedBox(
                                          width: 250,
                                          height: 50,
                                          child: TextFormField(
                                            onChanged: (value) {
                                              setState(() {
                                                massageVisible = false;
                                              });
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'لطفاً این فیلد را پر کنید';
                                              }
                                              return null;
                                            },
                                            controller: discountCodeController,
                                            decoration: InputDecoration(
                                              hintText: 'کد تخفیف را وارد کنید',
                                              hintStyle: GoogleFonts.vazirmatn(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              errorStyle: TextStyle(
                                                  height:
                                                      0.4), // کوچیک‌تر کن ولی فضا باشه
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 60,
                                      height: 45,
                                      child: RawMaterialButton(
                                          child: Text(
                                            'ثبت',
                                            style: GoogleFonts.vazirmatn(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          fillColor: secondaryColor,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                massageVisible = true;
                                              }); // اگر معتبر بود، متد رو اجرا کن
                                              discountCheck(
                                                context: context,
                                                code:
                                                    discountCodeController.text,
                                              ).then(
                                                (value) {
                                                  getShopCardList(
                                                      context: context);
                                                },
                                              );
                                            }
                                          }),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Visibility(
                                  visible: massageVisible,
                                  child: Row(
                                    children: [
                                      Consumer<DiscountCheckState>(
                                        builder: (context, value, child) =>
                                            Text(
                                                style: GoogleFonts.vazirmatn(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                DiscountCheckState.discountCheck
                                                    .toString()),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 5, top: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'شیوه پرداخت را انتخاب کنید',
                                      style:
                                          GoogleFonts.vazirmatn(fontSize: 18),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCheckbox =
                                          selectedCheckbox == 1 ? null : 1;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      height: 50,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: 15,
                                                  child: Checkbox(
                                                    activeColor: Colors.black,
                                                    shape: CircleBorder(),
                                                    value:
                                                        selectedCheckbox == 1,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        selectedCheckbox =
                                                            value! ? 1 : null;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'درگاه پرداخت آنلاین',
                                                      style:
                                                          GoogleFonts.vazirmatn(
                                                              fontSize: 14),
                                                    ),
                                                    Text(
                                                      'پرداخت با همه کارت های عضوشتاب',
                                                      style:
                                                          GoogleFonts.vazirmatn(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons
                                                      .solidCreditCard,
                                                  color: Colors.blue,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade800),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCheckbox =
                                          selectedCheckbox == 2 ? null : 2;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      height: 50,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: 15,
                                                  child: Checkbox(
                                                    activeColor: Colors.black,
                                                    shape: CircleBorder(),
                                                    value:
                                                        selectedCheckbox == 2,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        selectedCheckbox =
                                                            value! ? 2 : null;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'پرداخت با کیف پول',
                                                      style:
                                                          GoogleFonts.vazirmatn(
                                                              fontSize: 14),
                                                    ),
                                                    Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 3),
                                                            child: Text(
                                                              'موجودی کیف پول : ',
                                                              style: GoogleFonts
                                                                  .vazirmatn(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .grey),
                                                            ),
                                                          ),
                                                          Consumer<
                                                              ProfileState>(
                                                            builder: (context,
                                                                    value,
                                                                    child) =>
                                                                Text(
                                                              ProfileState
                                                                  .profile!
                                                                  .walletAmount
                                                                  .toString()
                                                                  .formatNumber(),
                                                              style: GoogleFonts
                                                                  .vazirmatn(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .grey),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 3,
                                                          ),
                                                          Text(
                                                            'تومان',
                                                            style: GoogleFonts
                                                                .vazirmatn(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.wallet,
                                                  color: Colors.blue,
                                                  size: 27,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade800),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                      )
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 280,
                      ),
                      Center(
                        child: Text(
                          'سبد شما خالی است',
                          style: GoogleFonts.vazirmatn(fontSize: 20),
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
