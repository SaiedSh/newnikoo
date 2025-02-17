import 'package:bookapp/controller/api/payment/buy_subscriptions.dart';
import 'package:bookapp/controller/api/payment/get_subscriptions.dart';
import 'package:bookapp/controller/api/search_fillter/search_fillter.dart';
import 'package:bookapp/controller/provider/subscriptions_state.dart';
import 'package:bookapp/controller/provider/wallet_payment.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/controller/service/split_number.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BuySubsScreen extends StatefulWidget {
  const BuySubsScreen({
    super.key,
  });

  @override
  State<BuySubsScreen> createState() => _BuySubsScreenState();
}

class _BuySubsScreenState extends State<BuySubsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubscriptions(context: context);
  }

  TextEditingController searchNumber = TextEditingController();
  Future<void> handlePayment(BuildContext context, String subId) async {
    try {
      final finalSubId = subId;
      if (subId == null) {
        // اگر مقدار قیمت معتبر نبود، کاری انجام نده
        return;
      }

      final value = await buySubscriptions(
        wallet: false,
        context: context,
        subId: finalSubId,
      );

      final String paymentUrl =
          SubChargeState.link.toString(); // لینک درگاه پرداخت

      // باز کردن لینک با Custom Tabs
      await launchUrl(
        Uri.parse(paymentUrl),
        mode: LaunchMode
            .externalApplication, // باز کردن در برنامه‌های خارجی مانند کروم
      );

      // پس از باز شدن درگاه پرداخت، کاربر را به صفحه دیگری هدایت می‌کنیم
      Navigator.pushNamed(
        context,
        MyRoutes.navigationBarScreen,
      );
    } catch (e) {
      // در صورت بروز خطا، پیام خطا را نشان بده
      print("Error: $e");
    } finally {
      // در نهایت، فیلد قیمت را پاک می‌کنیم
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
        onWillPop: () async {
          // بازگشت غیرفعال می‌شود
          return false;
        },
        child: Scaffold(
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
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'خرید اشتراک',
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        size: 20,
                                      ),
                                    ),
                                  ],
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
            child: Column(
              children: [
                Consumer<SubscriptionsState>(
                  builder: (context, value, child) => SizedBox(
                    height: 260,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: SubscriptionsState.subscriptions.length != 0
                          ? SubscriptionsState.subscriptions.length
                          : 0,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 5, top: 15),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              height: 110,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  'lib/assets/images/plus.png'),
                                              width: 45,
                                              height: 45,
                                              color: secondaryColor,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              SubscriptionsState
                                                  .subscriptions[index].name
                                                  .toString(),
                                              style: GoogleFonts.vazirmatn(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: secondaryColor),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 11),
                                          child: Row(
                                            children: [
                                              Text(
                                                SubscriptionsState
                                                    .subscriptions[index].price
                                                    .toString()
                                                    .formatNumber(),
                                                style: GoogleFonts.vazirmatn(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                SubscriptionsState
                                                    .subscriptions[index]
                                                    .discountPrice
                                                    .toString()
                                                    .formatNumber(),
                                                style: GoogleFonts.vazirmatn(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                'تومان',
                                                style: GoogleFonts.vazirmatn(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 22,
                                          ),
                                          SizedBox(
                                            width: 100,
                                            height: 40,
                                            child: RawMaterialButton(
                                              child: Center(
                                                child: Text(
                                                  'خرید اشتراک',
                                                  style: GoogleFonts.vazirmatn(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              fillColor: secondaryColor,
                                              onPressed: () {
                                                handlePayment(
                                                    context,
                                                    SubscriptionsState
                                                        .subscriptions[index].id
                                                        .toString());
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // Positioned(
                            //     left: 17,
                            //     child: Image(
                            //       image: AssetImage(
                            //           'lib/assets/images/discount.png'),
                            //       width: 25,
                            //       height: 25,
                            //     ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 22,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         'سوال دارید؟ جواب اینجاست:',
                //         style: GoogleFonts.vazirmatn(
                //             fontWeight: FontWeight.bold, fontSize: 14),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 22,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15, right: 15, bottom: 5, top: 0),
                //   child: Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.add,
                //             color: secondaryColor,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             'نیکو پلاس چیست؟',
                //             style: GoogleFonts.vazirmatn(
                //                 fontWeight: FontWeight.bold, fontSize: 12),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15, right: 15, bottom: 5, top: 3),
                //   child: Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.add,
                //             color: secondaryColor,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             'چطور مشترک نیکو پلاس شوم؟',
                //             style: GoogleFonts.vazirmatn(
                //                 fontWeight: FontWeight.bold, fontSize: 12),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15, right: 15, bottom: 5, top: 3),
                //   child: Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.add,
                //             color: secondaryColor,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             'چه کتاب هایی در نیکو پلاس موجود است؟',
                //             style: GoogleFonts.vazirmatn(
                //                 fontWeight: FontWeight.bold, fontSize: 12),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15, right: 15, bottom: 5, top: 3),
                //   child: Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.add,
                //             color: secondaryColor,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             'چرا باید برای استفاده از نیکو پلاس اشتراک بخرم؟',
                //             style: GoogleFonts.vazirmatn(
                //                 fontWeight: FontWeight.bold, fontSize: 12),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15, right: 15, bottom: 5, top: 3),
                //   child: Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.add,
                //             color: secondaryColor,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             'چطور از نیکو پلاس استفاده کنم؟',
                //             style: GoogleFonts.vazirmatn(
                //                 fontWeight: FontWeight.bold, fontSize: 12),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15, right: 15, bottom: 5, top: 3),
                //   child: Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.add,
                //             color: secondaryColor,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             'اگر اشتراکم تمام شود باز به کتاب های نیکو پلاس دسترسی دارم؟',
                //             style: GoogleFonts.vazirmatn(
                //                 fontWeight: FontWeight.bold, fontSize: 12),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15, right: 15, bottom: 5, top: 3),
                //   child: Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.add,
                //             color: secondaryColor,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             'می توانم کتاب ها را بدون اینترنت بشنوم یا بخوانم؟',
                //             style: GoogleFonts.vazirmatn(
                //                 fontWeight: FontWeight.bold, fontSize: 12),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15, right: 15, bottom: 5, top: 3),
                //   child: Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(10),
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.add,
                //             color: secondaryColor,
                //           ),
                //           SizedBox(
                //             width: 4,
                //           ),
                //           Text(
                //             'میتوانم اشتراکم را لغو کنم؟',
                //             style: GoogleFonts.vazirmatn(
                //                 fontWeight: FontWeight.bold, fontSize: 12),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
