import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageTwoScreen extends StatelessWidget {
  const PageTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      fontSize: 14,
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
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text:
                                '۳ دستگاه مختلف به کتابخانه ات سر بزنی و مطالعه کنی',
                            style: GoogleFonts.vazirmatn(
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, right: 20, left: 20),
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
    );
  }
}
