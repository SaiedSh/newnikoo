import 'package:bookapp/controller/api/auth/login_controller_post.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _countryCode = '+98';
  TextEditingController _phoneController = TextEditingController();
  final PageController _controller = PageController(initialPage: 0);
  bool visible = true;
  bool isValid = false;
  bool isLoading = false; // برای نشون دادن لودینگ روی دکمه

  void _checkPhoneNumber(String value) {
    if (value.length == 11 && value.startsWith('09')) {
      setState(() {
        isValid = true;
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  void _onLoginPressed() async {
    if (!isValid) return;

    setState(() {
      isLoading = true;
    });

    final result = await login(
      phoneNumber: _phoneController.text,
      context: context,
    );

    setState(() {
      isLoading = false;
    });

    if (result.isSuccess == true) {
      Navigator.pushNamed(
        context,
        MyRoutes.otpScreen,
        arguments: _phoneController.text,
      );
    }
    // اینجا میتونی مثلا اگه isSuccess == false بود یک ارور نشون بدی
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          image: AssetImage('lib/assets/images/iconperson.png'),
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
                Form(
                  key: _formKey,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          onChanged: _checkPhoneNumber,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفاً این فیلد را پر کنید';
                            } else if (value.length < 11) {
                              return 'شماره موبایل را به درستی وارد کنید';
                            }
                            return null;
                          },
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
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
                ),
                SizedBox(
                  width: 300,
                  height: 45,
                  child: RawMaterialButton(
                    fillColor: isValid ? secondaryColor : Colors.grey.shade300,
                    child: isLoading
                        ? SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Text(
                            'ورود',
                            style: GoogleFonts.vazirmatn(
                                color: isValid ? Colors.white : Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: isValid && !isLoading ? _onLoginPressed : null,
                    // onPressed: () async {
                    //   if (_formKey.currentState!.validate()) {
                    //     // همه‌چی درسته
                    //     setState(() {
                    //       visible = false;
                    //     });
                    //     login(
                    //             phoneNumber: _phoneController.text,
                    //             context: context)
                    //         .then(
                    //       (value) {
                    //         if (value.isSuccess == true) {
                    //           Navigator.pushNamed(
                    //               context, MyRoutes.otpScreen,
                    //               arguments: _phoneController.text);
                    //         }
                    //       },
                    //     );
                    //   } else {
                    //     // یکی از فیلدها ایراد داره
                    //     print('لطفاً خطاها را برطرف کنید');
                    //   }
                    // },
                  ),
                ),
                SizedBox(
                  height: 40,
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
    );
  }
}
