import 'package:bookapp/controller/api/auth/login_controller_post.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _countryCode = '+98';
  TextEditingController _phoneController = TextEditingController();
  final PageController _controller = PageController(initialPage: 0);
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.loginScreen);
                      },
                      child: Text(
                        'رد کردن',
                        style: GoogleFonts.vazirmatn(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Image(
                          image: AssetImage('lib/assets/images/pageone.png'),
                          fit: BoxFit.fill,
                          width: 330,
                          height: 250,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          'به شیوه تو: خریدن یا دسترسی مدت دار یا کتاب فیزیکی؟',
                          style: GoogleFonts.vazirmatn(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      ' دوست داری چطور کتابخانه ات را پر کنی؟ می توانی نسخه',
                                  style: GoogleFonts.vazirmatn(
                                      fontSize: 13,
                                      height: 1.8,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      ' دیجیتال کتاب های دلخواهت را بخری یا با مشترک شدن در نیک بوک',
                                  style: GoogleFonts.vazirmatn(
                                      fontSize: 13,
                                      height: 1.8,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      ' پلاس در طول زمان اشتراک به کتاب های دلخواهت دسترسی داشته',
                                  style: GoogleFonts.vazirmatn(
                                      fontSize: 13,
                                      height: 1.8,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' باشی یا دلت میخواد کتابو لمس کنی',
                                  style: GoogleFonts.vazirmatn(
                                      fontSize: 13,
                                      height: 1.8,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 65, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedSmoothIndicator(
                          activeIndex: 0,
                          count: 2,
                          effect: ExpandingDotsEffect(
                              activeDotColor: secondaryColor,
                              dotHeight: 10,
                              dotWidth: 10,
                              dotColor: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.loginScreen);
                      },
                      child: Text(
                        'رد کردن',
                        style: GoogleFonts.vazirmatn(color: Colors.grey),
                      )),
                )
              ],
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Image(
                          image: AssetImage('lib/assets/images/pagetwo.png'),
                          fit: BoxFit.fill,
                          width: 330,
                          height: 250,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          'در دستگاه دلخواه تو',
                          style: GoogleFonts.vazirmatn(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      'موبایل یا کامپیوتر؟ نیکوبوک یا تبلت؟ همزمان می توانی با ',
                                  style: GoogleFonts.vazirmatn(
                                      height: 1.8,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      '3 دستگاه مختلف به کتابخانه ات سر بزنی و مطالعه کنی',
                                  style: GoogleFonts.vazirmatn(
                                      height: 1.8,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 50, right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        AnimatedSmoothIndicator(
                          activeIndex: 1,
                          count: 2,
                          effect: ExpandingDotsEffect(
                              activeDotColor: secondaryColor,
                              dotHeight: 10,
                              dotWidth: 10,
                              dotColor: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image(
                                image: AssetImage(
                                    'lib/assets/images/iconperson.png'),
                                width: 45,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'شروع کار با نیکو بوک',
                                style: GoogleFonts.vazirmatn(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'با شماره موبایل تان وارد شوید',
                                style: GoogleFonts.vazirmatn(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: 300,
                            height: 45,
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey))),
                                    child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: CountryCodePicker(
                                          padding: const EdgeInsets.all(0),
                                          flagDecoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          textStyle: GoogleFonts.vazirmatn(
                                              fontSize: 16,
                                              color: Colors.black),
                                          onChanged: (countryCode) {
                                            setState(() {
                                              _countryCode = countryCode
                                                      .dialCode ??
                                                  '+98'; // Default to +98 if null
                                            });
                                          },
                                          initialSelection:
                                              'IR', // Default to Iran
                                          favorite: [
                                            '+98',
                                            'IR'
                                          ], // Favorite country (Iran)
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                hintText: 'شماره موبایل',
                                hintStyle: GoogleFonts.vazirmatn(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visible,
                        replacement: SizedBox(
                          height: 45,
                          width: 300,
                          child: RawMaterialButton(
                              fillColor: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: LoadingAnimationWidget.fourRotatingDots(
                                    color: primaryColor, size: 20),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: null),
                        ),
                        child: SizedBox(
                          width: 300,
                          height: 45,
                          child: RawMaterialButton(
                            fillColor: Colors.grey.shade300,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'ورود',
                                    style: GoogleFonts.vazirmatn(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () async {
                              setState(() {
                                visible = false;
                              });
                              login(
                                      phoneNumber: _phoneController.text,
                                      context: context)
                                  .then(
                                (value) {
                                  if (value.isSuccess == true) {
                                    Navigator.pushNamed(
                                        context, MyRoutes.otpScreen,
                                        arguments: _phoneController.text);
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Divider(),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 25),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Expanded(child: Divider()),
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 15),
                      //         child: Padding(
                      //           padding: const EdgeInsets.only(bottom: 8),
                      //           child: Text(
                      //             'یا',
                      //             style: GoogleFonts.vazirmatn(
                      //                 color: Colors.grey,
                      //                 fontWeight: FontWeight.w500),
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(child: Divider())
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 40,
                      // ),
                      // SizedBox(
                      //   width: 300,
                      //   child: RawMaterialButton(
                      //     fillColor: Colors.white,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(bottom: 5),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             'با ایمیل',
                      //             style: GoogleFonts.vazirmatn(
                      //                 fontSize: 12, fontWeight: FontWeight.bold),
                      //           ),
                      //           SizedBox(
                      //             width: 5,
                      //           ),
                      //           Image(
                      //             image: AssetImage('lib/assets/images/email.png'),
                      //             width: 25,
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //         side: BorderSide(width: 0.5, color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(5)),
                      //     onPressed: () async {},
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 300,
                      //   child: RawMaterialButton(
                      //     fillColor: Colors.white,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(bottom: 5),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             'با حساب گوگل',
                      //             style: GoogleFonts.vazirmatn(
                      //                 fontSize: 12, fontWeight: FontWeight.bold),
                      //           ),
                      //           SizedBox(
                      //             width: 5,
                      //           ),
                      //           Image(
                      //             image: AssetImage('lib/assets/images/google.png'),
                      //             width: 25,
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //         side: BorderSide(width: 0.5, color: Colors.grey),
                      //         borderRadius: BorderRadius.circular(5)),
                      //     onPressed: () async {},
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'از نیکو بوک را میپذیرم',
                              style: GoogleFonts.vazirmatn(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'قوانین استفاده',
                                  style: GoogleFonts.vazirmatn(
                                    decorationColor: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
