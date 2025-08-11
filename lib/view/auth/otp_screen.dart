import 'dart:async';

import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../controller/api/auth/login_controller_post.dart';

class OtpScreen extends StatefulWidget {
  final String phonenumber;

  OtpScreen({
    super.key,
    required this.phonenumber,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otp = TextEditingController();

  DateTime dateTime = DateTime.now();

  Timer? _timer;
  bool visible = true;
  bool timerVisible = false;
  int _start = 60;
  // Set the initial countdown value (30 seconds)
  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when the widget initializes
  }

  void startTimer() {
    timerVisible = true;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timerVisible = false;
            timer.cancel();

            setState(() {
              visible = false;
              _start = 60;
            });
            // Stop the timer when countdown is finished
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage('lib/assets/images/phone.png'),
                          width: 65,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'تایید شماره موبایل',
                          style: GoogleFonts.vazirmatn(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'کدی را که به شماره ${widget.phonenumber} فرستادیم اینجا بنویس',
                          style: GoogleFonts.vazirmatn(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Pinput(
                      controller: otp,
                      length: 4, // Number of input fields
                      onCompleted: (pin) {
                        // Action to perform after entering the PIN
                        if (pin.length == 4) {
                          otp.text = pin;
                        }
                      },
                      onChanged: (value) {
                        print('PIN Changed: $value');
                      },
                      // Customization options for the input fields
                      defaultPinTheme: PinTheme(
                        width: 45,
                        height: 45,
                        textStyle: GoogleFonts.vazirmatn(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 45,
                        height: 45,
                        textStyle: GoogleFonts.vazirmatn(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )),
                Visibility(
                  replacement: SizedBox(
                    width: 300,
                    height: 45,
                    child: RawMaterialButton(
                      fillColor: secondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ارسال مجدد',
                                style: GoogleFonts.vazirmatn(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        setState(() {
                          otp.clear();
                          visible = true;

                          startTimer();
                        });
                        login(
                          phoneNumber: widget.phonenumber,
                          context: context,
                        );

                        // loginOtp(
                        //   route: widget.route!,
                        //   context: context,
                        //   body: TempUserDto(
                        //     phoneNumber: widget.phonenumber,
                        //     otp: otp.text,
                        //   ),
                        // );
                      },
                    ),
                  ),
                  visible: visible,
                  child: SizedBox(
                    width: 300,
                    height: 45,
                    child: RawMaterialButton(
                      fillColor: secondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ورود',
                                style: GoogleFonts.vazirmatn(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () async {
                        loginOtp(
                          context: context,
                          body: TempUserDto(
                            phoneNumber: widget.phonenumber,
                            otp: otp.text,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: timerVisible,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_start ثانیه',
                          style: GoogleFonts.vazirmatn(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'تا پایان اعتبار کد',
                          style: GoogleFonts.vazirmatn(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                  color: Colors.blue,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.loginScreen);
                    },
                    child: Text(
                      'ویرایش شماره موبایل',
                      style: GoogleFonts.vazirmatn(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
