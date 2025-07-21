import 'dart:io';

import 'package:bookapp/controller/api/payment/walletcharge.dart';
import 'package:bookapp/controller/api/profile/get_profile.dart';
import 'package:bookapp/controller/api/search_fillter/search_fillter.dart';
import 'package:bookapp/controller/provider/profile_state.dart';
import 'package:bookapp/controller/provider/shop_card_state.dart';
import 'package:bookapp/controller/provider/wallet_payment.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/controller/service/split_number.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController price = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfile(
      context: context,
    ).then(
      (value) {
        pervImage = ProfileState.profile!.userAvatar!;
      },
    );
  }

  String? pervImage;
  Future<void> removeToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.remove('accessToken');
  }

  void _exitApp(BuildContext context) {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0); // این روش توصیه نمی‌شود اما برای iOS کار می‌کند.
    }
  }

  Future<void> handlePayment(BuildContext context) async {
    try {
      final priceValue = int.tryParse(price.text);
      if (priceValue == null) {
        // اگر مقدار قیمت معتبر نبود، کاری انجام نده
        return;
      }

      final value = await walletCharge(
        context: context,
        price: priceValue,
      );

      final String paymentUrl =
          WalletChargeState.link.toString(); // لینک درگاه پرداخت

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
      price.text = '';
    }
  }

  TextEditingController searchNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            MyRoutes.navigationBarScreen);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      'پروفایل',
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Consumer<ShopCardState>(
                                      builder: (context, cartProvider, child) {
                                        int itemCount = 0;

                                        if (ShopCardState.shopCardList !=
                                                null &&
                                            ShopCardState.shopCardList!
                                                    .shopCardItems !=
                                                null) {
                                          itemCount = ShopCardState
                                              .shopCardList!
                                              .shopCardItems!
                                              .length;
                                        }

                                        return Stack(
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                Navigator.pushNamed(context,
                                                    MyRoutes.shopCardScreen);
                                              },
                                              icon: Image.asset(
                                                'lib/assets/images/handbag.png',
                                                width: 17,
                                              ),
                                            ),
                                            if (itemCount > 0)
                                              Positioned(
                                                right: 4,
                                                top: 4,
                                                child: Container(
                                                  padding: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  constraints: BoxConstraints(
                                                    minWidth: 16,
                                                    minHeight: 16,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${ShopCardState.shopCardList!.shopCardItems!.length}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10.5,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    ),
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
                                        Navigator.pushNamed(context,
                                            MyRoutes.navigationBarScreen);
                                      },
                                    ),
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 15),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyRoutes.editProfileScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<ProfileState>(
                            builder: (context, value, child) => Row(
                              children: [
                                pervImage != null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          // loadingBuilder: (context, child,
                                          //         loadingProgress) =>
                                          //     Center(
                                          //         child:
                                          //             CircularProgressIndicator(
                                          //   strokeWidth: 0.2,
                                          // )),
                                          pervImage.toString(),
                                          fit: BoxFit.fill,
                                          width: 38,
                                          height: 38,
                                        ))
                                    : Container(
                                        width: 38,
                                        height: 38,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                              image: AssetImage(
                                                  'lib/assets/images/iconcm.png')),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          ProfileState.profile!.firstName !=
                                                  null
                                              ? ProfileState.profile!.firstName
                                                  .toString()
                                              : "نام",
                                          style: GoogleFonts.vazirmatn(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          ProfileState.profile!.lastName != null
                                              ? ProfileState.profile!.lastName
                                                  .toString()
                                              : 'نام خانوادگی',
                                          style: GoogleFonts.vazirmatn(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      ProfileState.profile!.phoneNumber
                                          .toString(),
                                      style:
                                          GoogleFonts.vazirmatn(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 5),
                child: Container(
                  height: 51,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.buySubsScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 3,
                              ),
                              Image(
                                image: AssetImage('lib/assets/images/plus.png'),
                                color: Color.fromARGB(255, 0, 81, 116),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'اشتراک نیکو پلاس',
                                style: GoogleFonts.vazirmatn(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 0, 81, 116),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 15,
                          )
                        ],
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Container(
                                  width: 300,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'lib/assets/images/wallet.png'),
                                            width: 55,
                                            height: 55,
                                            color: Color.fromARGB(
                                                255, 0, 174, 212),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'موجودی فعلی',
                                            style: GoogleFonts.vazirmatn(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Consumer<ProfileState>(
                                              builder:
                                                  (context, value, child) =>
                                                      Text(
                                                '${ProfileState.profile!.walletAmount.toString().formatNumber()} تومان',
                                                style: GoogleFonts.vazirmatn(
                                                    fontSize: 12,
                                                    color: Colors.grey.shade700,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Text(
                                                  'تعیین مبلغ :',
                                                  style: GoogleFonts.vazirmatn(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  child: TextField(
                                                    controller: price,
                                                    enabled: true,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly, // فقط اعداد انگلیسی
                                                    ],
                                                    textAlign: TextAlign
                                                        .center, // مرکزچین کردن متن و کرسر
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    decoration: InputDecoration(
                                                      label: Text(
                                                        'مبلغ دلخواه (تومان)',
                                                        style: GoogleFonts
                                                            .vazirmatn(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .auto,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  10), // تنظیم فاصله داخلی
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                height: 40,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        price.text = '10000';
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '10,000',
                                                          style: GoogleFonts
                                                              .vazirmatn(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text(
                                                            'تومان',
                                                            style: GoogleFonts
                                                                .vazirmatn(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                height: 40,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        price.text = '20000';
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '20,000',
                                                          style: GoogleFonts
                                                              .vazirmatn(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text(
                                                            'تومان',
                                                            style: GoogleFonts
                                                                .vazirmatn(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                height: 40,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        price.text = '50000';
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '50,000',
                                                          style: GoogleFonts
                                                              .vazirmatn(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text(
                                                            'تومان',
                                                            style: GoogleFonts
                                                                .vazirmatn(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                height: 40,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        price.text = '100000';
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '100,000',
                                                          style: GoogleFonts
                                                              .vazirmatn(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text(
                                                            'تومان',
                                                            style: GoogleFonts
                                                                .vazirmatn(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 290,
                                            height: 30,
                                            child: RawMaterialButton(
                                              fillColor: Color.fromARGB(
                                                  255, 0, 174, 212),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Directionality(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  child: Text(
                                                    'شارژ کیف پول',
                                                    style:
                                                        GoogleFonts.vazirmatn(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              onPressed: () {
                                                handlePayment(context);
                                              },
                                              // onPressed: () async {
                                              //   walletCharge(
                                              //           context: context,
                                              //           price: int.tryParse(
                                              //               price.text))
                                              //       .then(
                                              //     (value) {
                                              //       final String paymentUrl =
                                              //           WalletChargeState.link
                                              //               .toString(); // لینک درگاه پرداخت

                                              //       Future<void>
                                              //           openPaymentUrl() async {
                                              //         if (await canLaunch(
                                              //             paymentUrl)) {
                                              //           await launch(paymentUrl,
                                              //               forceWebView: false,
                                              //               forceSafariVC:
                                              //                   false);
                                              //         } else {
                                              //           throw "Cannot launch URL: $paymentUrl";
                                              //         }
                                              //       }

                                              //       openPaymentUrl().then(
                                              //         (value) {
                                              //           Navigator.pushNamed(
                                              //               context,
                                              //               MyRoutes
                                              //                   .navigationBarScreen);
                                              //         },
                                              //       );

                                              //       // showDialog(
                                              //       //   context: context,
                                              //       //   builder: (context) =>
                                              //       //       Dialog(
                                              //       //     child: Container(
                                              //       //       width: 250,
                                              //       //       height: 300,
                                              //       //       child: Center(
                                              //       //         child: Text(
                                              //       //           'کیف پول شما با موفقیت شارژ شد',
                                              //       //           style: GoogleFonts.vazirmatn(
                                              //       //               color: Colors
                                              //       //                   .green),
                                              //       //         ),
                                              //       //       ),
                                              //       //     ),
                                              //       //   ),
                                              //       // ).then(
                                              //       //   (value) {
                                              //       //     Navigator.pushNamed(
                                              //       //         context,
                                              //       //         MyRoutes
                                              //       //             .profileScreen);
                                              //       //   },
                                              //       // );
                                              //       price.text = '';
                                              //     },
                                              //   );
                                              // },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Image(
                                        image: AssetImage(
                                            'lib/assets/images/wallet.png'),
                                        fit: BoxFit.fill,
                                        width: 21,
                                        height: 21,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'کیف پول',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'شارژ کیف پول',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 11,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Divider(),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   child: InkWell(
                        //     onTap: () {
                        //       Navigator.pushNamed(
                        //           context, MyRoutes.myBagScreen);
                        //     },
                        //     child: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment:
                        //           MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Row(
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.center,
                        //           children: [
                        //             Padding(
                        //               padding:
                        //                   const EdgeInsets.only(bottom: 4),
                        //               child: Image(
                        //                 image: AssetImage(
                        //                     'lib/assets/images/bagbag.png'),
                        //                 fit: BoxFit.fill,
                        //                 width: 18,
                        //                 height: 21,
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               width: 10,
                        //             ),
                        //             Text(
                        //               'خرید های من',
                        //               style: GoogleFonts.vazirmatn(
                        //                   fontSize: 14,
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //           ],
                        //         ),
                        //         Icon(
                        //           Icons.arrow_forward_ios,
                        //           color: Colors.grey,
                        //           size: 15,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 5),
                        //   child: Divider(),
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoutes.readScreen);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Image(
                                        image: AssetImage(
                                            'lib/assets/images/rise.png'),
                                        fit: BoxFit.fill,
                                        width: 17,
                                        height: 21,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'مطالعه‌ی من',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 10, right: 5),
                        //   child: InkWell(
                        //     onTap: () {
                        //       bool visible = false;
                        //       showModalBottomSheet(
                        //         context: context,
                        //         builder: (BuildContext context) {
                        //           return Directionality(
                        //             textDirection: TextDirection.rtl,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.only(
                        //                     topRight: Radius.circular(10),
                        //                     topLeft: Radius.circular(10)),
                        //                 color: Colors.white,
                        //               ),
                        //               height: 220,
                        //               child: Center(
                        //                 child: Padding(
                        //                   padding: const EdgeInsets.symmetric(
                        //                       horizontal: 20),
                        //                   child: Column(
                        //                     children: <Widget>[
                        //                       SizedBox(
                        //                         height: 20,
                        //                       ),
                        //                       Row(
                        //                         mainAxisAlignment:
                        //                             MainAxisAlignment.start,
                        //                         children: [
                        //                           Text(
                        //                             'حالت نمایش برنامه',
                        //                             style: GoogleFonts.vazirmatn(
                        //                                 fontSize: 14,
                        //                                 color: Colors.black,
                        //                                 fontWeight:
                        //                                     FontWeight.bold),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       SizedBox(
                        //                         height: 10,
                        //                       ),
                        //                       Divider(),
                        //                       InkWell(
                        //                         onTap: () {
                        //                           setState(() {
                        //                             visible = !visible;
                        //                           });
                        //                         },
                        //                         child: Row(
                        //                           crossAxisAlignment:
                        //                               CrossAxisAlignment
                        //                                   .center,
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment
                        //                                   .spaceBetween,
                        //                           children: [
                        //                             Row(
                        //                               crossAxisAlignment:
                        //                                   CrossAxisAlignment
                        //                                       .center,
                        //                               children: [
                        //                                 Image(
                        //                                   image: AssetImage(
                        //                                       'lib/assets/images/sunshine.png'),
                        //                                   fit: BoxFit.fill,
                        //                                   width: 25,
                        //                                   height: 25,
                        //                                 ),
                        //                                 SizedBox(
                        //                                   width: 5,
                        //                                 ),
                        //                                 Text(
                        //                                   'حالت روشن',
                        //                                   style: GoogleFonts.vazirmatn(
                        //                                       fontSize: 12,
                        //                                       color: Colors
                        //                                           .black,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w500),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                             Visibility(
                        //                               visible: visible,
                        //                               child: Icon(
                        //                                 Icons.done,
                        //                                 size: 20,
                        //                                 color: Colors.blue,
                        //                               ),
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 5,
                        //                       ),
                        //                       Divider(),
                        //                       SizedBox(
                        //                         height: 5,
                        //                       ),
                        //                       InkWell(
                        //                         onTap: () {},
                        //                         child: Row(
                        //                           crossAxisAlignment:
                        //                               CrossAxisAlignment
                        //                                   .center,
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment
                        //                                   .spaceBetween,
                        //                           children: [
                        //                             Row(
                        //                               crossAxisAlignment:
                        //                                   CrossAxisAlignment
                        //                                       .center,
                        //                               children: [
                        //                                 Image(
                        //                                   image: AssetImage(
                        //                                       'lib/assets/images/moon.png'),
                        //                                   fit: BoxFit.fill,
                        //                                   width: 19,
                        //                                   height: 19,
                        //                                 ),
                        //                                 SizedBox(
                        //                                   width: 9,
                        //                                 ),
                        //                                 Text(
                        //                                   'حالت تاریک',
                        //                                   style: GoogleFonts.vazirmatn(
                        //                                       fontSize: 12,
                        //                                       color: Colors
                        //                                           .black,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w500),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                             Visibility(
                        //                               visible: visible,
                        //                               child: Icon(
                        //                                 Icons.done,
                        //                                 size: 20,
                        //                                 color: Colors.blue,
                        //                               ),
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         height: 5,
                        //                       ),
                        //                       Divider(),
                        //                       InkWell(
                        //                         onTap: () {},
                        //                         child: Row(
                        //                           crossAxisAlignment:
                        //                               CrossAxisAlignment
                        //                                   .center,
                        //                           mainAxisAlignment:
                        //                               MainAxisAlignment
                        //                                   .spaceBetween,
                        //                           children: [
                        //                             Row(
                        //                               crossAxisAlignment:
                        //                                   CrossAxisAlignment
                        //                                       .center,
                        //                               children: [
                        //                                 Padding(
                        //                                   padding:
                        //                                       const EdgeInsets
                        //                                           .only(
                        //                                           top: 5),
                        //                                   child: Image(
                        //                                     image: AssetImage(
                        //                                         'lib/assets/images/sun.png'),
                        //                                     fit: BoxFit.fill,
                        //                                     width: 23,
                        //                                     height: 25,
                        //                                   ),
                        //                                 ),
                        //                                 SizedBox(
                        //                                   width: 5,
                        //                                 ),
                        //                                 Text(
                        //                                   'پیروی از دستگاه',
                        //                                   style: GoogleFonts.vazirmatn(
                        //                                       fontSize: 12,
                        //                                       color: Colors
                        //                                           .black,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .w500),
                        //                                 ),
                        //                               ],
                        //                             ),
                        //                             Visibility(
                        //                               visible: true,
                        //                               child: Icon(
                        //                                 Icons.done,
                        //                                 size: 20,
                        //                                 color: Colors.blue,
                        //                               ),
                        //                             ),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           );
                        //         },
                        //       );
                        //     },
                        //     child: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment:
                        //           MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Row(
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.center,
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.only(top: 3),
                        //               child: Image(
                        //                 image: AssetImage(
                        //                     'lib/assets/images/sun.png'),
                        //                 fit: BoxFit.fill,
                        //                 width: 27,
                        //                 height: 27,
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               width: 6,
                        //             ),
                        //             Text(
                        //               'حالت نمایش اپ',
                        //               style: GoogleFonts.vazirmatn(
                        //                   fontSize: 14,
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //           ],
                        //         ),
                        //         Row(
                        //           children: [
                        //             Text(
                        //               'پیروی از دستگاه',
                        //               style: GoogleFonts.vazirmatn(
                        //                   fontSize: 11,
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //             SizedBox(
                        //               width: 10,
                        //             ),
                        //             Icon(
                        //               Icons.arrow_forward_ios,
                        //               color: Colors.grey,
                        //               size: 15,
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 3,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 5),
                        //   child: Divider(),
                        // ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 7),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.questionScreen);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Image(
                                        image: AssetImage(
                                            'lib/assets/images/headphone.png'),
                                        fit: BoxFit.fill,
                                        width: 20,
                                        height: 21,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'پشتیبانی و سؤال‌های متداول',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Divider(),
                        ),
                        // SizedBox(
                        //   height: 3,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10, right: 3),
                        //   child: InkWell(
                        //     onTap: () {},
                        //     child: Row(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Row(
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.only(top: 2),
                        //               child: Image(
                        //                 image: AssetImage(
                        //                     'lib/assets/images/refresh.png'),
                        //                 fit: BoxFit.fill,
                        //                 width: 25,
                        //                 height: 25,
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               width: 9,
                        //             ),
                        //             Text(
                        //               'به‌روزرسانی',
                        //               style: GoogleFonts.vazirmatn(
                        //                   fontSize: 14,
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //           ],
                        //         ),
                        //         Row(
                        //           children: [
                        //             Text(
                        //               'نسخه 10.6.0',
                        //               style: GoogleFonts.vazirmatn(
                        //                   fontSize: 11,
                        //                   color: Colors.black,
                        //                   fontWeight: FontWeight.w500),
                        //             ),
                        //             SizedBox(
                        //               width: 10,
                        //             ),
                        //             Icon(
                        //               Icons.arrow_forward_ios,
                        //               color: Colors.grey,
                        //               size: 15,
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 3,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 5),
                        //   child: Divider(),
                        // ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.nikooRatingScreen);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Image(
                                        image: AssetImage(
                                            'lib/assets/images/star.png'),
                                        fit: BoxFit.fill,
                                        width: 21,
                                        height: 21,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Text(
                                      'امتیاز به نیکوبوک',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Divider(),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 3),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    width: 300,
                                    height: 300,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                        ),
                                        Text(
                                          'خروج از برنامه',
                                          style: GoogleFonts.vazirmatn(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 100,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            RawMaterialButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              fillColor: primaryColor,
                                              child: Text(
                                                'خروج',
                                                style: GoogleFonts.vazirmatn(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red),
                                              ),
                                              onPressed: () {
                                                _exitApp(context);
                                                removeToken();
                                              },
                                            ),
                                            RawMaterialButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              fillColor: primaryColor,
                                              child: Text(
                                                'برگشت',
                                                style: GoogleFonts.vazirmatn(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(
                                                    context); // removeToken().then(
                                                //   (value) {
                                                //     Navigator.pushNamed(context,
                                                //         MyRoutes.initScreen);
                                                //   },
                                                // );
                                              },
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Image(
                                        image: AssetImage(
                                            'lib/assets/images/exit.png'),
                                        fit: BoxFit.fill,
                                        width: 19,
                                        height: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'خروج از حساب کاربری',
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 14,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Image(
                image: AssetImage('lib/assets/images/logo.png'),
                width: 70,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'App Version: 10.6.0 dd',
                style: GoogleFonts.vazirmatn(color: Colors.grey, fontSize: 8),
              )
            ],
          ),
        ),
      ),
    );
  }
}
