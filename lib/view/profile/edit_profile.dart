import 'dart:io';

import 'package:bookapp/controller/api/profile/get_profile.dart';
import 'package:bookapp/controller/api/profile/update_profile.dart';
import 'package:bookapp/controller/provider/profile_state.dart';
import 'package:bookapp/controller/provider/shop_card_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/controller/service/loader.dart';
import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int _selectedValue = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfile(context: context).then(
      (value) {
        _selectedValue = ProfileState.profile!.sex == Sex.male ? 1 : 2;
        name.text = ProfileState.profile!.firstName != null
            ? ProfileState.profile!.firstName.toString()
            : "";
        familyName.text = ProfileState.profile!.lastName != null
            ? ProfileState.profile!.lastName.toString()
            : "";
        phonenumber.text = ProfileState.profile!.phoneNumber.toString();
        nationalCode.text = ProfileState.profile!.nationalCode != null
            ? ProfileState.profile!.nationalCode.toString()
            : "";
        pervImage = ProfileState.profile!.userAvatar!;
        _selectedOptionIdsCategories = List.generate(
          ProfileState.profile!.categories!.length,
          (index) => ProfileState.profile!.categories![index].title.toString(),
        );
        // expertiseController.text = ProfileState.profile!.expertiseId.toString();
      },
    );
  }

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController familyName = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController nationalCode = TextEditingController();
  String? pervImage;
  List<CategoryDto> optionsCategories =
      ProfileState.profile!.categories!.toList();
  List<String> _selectedOptionIdsCategories = [];

  // باز کردن دیالوگ چند‌انتخابی
  void _openMultiSelectDialogCategories() async {
    final List<String> selectedIds = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialogCategories(
          options: optionsCategories,
          selectedOptionIds: _selectedOptionIdsCategories,
        );
      },
    );

    if (selectedIds != null) {
      setState(() {
        _selectedOptionIdsCategories = selectedIds;
        print('$_selectedOptionIdsCategories' + 'Hereleeeey');
      });
    }
  }

  TextEditingController expertiseController = TextEditingController();
  List<ExpertiseDto> optionsExpertises =
      ProfileState.profile!.expertises!.toList();
  String? _selectedOptionIdsExpertises;

  // باز کردن دیالوگ چند‌انتخابی
  // void _openMultiSelectDialogExpertises() async {
  //   final List<String> selectedIds = await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return MultiSelectDialogExpertises(
  //         options: optionsExpertises,
  //         selectedOptionIds: _selectedOptionIdsExpertises,
  //       );
  //     },
  //   );

  //   if (selectedIds != null) {
  //     setState(() {
  //       _selectedOptionIdsExpertises = selectedIds;
  //       print('$_selectedOptionIdsExpertises' + 'Hereleeeey');
  //     });
  //   }
  // }
  DateTime? finalDate;
  // CategoryDto? selectedValue;
  void _showPersianDatePicker() async {
    Jalali? picked = await showPersianDatePicker(
      initialDatePickerMode: PersianDatePickerMode.year,
      initialEntryMode: PersianDatePickerEntryMode.input,
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1300, 1, 1),
      lastDate: Jalali(1450, 12, 29),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked.formatShortDate();
        finalDate = picked.toDateTime();
      });
    }
  }

  String _convertPersianNumberToEnglish(String input) {
    Map<String, String> persianToEnglishNumbers = {
      '۰': '0',
      '۱': '1',
      '۲': '2',
      '۳': '3',
      '۴': '4',
      '۵': '5',
      '۶': '6',
      '۷': '7',
      '۸': '8',
      '۹': '9'
    };

    return input.split('').map((char) {
      return persianToEnglishNumbers[char] ?? char;
    }).join('');
  }

  void _handleDateInput(String inputDate) {
    String englishDate = _convertPersianNumberToEnglish(inputDate);

    try {
      // به طور مستقیم از فرمت فارسی Jalali استفاده می‌کنیم
      List<String> dateParts = englishDate.split('/');
      if (dateParts.length == 3) {
        int year = int.parse(dateParts[0]);
        int month = int.parse(dateParts[1]);
        int day = int.parse(dateParts[2]);

        Jalali parsedDate =
            Jalali(year, month, day); // تبدیل تاریخ فارسی به Jalali
        setState(() {
          selectedDate = parsedDate.formatShortDate();
          finalDate = parsedDate.toDateTime();
        });
      } else {
        print('Invalid date format');
      }
    } catch (e) {
      print('Error parsing date: $e');
    }
  }

  final _formKey = GlobalKey<FormState>();
  // DateTime startDate = DateTime.now();
  String selectedDate = 'تاریخ تولد';
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(55),
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
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
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
                      ],
                    ),
                  ),
                ),
              ),
            )),
        backgroundColor: backgroundColor,
        body: Consumer<ProfileState>(
          builder: (context, value, child) => SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 5, top: 15),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                _image == null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: pervImage != null
                                            ? Image.network(
                                                pervImage.toString(),
                                                fit: BoxFit.fill,
                                                width: 80,
                                                height: 80,
                                              )
                                            : Image(
                                                image: AssetImage(
                                                    'lib/assets/images/profilee.png'),
                                                width: 80,
                                                height: 80,
                                              ),
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.file(
                                          File(_image!.path),
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                // _image == null
                                //     // ? Image(
                                //     //     image: AssetImage(
                                //     //         'lib/assets/images/profilee.png'),
                                //     //     width: 80,
                                //     //     height: 80,
                                //     //   )
                                //     ? ClipRRect(
                                //         borderRadius: BorderRadius.circular(100),
                                //         child: pervImage != null
                                //             ? Image.network(pervImage.toString())
                                //             : Image(
                                //                 image: AssetImage(
                                //                     'lib/assets/images/profilee.png'),
                                //                 width: 80,
                                //                 height: 80,
                                //               ),
                                //       )
                                //     : ClipRRect(
                                //         borderRadius: BorderRadius.circular(100),
                                //         child: pervImage != null
                                //             ? Image.file(
                                //                 File(_image!.path),
                                //                 width: 80,
                                //                 height: 80,
                                //                 fit: BoxFit.fill,
                                //               )
                                //             : Image.network(pervImage.toString()),
                                //       ),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () => _pickImage(ImageSource.gallery),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'lib/assets/images/camera.png'),
                                        width: 12,
                                        height: 11,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        'ویرایش عکس',
                                        style: GoogleFonts.vazirmatn(
                                            color: Color.fromARGB(
                                                255, 0, 174, 212),
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 45, // ارتفاع ثابت
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return " "; // مقدار خالی نگذارید تا فیلد دچار تغییر سایز نشود
                                      }
                                      return null;
                                    },
                                    cursorHeight: 18,
                                    controller: name,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10, left: 10),
                                        child: Image(
                                          image: AssetImage(
                                              'lib/assets/images/iconcm.png'),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      label: Text(
                                        'نام',
                                        style: GoogleFonts.vazirmatn(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 12),
                                      errorStyle: TextStyle(
                                          fontSize: 0,
                                          height: 0), // جلوگیری از تغییر ارتفاع
                                    ),
                                    style: GoogleFonts.vazirmatn(
                                      fontSize: 14,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45, // ارتفاع ثابت
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return " "; // مقدار خطا نباید خالی باشد تا تغییر سایز رخ ندهد
                                      }
                                      return null;
                                    },
                                    cursorHeight: 18,
                                    controller: familyName,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10, left: 10),
                                        child: Image(
                                          image: AssetImage(
                                              'lib/assets/images/iconcm.png'),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      label: Text(
                                        'نام خانوادگی',
                                        style: GoogleFonts.vazirmatn(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 12),
                                      errorStyle: TextStyle(
                                          fontSize: 0,
                                          height: 0), // جلوگیری از تغییر ارتفاع
                                    ),
                                    style: GoogleFonts.vazirmatn(
                                      fontSize: 14,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                IgnorePointer(
                                  child: SizedBox(
                                    height: 45,
                                    child: TextField(
                                      controller: phonenumber,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 7, bottom: 5, left: 10),
                                          child: Image(
                                            image: AssetImage(
                                                'lib/assets/images/mobilee.png'),
                                            color: Colors.grey,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        label: Text(
                                          'شماره موبایل',
                                          style: GoogleFonts.vazirmatn(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 12), // اضافه‌شده
                                      ),
                                      style: GoogleFonts.vazirmatn(
                                          fontSize: 14,
                                          height: 1.5), // تنظیم ارتفاع خط
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextField(
                                    controller: nationalCode,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            right: 10,
                                            bottom: 10,
                                            left: 16),
                                        child: Image(
                                          width: 5,
                                          height: 5,
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'lib/assets/images/cod.png'),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      label: Text(
                                        'کد ملی',
                                        style: GoogleFonts.vazirmatn(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 12), // تنظیم فاصله داخلی
                                    ),
                                    style: GoogleFonts.vazirmatn(
                                        fontSize: 14,
                                        height: 1.5), // تنظیم ارتفاع متن
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Column(
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.symmetric(
                                //           horizontal: 3),
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Text(
                                //             'رمز ورود',
                                //             style: GoogleFonts.vazirmatn(
                                //                 fontSize: 12,
                                //                 color: Colors.grey,
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //           FaIcon(
                                //             FontAwesomeIcons.penToSquare,
                                //             size: 20,
                                //           )
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.symmetric(horizontal: 3),
                                //   child: Row(
                                //     children: [
                                //       Text(
                                //         '*********',
                                //         style: GoogleFonts.vazirmatn(
                                //             fontSize: 10,
                                //             color: Colors.black,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 18,
                                // ),
                                // Row(
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.symmetric(
                                //           horizontal: 3),
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Text(
                                //             'جنسیت',
                                //             style: GoogleFonts.vazirmatn(
                                //                 fontSize: 12,
                                //                 color: Colors.grey.shade800,
                                //                 fontWeight: FontWeight.w500),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 13,
                                // ),
                                // Row(
                                //   children: [
                                //     Container(
                                //       height: 28,
                                //       width: 80,
                                //       decoration: BoxDecoration(
                                //           border:
                                //               Border.all(color: Colors.grey),
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //       child: Center(
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.start,
                                //           children: [
                                //             Transform.scale(
                                //               scale: 0.8,
                                //               child: Radio<int>(
                                //                 activeColor: Colors.black,
                                //                 value: 1,
                                //                 groupValue: _selectedValue,
                                //                 onChanged: (int? value) {
                                //                   setState(() {
                                //                     _selectedValue = value!;
                                //                   });
                                //                 },
                                //               ),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(
                                //                   bottom: 4),
                                //               child: Text(
                                //                 'مرد',
                                //                 style: GoogleFonts.vazirmatn(
                                //                     fontSize: 10,
                                //                     color: Colors.grey.shade800,
                                //                     fontWeight:
                                //                         FontWeight.w500),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 14,
                                //     ),
                                //     Container(
                                //       height: 28,
                                //       width: 80,
                                //       decoration: BoxDecoration(
                                //           border:
                                //               Border.all(color: Colors.grey),
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //       child: Center(
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.start,
                                //           children: [
                                //             Transform.scale(
                                //               scale: 0.8,
                                //               child: Radio<int>(
                                //                 activeColor: Colors.black,
                                //                 value: 2,
                                //                 groupValue: _selectedValue,
                                //                 onChanged: (int? value) {
                                //                   setState(() {
                                //                     _selectedValue = value!;
                                //                   });
                                //                 },
                                //               ),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(
                                //                   bottom: 4),
                                //               child: Text(
                                //                 'زن',
                                //                 style: GoogleFonts.vazirmatn(
                                //                     fontSize: 10,
                                //                     color: Colors.grey.shade800,
                                //                     fontWeight:
                                //                         FontWeight.w500),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                // DatePicker(
                                //     height: 50,
                                //     selectedDate: selectedDate.persianToEN(),
                                //     label: selectedDate,
                                //     onTap: _showPersianDatePicker
                                //     // final DateTime? dateTime = await showDatePicker(
                                //     //     context: context,
                                //     //     initialDate: startDate,
                                //     //     firstDate: DateTime(1900),
                                //     //     lastDate: DateTime(3000));
                                //     // if (dateTime != null) {
                                //     //   setState(() {
                                //     //     startDate = dateTime;
                                //     //   });
                                //     // }

                                //     ),

                                // SizedBox(
                                //   height: 15,
                                // ),
                                // Container(
                                //   height: 45,
                                //   child: TextField(
                                //     onTap: _openMultiSelectDialogCategories,
                                //     controller: TextEditingController(
                                //       // نمایش نام‌های انتخاب‌شده در TextField
                                //       text: optionsCategories
                                //           .where((option) =>
                                //               _selectedOptionIdsCategories
                                //                   .contains(option.id))
                                //           .map((e) => e.title)
                                //           .join(','),
                                //     ),
                                //     enabled: true,
                                //     textAlignVertical: TextAlignVertical.center,
                                //     decoration: InputDecoration(
                                //       suffixIcon: Padding(
                                //         padding: const EdgeInsets.all(9),
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //               border: Border.all(
                                //                   color: Color.fromARGB(
                                //                       255, 0, 174, 212)),
                                //               borderRadius:
                                //                   BorderRadius.circular(8)),
                                //           child: InkWell(
                                //             onTap:
                                //                 _openMultiSelectDialogCategories,
                                //             child: Icon(Icons.add,
                                //                 size: 15,
                                //                 color: Color.fromARGB(
                                //                     255, 0, 174, 212)),
                                //           ),
                                //         ),
                                //       ),
                                //       label: Text(
                                //         'دسته مورد علاقه',
                                //         style: GoogleFonts.vazirmatn(
                                //             fontSize: 10,
                                //             fontWeight: FontWeight.w500,
                                //             color: Colors.grey),
                                //       ),
                                //       focusedBorder: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               width: 1, color: Colors.grey),
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //       enabledBorder: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               width: 1, color: Colors.grey),
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //       floatingLabelBehavior:
                                //           FloatingLabelBehavior.auto,
                                //       border: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               width: 1, color: Colors.grey),
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 15,
                                // ),
                                // Container(
                                //   height: 45,
                                //   child: TextField(
                                //     onTap: () async {
                                //       // نمایش دیالوگ و انتظار برای انتخاب
                                //       final selectedItem =
                                //           await _openSingleSelectDialog(
                                //               context, optionsExpertises);
                                //       if (selectedItem != null) {
                                //         // تنظیم آیتم انتخاب شده در تکست فیلد
                                //         expertiseController.text =
                                //             selectedItem.name.toString();
                                //         _selectedOptionIdsExpertises =
                                //             selectedItem.id;
                                //       }
                                //     },
                                //     controller: expertiseController,
                                //     enabled: true,
                                //     textAlignVertical: TextAlignVertical.center,
                                //     decoration: InputDecoration(
                                //       suffixIcon: Padding(
                                //         padding: const EdgeInsets.all(9),
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //               border: Border.all(
                                //                   color: Color.fromARGB(
                                //                       255, 0, 174, 212)),
                                //               borderRadius:
                                //                   BorderRadius.circular(8)),
                                //           child: InkWell(
                                //             onTap: () async {
                                //               // نمایش دیالوگ و انتظار برای انتخاب
                                //               final selectedItem =
                                //                   await _openSingleSelectDialog(
                                //                       context,
                                //                       optionsExpertises);
                                //               if (selectedItem != null) {
                                //                 // تنظیم آیتم انتخاب شده در تکست فیلد
                                //                 expertiseController.text =
                                //                     selectedItem.name
                                //                         .toString();
                                //                 _selectedOptionIdsExpertises =
                                //                     selectedItem.id;
                                //               }
                                //             },
                                //             child: Icon(Icons.add,
                                //                 size: 15,
                                //                 color: Color.fromARGB(
                                //                     255, 0, 174, 212)),
                                //           ),
                                //         ),
                                //       ),
                                //       label: Text(
                                //         'تخصص',
                                //         style: GoogleFonts.vazirmatn(
                                //             fontSize: 10,
                                //             fontWeight: FontWeight.w500,
                                //             color: Colors.grey),
                                //       ),
                                //       focusedBorder: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               width: 1, color: Colors.grey),
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //       enabledBorder: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               width: 1, color: Colors.grey),
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //       floatingLabelBehavior:
                                //           FloatingLabelBehavior.auto,
                                //       border: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               width: 1, color: Colors.grey),
                                //           borderRadius:
                                //               BorderRadius.circular(8)),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 55,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, right: 50, top: 8, bottom: 8),
                                    child: SizedBox(
                                      width: 100,
                                      height: 20,
                                      child: RawMaterialButton(
                                        fillColor:
                                            Color.fromARGB(255, 0, 174, 212),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 0),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              'ثبت',
                                              style: GoogleFonts.vazirmatn(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            Loader.showLoader(context);
                                            filesHTTP(
                                              phoneNumber: phonenumber.text,

                                              // sex: _selectedValue == 1
                                              //     ? Sex.male
                                              //     : Sex.female,
                                              // birthDay: finalDate.toString(),
                                              // expertiesId:
                                              //     _selectedOptionIdsExpertises !=
                                              //             null
                                              //         ? _selectedOptionIdsExpertises
                                              //         : "",
                                              // likedCategories:
                                              //     _selectedOptionIdsCategories !=
                                              //             null
                                              //         ? _selectedOptionIdsCategories
                                              //             .toString()
                                              //         : "",
                                              nationalCode: nationalCode.text,
                                              context: context,
                                              UserAvatarFile: _image,
                                              firstName: name.text,
                                              lastName: familyName.text,
                                            ).then(
                                              (value) {
                                                Loader.cloaseLoader(context);
                                                Navigator.pushNamed(context,
                                                    MyRoutes.profileScreen);
                                              },
                                            );
                                            // فرم معتبر است، پردازش انجام شود
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            // Container(
                            //   height: 40,
                            //   child: TextField(
                            //     enabled: true,
                            //     textAlignVertical: TextAlignVertical.center,
                            //     decoration: InputDecoration(
                            //       label: Text(
                            //         'تاریخ تولد',
                            //         style: GoogleFonts.vazirmatn(
                            //             fontSize: 10,
                            //             fontWeight: FontWeight.w500,
                            //             color: Colors.grey),
                            //       ),
                            //       prefixIcon: Padding(
                            //         padding: const EdgeInsets.only(
                            //             top: 10, bottom: 8, left: 8, right: 8),
                            //         child: Image(
                            //           image: AssetImage(
                            //               'lib/assets/images/birth.png'),
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               width: 1, color: Colors.grey),
                            //           borderRadius: BorderRadius.circular(8)),
                            //       enabledBorder: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               width: 1, color: Colors.grey),
                            //           borderRadius: BorderRadius.circular(8)),
                            //       floatingLabelBehavior:
                            //           FloatingLabelBehavior.auto,
                            //       border: OutlineInputBorder(
                            //           borderSide: BorderSide(
                            //               width: 1, color: Colors.grey),
                            //           borderRadius: BorderRadius.circular(8)),
                            //     ),
                            //   ),
                            // ),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MultiSelectDialogCategories extends StatefulWidget {
  final List<CategoryDto> options;
  final List<String> selectedOptionIds;

  MultiSelectDialogCategories({
    required this.options,
    required this.selectedOptionIds,
  });

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialogCategories> {
  List<String> _tempSelectedIds = [];

  @override
  void initState() {
    super.initState();
    _tempSelectedIds = List.from(widget.selectedOptionIds);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        actionsAlignment: MainAxisAlignment.start,
        title: Text(
          'انتخاب کنید',
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: widget.options.map((option) {
              return CheckboxListTile(
                activeColor: secondaryColor,
                value: _tempSelectedIds.contains(option.id),
                title:
                    Text(option.title.toString()), // نمایش فیلد `name` از DTO
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? selected) {
                  setState(() {
                    if (selected == true) {
                      _tempSelectedIds.add(option.id!);
                    } else {
                      _tempSelectedIds.remove(option.id);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'CANCEL',
              style: GoogleFonts.vazirmatn(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop(widget.selectedOptionIds);
            },
          ),
          TextButton(
            child: Text(
              'OK',
              style: GoogleFonts.vazirmatn(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop(_tempSelectedIds);
            },
          ),
        ],
      ),
    );
  }
}

// class MultiSelectDialogExpertises extends StatefulWidget {
//   final List<ExpertiseDto> options;
//   final List<String> selectedOptionIds;

//   MultiSelectDialogExpertises({
//     required this.options,
//     required this.selectedOptionIds,
//   });

//   @override
//   _MultiSelectDialogExpertisesState createState() =>
//       _MultiSelectDialogExpertisesState();
// }

// class _MultiSelectDialogExpertisesState
//     extends State<MultiSelectDialogExpertises> {
//   List<String> _tempSelectedIds = [];

//   @override
//   void initState() {
//     super.initState();
//     _tempSelectedIds = List.from(widget.selectedOptionIds);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: AlertDialog(
//         actionsAlignment: MainAxisAlignment.start,
//         title: Text(
//           'انتخاب کنید',
//         ),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: widget.options.map((option) {
//               return CheckboxListTile(
//                 activeColor: secondaryColor,
//                 value: _tempSelectedIds.contains(option.id),
//                 title: Text(option.name.toString()), // نمایش فیلد `name` از DTO
//                 controlAffinity: ListTileControlAffinity.leading,
//                 onChanged: (bool? selected) {
//                   setState(() {
//                     if (selected == true) {
//                       _tempSelectedIds.add(option.id!);
//                     } else {
//                       _tempSelectedIds.remove(option.id);
//                     }
//                   });
//                 },
//               );
//             }).toList(),
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text(
//               'CANCEL',
//               style: GoogleFonts.vazirmatn(color: Colors.black),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop(widget.selectedOptionIds);
//             },
//           ),
//           TextButton(
//             child: Text(
//               'OK',
//               style: GoogleFonts.vazirmatn(color: Colors.black),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop(_tempSelectedIds);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

Future<ExpertiseDto?> _openSingleSelectDialog(
    BuildContext context, List<ExpertiseDto> items) async {
  return await showDialog<ExpertiseDto>(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text('انتخاب کنید'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index].name.toString()),
                  onTap: () {
                    Navigator.of(context).pop(items[index]);
                  },
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
