import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageOneScreen extends StatelessWidget {
  const PageOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.pageTwo);
                },
                child: Text(
                  'رد کردن',
                  style: GoogleFonts.vazirmatn(
                    color: Colors.grey,
                  ),
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
                        fontWeight: FontWeight.bold, fontSize: 18),
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
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text:
                                ' دیجیتال کتاب های دلخواهت را بخری یا با مشترک شدن در نیک بوک',
                            style: GoogleFonts.vazirmatn(
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text:
                                ' پلاس در طول زمان اشتراک به کتاب های دلخواهت دسترسی داشته',
                            style: GoogleFonts.vazirmatn(
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: ' باشی یا دلت میخواد کتابو لمس کنی',
                            style: GoogleFonts.vazirmatn(
                              color: Colors.black,
                            ))
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
    );
  }
}
