import 'package:bookapp/controller/api/search_fillter/search_fillter.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
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
                                    'سوال دارید؟ جواب اینجاست',
                                    style: GoogleFonts.rubik(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
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
                                          body: BookSearchDto(
                                              name: searchNumber.text))
                                      .then(
                                    (value) {
                                      Navigator.pushNamed(context,
                                          MyRoutes.searchFillterScreen);
                                    },
                                  );
                                },
                                cursorHeight: 20,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 18,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                    label: Text(
                                      'جستجو در نیکو بوک',
                                      style: GoogleFonts.vazirmatn(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    filled: true,
                                    fillColor: backgroundColor,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(5))),
                              )),
                        )
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
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'سوالات مرتبط با اپلیکیشن و خدمات',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'چگونه میتوانم اپلیکیشن را دانلود کنم ؟ ',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا استفاده از اپلیکیشن رایگان است ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا امکان خرید کتاب های الکترونیکی و کاغذی از طریق اپلیکیشن وجود دارد ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا اپلیکیشن شما فقط کتاب های دندان پزشکی را ارائه میدهد ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'چگونه میتوانم حساب کاربری ایجاد کنم ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'سوالات مرتبط با کتاب ها',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'کتاب های موجود در اپلیکیشن چه ناشرانی را پوشش میدهد ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا امکان پیش نمایش کتاب ها قبل از خرید وجود دارد ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا کتاب های الکترونیکی با فرمت های ( PDF,EPUB ) در دسترس است ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا تمامی کتاب ها نسخه چاپی و الکترونیکی دارند ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'چگونه میتوانم کتاب های الکترونیکی خریداری شده را مطالعه کنم ؟ ',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'سوالات مرتبط با پرداخت و ارسال',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'روش های پرداخت قابل قبول چیست ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'چقدر طول میکشه تا کتاب چاپی به دست من برسه ؟ ',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا ارسال کتاب چاپی شامل هزینه اضافی میشود ؟ ',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا امکان پرداخت در محل برای کتاب های چاپی وجود دارد ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'چگونه میتوانم کد تخفیف یا کارت هدیه خود را اعمال کنم ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'سوالات مرتبط با پشتیبانی',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'اگر در حین خرید مشکلی پیش آمد چگونه میتوانم کمک بگیرم ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا امکان بازگشت کتاب های چاپی وجود دارد ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'اگر کتاب الکترونیکی خریداری شده دانلود نشد چه کاری باید انجام دهم ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'چگونه میتوانم تاریخچه خریدهای خود را مشاهده کنم ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'چگونه میتوانم در مورد مشکلات یا سوالات فنی با شما تماس بگیرم ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'سوالات مرتبط با محتوا و پیشنهادات',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا میتوانم کتاب های دلخواه خود را به شما پیشنهاد کنم ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا کتاب های اپلیکیشن به روزرسانی میشوند ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'چگونه میتوانم از کتاب های جدید یا تخفیف های ویژه مطلع شوم ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا محتوای کتاب ها براساس سیستم آموزشی خاصی طراحی شده است ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'آیا در اپلیکیشن قابلیت جستجو براساس موضوع یا نویسنده وجود دارد ؟',
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
