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
                                style: GoogleFonts.vazirmatn(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
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
                      style: GoogleFonts.vazirmatn(
                          fontWeight: FontWeight.bold, fontSize: 14),
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'شما می توانید اپلیکیشن را از طریق فروشگاهای رسمی مانند Google Play ، App Store یا وب سایت رسمی ما دانلود کنید . همچنین لینک دانلود مستقیم در سایت ما موجود است .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'بله ، دانلود و استفاده از اپلیکیشن رایگان است . اما برای خرید برخی کتاب های الکترونیکی و چاپی نیاز به پرداخت هزینه دارید . همچنین ممکن است برخی کتاب ها به صورت رایگان در دسترس باشند .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'بله ، شما می توانید هم نسخه های الکترونیکی PDF ، EPUB و هم نسخه های چاپی کتاب ها را از طریق اپلیکیشن خریداری کنید . کتاب های چاپی پس از خرید برای شما ارسال خواهند شد .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'خیر ، در اپلیکیشن ما علاوه بر کتاب های دندان پزشکی ، مجموعه ای از کتاب های علمی ، دانشگاهی ، عمومی و سایر موضوعات نیز موجود است .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'برای ایجاد حساب کاربری ، کافی است پس از نصب اپلیکیشن ، گزینه "ثبت نام" را انتخاب کنید ، شماره موبایل یا ایمیل خود را وارد کنید ، سپس کد تاییدی که دریافت میکنید را وارد کرده و اطلاعات مورد نیاز را تکمیل کنید . '),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
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
                      style: GoogleFonts.vazirmatn(
                          fontWeight: FontWeight.bold, fontSize: 14),
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'ما با ناشرانی معتبر داخلی و بین المللی همکاری میکنیم و کتاب های منتشر شده توسط ناشرانی علمی ، دانشگاهی و عمومی را ارائه می دهیم . لیست کامل ناشران در بخش مربوطه اپلیکیشن قابل مشاهده است .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'بله ، برای برخی از کتاب ها امکان مشاهده چند صفحه اول به عنوان پیش نمایش وجود دارد تا قبل از خرید از محتوا آگاه شوید .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'بله ، کتاب های الکترونیکی بسته به نسخه ارائه شده از سوی ناشر در فرمت های PDF یا EPUB قابل دانلود و مطالعه است .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 10.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'خیر ، برخی از کتاب ها فقط در قالب نسخه الکترونیکی و برخی دیگر فقط به صورت چاپی ارائه می شوند . در صفحه هر کتاب مشخص شده که چه نسخه هایی در دسترس است.'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      ' پس از خرید ، کتاب های الکترونیکی در بخش "کتابخانه من" در اپلیکیشن شما قرار می گیرند . می توانید آن ها را مستقیما در اپلیکیشن مطالعه کنید و در صورت نیاز ، برای مطالعه آفلاین دانلود نمایید . '),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        ],
                      ),
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
                      style: GoogleFonts.vazirmatn(
                          fontWeight: FontWeight.bold, fontSize: 14),
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'شما می توانید از طریق کارت های بانکی عضو شتاب ، کیف پول الکترونیکی و درگاه های پرداخت معتبر هزینه کتاب ها را پرداخت کنید .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'زمان تحویل کتاب چاپی بستگی به مکان ارسال و روش حمل و نقل دارد . معمولا بین 2 تا 7 روز کاری طول میکشد تا سفارش شما تحویل داده شود . اطلاعات دقیق تر در هنگام ثبت سفارش نمایش داده میشود . '),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'بله ، هزینه ارسال براساس مکان دریافت و روش ارسال محاسبه می شود و هنگام پرداخت نمایش داده خواهد شد . در برخی مناسبت ها و خریدهای بالای مبلغ مشخص ، ارسال رایگان ارائه می شود . '),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'در حال حاضر ، این امکان فقط در تهران و برای برخی روش های ارسال فعال است . لطفا هنگام ثبت سفارش ، گزینه های پرداخت در دسترس را بررسی کنید.'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'در مرحله پرداخت ، بخشی برای وارد کردن کد تخفیف یا کارت هدیه وجود دارد . پس از وارد کردن کد ، تخفیف مربوطه به فاکتور شما اعمال خواهد شد .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
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
                      style: GoogleFonts.vazirmatn(
                          fontWeight: FontWeight.bold, fontSize: 14),
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'اگر در حین خرید مشکلی پیش آمد ، می توانید از طریق بخش پشتیبانی اپلیکیشن یا چت آنلاین با تیم پشتیبانی تماس بگیرید . همچنین ، امکان ارسال تیکت پشتیبانی برای پیگیری دقیق تر وجود دارد .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 11.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'در صورت بروز مشکل در کیفیت یا ارسال اشتباه کتاب چاپی ، امکان بازگشت آن طبق قوانین بازگشت کالا وجود دارد . بریا درخواست بازگشت کتاب ، با تیم پشتیبانی تماس بگیرید .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'ابتدا اتصال اینترنت خود را بررسی کنید و دوباره اقدام به دانلود کنید . اگر مشکل حل نشد ، از بخش "کتابخانه من" اپلیکیشن برای دانلود مجدد استفاده کنید . در صورت ادامه مشکل ، با پشتیبانی تماس بگیرید . '),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'برای مشاهده سوابق خرید ، به بخش "سفارش های من" در پروفایل اپلیکیشن مراجعه کنید در این قسمت تمامی خرید های شما ، چه کتاب های الکترونیکی و چه چاپی ، در دسترس است .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'برای ارتباط با پشتیبانی در مورد مشکلات فنی ، می توانید از طریق چت آنلاین ، ایمیل یا ارسال تیکت با تیم پشتیبانی تماس بگیرید . اطلاعات تماس در بخش "تماس با ما" موجود است .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ],
                      ),
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
                      style: GoogleFonts.vazirmatn(
                          fontWeight: FontWeight.bold, fontSize: 14),
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'بله ، شما می توانید کتاب های دلخواه خود را از طریق بخش "پیشنهاد کتاب" در اپلیکیشن برای ما ارسال کنید . ما پیشنهادات شما را بررسی کرده و در صورت امکان ، کتاب را به مجموعه خود اضافه خواهیم کرد . '),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 11.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'بله ، کتاب ها به طور مرتب به روزرسانی می شوند . ما به روزترین نسخه ها را از ناشران دریافت کرده و در اپلیکیشن قرار می دهیم . اگر نسخه جدیدی از کتابی منتشر شود ، شما از طریق اپلیکیشن اطلاع رسانی خواهید شد .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'برای اطلاع از کتاب های جدید و تخفیف های ویژه ، می توانید از طریق خبرنامه ، اعلان های اپلیکیشن یا پیگیری صفحات اجتماعی ما مطلع شوید . همچنین در قسمت "تخفیف ها" در اپلیکیشن همیشه جدیدترین پیشنهادات در دسترس است .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'بسته به موضوع کتاب ، برخی از کتاب ها برای سیستم های آموزشی خاص مثلا آموزش دانشگاهی یا آمادگی برای آزمون ها طراحی شده اند . برای کتاب های مربوط به رشته های خاص ، توضیحات مربوطه در صفحه کتاب ذکر می شود .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 3),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold),
                                      textDirection: TextDirection.rtl,
                                      'بله ، شما می توانید از قابلیت جستجو در اپلیکیشن برای یافتن کتاب ها براساس موضوع ، نویسنده یا عنوان استفاده کنید . این جستجو به شما کمک میکند تا به راحتی کتاب های مورد نظر خود را پیدا کنید .'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                            style: GoogleFonts.vazirmatn(
                                fontWeight: FontWeight.bold, fontSize: 10.5),
                          ),
                        ],
                      ),
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
