import 'package:bookapp/controller/api/book/book_list.dart';
import 'package:bookapp/controller/api/home_items/category_products.dart';
import 'package:bookapp/controller/api/search_fillter/search_fillter.dart';
import 'package:bookapp/controller/provider/book_list_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/provider/shop_card_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String?
      currentMotherId; // نگهداری شناسه دسته‌بندی فعلی برای نمایش زیرمجموعه‌ها
  bool showingBooks = false;
  String? previousMotherId; // برای تشخیص نمایش لیست کتاب‌ها

  @override
  void initState() {
    super.initState();
    _loadMainCategories(); // بارگذاری دسته‌بندی‌های اصلی
  }

  // بارگذاری دسته‌بندی‌های اصلی
  Future<void> _loadMainCategories() async {
    await getCategories(context: context); // دریافت دسته‌بندی‌های اصلی
    setState(() {
      currentMotherId = null;
      previousMotherId = null;
      showingBooks = false;
    });
  }

  // بارگذاری دسته‌بندی‌ها یا کتاب‌ها
  Future<void> _loadSubcategoriesOrBooks(String categoryId) async {
    await getCategories(
        context: context, motherId: categoryId); // بارگذاری زیرمجموعه‌ها

    if (CategoryState.categories.isNotEmpty) {
      // اگر زیرمجموعه‌ها وجود داشتند
      setState(() {
        previousMotherId = currentMotherId; // ذخیره دسته‌بندی مادر قبلی
        currentMotherId = categoryId;
        showingBooks = false;
      });
    } else {
      // اگر زیرمجموعه‌ای وجود نداشت، کتاب‌ها را بارگذاری می‌کنیم
      await getProductsByCategory(context: context, categortyId: categoryId);
      setState(() {
        previousMotherId = currentMotherId; // ذخیره دسته‌بندی مادر قبلی
        currentMotherId = categoryId;
        showingBooks = true;
      });
    }
  }

  TextEditingController searchNumber = TextEditingController();
  TextEditingController nameFillter = TextEditingController();
  TextEditingController writerFillter = TextEditingController();
  TextEditingController entesharatFillter = TextEditingController();
  TextEditingController motarjemFillter = TextEditingController();
  TextEditingController moalefFillter = TextEditingController();
  TextEditingController minPriceFillter = TextEditingController();
  TextEditingController maxPriceFillter = TextEditingController();
  // بازگشت به دسته‌بندی‌های اصلی
  void _backToPrevious() async {
    if (showingBooks) {
      // اگر در حال مشاهده کتاب‌ها هستیم، به زیرمجموعه‌ها بازگردید
      setState(() {
        showingBooks = false;
        currentMotherId = previousMotherId; // بازگشت به دسته‌بندی قبلی
      });
      await getCategories(
          context: context, motherId: currentMotherId); // بارگذاری زیرمجموعه‌ها
    } else if (currentMotherId != null) {
      // اگر در زیرمجموعه‌ها هستیم، به دسته‌بندی‌های اصلی بازگردید
      await _loadMainCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (currentMotherId != null || showingBooks)
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _backToPrevious,
                ),
              Text(
                showingBooks ? 'کتاب‌ها' : 'دسته‌بندی‌ها',
                style: GoogleFonts.vazirmatn(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Image(
                  image: AssetImage('lib/assets/images/logo.png'),
                  width: 70,
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 35,
              height: 50,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 200,
                            child: TextField(
                              controller: searchNumber,
                              onSubmitted: (value) {
                                searchAndFillter(
                                  context: context,
                                  body: BookSearchDto(name: searchNumber.text),
                                ).then((value) {
                                  Navigator.pushNamed(
                                      context, MyRoutes.searchFillterScreen);
                                });
                              },
                              cursorHeight: 18, // با مقدار fontSize همسان کنید
                              style: GoogleFonts.vazirmatn(fontSize: 14),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, size: 18),
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
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10), // متن را وسط‌چین می‌کند
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          showAdaptiveDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        textDirection: TextDirection.rtl,
                                        'فیلتر بر اساس : ',
                                        style: GoogleFonts.vazirmatn(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SizedBox(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                200,
                                            child: TextField(
                                              controller: nameFillter,

                                              cursorHeight:
                                                  18, // با مقدار fontSize همسان کنید
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                floatingLabelAlignment:
                                                    FloatingLabelAlignment
                                                        .center,
                                                label: Center(
                                                  child: Text(
                                                    'نام کتاب',
                                                    style:
                                                        GoogleFonts.vazirmatn(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                filled: true,
                                                fillColor: backgroundColor,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical:
                                                            10), // متن را وسط‌چین می‌کند
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SizedBox(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                200,
                                            child: TextField(
                                              controller: writerFillter,

                                              cursorHeight:
                                                  18, // با مقدار fontSize همسان کنید
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                floatingLabelAlignment:
                                                    FloatingLabelAlignment
                                                        .center,
                                                label: Center(
                                                  child: Text(
                                                    'نام نویسنده',
                                                    style:
                                                        GoogleFonts.vazirmatn(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                filled: true,
                                                fillColor: backgroundColor,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical:
                                                            10), // متن را وسط‌چین می‌کند
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SizedBox(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                200,
                                            child: TextField(
                                              controller: entesharatFillter,

                                              cursorHeight:
                                                  18, // با مقدار fontSize همسان کنید
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                floatingLabelAlignment:
                                                    FloatingLabelAlignment
                                                        .center,
                                                label: Center(
                                                  child: Text(
                                                    'انتشارات',
                                                    style:
                                                        GoogleFonts.vazirmatn(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                filled: true,
                                                fillColor: backgroundColor,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical:
                                                            10), // متن را وسط‌چین می‌کند
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SizedBox(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                200,
                                            child: TextField(
                                              controller: motarjemFillter,

                                              cursorHeight:
                                                  18, // با مقدار fontSize همسان کنید
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                floatingLabelAlignment:
                                                    FloatingLabelAlignment
                                                        .center,
                                                label: Center(
                                                  child: Text(
                                                    'مترجم',
                                                    style:
                                                        GoogleFonts.vazirmatn(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                filled: true,
                                                fillColor: backgroundColor,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical:
                                                            10), // متن را وسط‌چین می‌کند
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: SizedBox(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                200,
                                            child: TextField(
                                              controller: moalefFillter,

                                              cursorHeight:
                                                  18, // با مقدار fontSize همسان کنید
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                floatingLabelAlignment:
                                                    FloatingLabelAlignment
                                                        .center,
                                                label: Center(
                                                  child: Text(
                                                    'مولف',
                                                    style:
                                                        GoogleFonts.vazirmatn(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                filled: true,
                                                fillColor: backgroundColor,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical:
                                                            10), // متن را وسط‌چین می‌کند
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: SizedBox(
                                                height: 40,
                                                width: 100,
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  controller: maxPriceFillter,

                                                  cursorHeight:
                                                      18, // با مقدار fontSize همسان کنید
                                                  style: GoogleFonts.vazirmatn(
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                    floatingLabelAlignment:
                                                        FloatingLabelAlignment
                                                            .center,
                                                    label: Center(
                                                      child: Text(
                                                        'حداکثر قیمت',
                                                        style: GoogleFonts
                                                            .vazirmatn(
                                                          color: Colors.grey,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor: backgroundColor,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                10), // متن را وسط‌چین می‌کند
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: SizedBox(
                                                height: 40,
                                                width: 100,
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  controller: minPriceFillter,

                                                  cursorHeight:
                                                      18, // با مقدار fontSize همسان کنید
                                                  style: GoogleFonts.vazirmatn(
                                                      fontSize: 14),
                                                  decoration: InputDecoration(
                                                    floatingLabelAlignment:
                                                        FloatingLabelAlignment
                                                            .center,
                                                    label: Center(
                                                      child: Text(
                                                        'حداقل قیمت',
                                                        style: GoogleFonts
                                                            .vazirmatn(
                                                          color: Colors.grey,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor: backgroundColor,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                10), // متن را وسط‌چین می‌کند
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      MaterialButton(
                                        minWidth: 150,
                                        child: Text(
                                          'اعمال',
                                          style: GoogleFonts.vazirmatn(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        color: secondaryColor,
                                        onPressed: () {
                                          searchAndFillter(
                                            context: context,
                                            body: BookSearchDto(
                                                minPrice: minPriceFillter
                                                            .text !=
                                                        ''
                                                    ? int.parse(
                                                        minPriceFillter.text)
                                                    : 0,
                                                maxPrice: maxPriceFillter
                                                            .text !=
                                                        ""
                                                    ? int.parse(
                                                        maxPriceFillter.text)
                                                    : 0,
                                                moalef: moalefFillter.text,
                                                motarjem: motarjemFillter.text,
                                                nevisande: writerFillter.text,
                                                entesharat:
                                                    entesharatFillter.text,
                                                name: nameFillter.text),
                                          ).then((value) {
                                            Navigator.pushNamed(context,
                                                MyRoutes.searchFillterScreen);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                height:
                                    MediaQuery.of(context).size.height - 350,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('lib/assets/images/filter.png'),
                              fit: BoxFit.fill,
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'فیلتر محصولات ',
                              style: GoogleFonts.vazirmatn(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
            Expanded(
              child: Consumer<CategoryState>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: showingBooks
                        ? ProductsState.books.length
                        : CategoryState.categories.length,
                    itemBuilder: (context, index) {
                      if (showingBooks) {
                        // نمایش کتاب‌ها
                        var book = ProductsState.books[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 220,
                            width: MediaQuery.of(context).size.width,
                            child: Consumer<ProductsState>(
                              builder: (context, value, child) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: ProductsState.books.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.5,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BookCardWidget(
                                      discountCount:
                                          "${((ProductsState.books[index].price! - ProductsState.books[index].totalPrice!) / ProductsState.books[index].price! * 100).toStringAsFixed(0)}",
                                      discountPrice: ProductsState
                                          .books[index].totalPrice
                                          .toString(),
                                      viewCont:
                                          ProductsState.books[index].viewCount!,
                                      bookId: ProductsState.books[index].id
                                          .toString(),
                                      bookWriter: ProductsState
                                          .books[index].nevisande
                                          .toString(),
                                      bookRate: ProductsState
                                          .books[index].rating!
                                          .toDouble(),
                                      bookPrice: ProductsState
                                          .books[index].price
                                          .toString(),
                                      bookName: ProductsState.books[index].title
                                          .toString(),
                                      bookImage: ProductsState
                                          .books[index].imageUrl
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        // نمایش دسته‌بندی‌ها
                        var category = CategoryState.categories[index];
                        return ListTile(
                          title: Text(category.title.toString(),
                              style: GoogleFonts.vazirmatn(fontSize: 14)),
                          trailing: Icon(
                            Icons.arrow_forward,
                            size: 18,
                          ),
                          onTap: () => _loadSubcategoriesOrBooks(category.id
                              .toString()), // بارگذاری زیرمجموعه‌ها یا کتاب‌ها
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class CategoryScreen extends StatefulWidget {
//   const CategoryScreen({super.key});

//   @override
//   State<CategoryScreen> createState() => _CategoryScreenState();
// }

// class _CategoryScreenState extends State<CategoryScreen> {
//   String?
//       currentMotherId; // نگهداری شناسه دسته‌بندی فعلی برای نمایش زیرمجموعه‌ها
//   bool showingBooks = false; // برای تشخیص نمایش لیست کتاب‌ها

//   @override
//   void initState() {
//     super.initState();
//     _loadMainCategories(); // بارگذاری دسته‌بندی‌های اصلی
//   }

//   Future<void> _loadMainCategories() async {
//     await getCategories(context: context); // دریافت دسته‌بندی‌های اصلی
//     setState(() {
//       currentMotherId = null;
//       showingBooks = false;
//     });
//   }

//   Future<void> _loadSubcategoriesOrBooks(String categoryId) async {
//     await getCategories(
//         context: context, motherId: categoryId); // دریافت داده‌ها

//     if (CategoryState.categories.isNotEmpty) {
//       // اگر زیرمجموعه وجود داشت
//       setState(() {
//         currentMotherId = categoryId;
//         showingBooks = false;
//       });
//     } else {
//       // اگر زیرمجموعه‌ای وجود نداشت، کتاب‌ها را بارگذاری می‌کنیم
//       await getProductsByCategory(context: context, categortyId: categoryId);
//       setState(() {
//         currentMotherId = categoryId;
//         showingBooks = true;
//       });
//     }
//   }

//   void _backToPrevious() async {
//     if (showingBooks) {
//       // اگر کتاب‌ها نمایش داده می‌شوند، به زیرمجموعه‌ها برمی‌گردیم
//       setState(() {
//         showingBooks = false;
//       });
//       await getCategories(
//           context: context,
//           motherId: currentMotherId); // زیرمجموعه‌ها را دوباره بارگذاری کن
//     } else {
//       // اگر زیرمجموعه‌ها نمایش داده می‌شوند، به دسته‌بندی‌های اصلی برمی‌گردیم
//       await _loadMainCategories();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             if (currentMotherId != null)
//               IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: _backToPrevious,
//               ),
//             Text(
//               showingBooks ? 'کتاب‌ها' : 'دسته‌بندی‌ها',
//               style: GoogleFonts.vazirmatn(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//       body: Consumer<CategoryState>(
//         builder: (context, value, child) => ListView.builder(
//           itemCount: showingBooks
//               ? ProductsState.books.length
//               : CategoryState.categories.length,
//           itemBuilder: (context, index) {
//             if (showingBooks) {
//               // نمایش کتاب‌ها
//               var book = ProductsState.books[index];
//               return ListTile(
//                 title:
//                     Text(book.title.toString(), style: GoogleFonts.vazirmatn(fontSize: 14)),
//                 subtitle: Text(book.nevisande.toString(),
//                     style: GoogleFonts.vazirmatn(fontSize: 12)),
//               );
//             } else {
//               // نمایش دسته‌بندی‌ها
//               var category = CategoryState.categories[index];
//               return ListTile(
//                 title: Text(category.title.toString(),
//                     style: GoogleFonts.vazirmatn(fontSize: 14)),
//                 trailing: Icon(Icons.arrow_forward),
//                 onTap: () => _loadSubcategoriesOrBooks(category.id.toString()),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// فرض کنید این تابع برای بارگذاری دسته‌بندی‌ها و زیرمجموعه‌ها استفاده می‌شود
// void getCategories({required BuildContext context, String? motherId}) {
//   // Logic to fetch categories based on motherId
//   getCategories(context: context, motherId: motherId);
// }

// بارگذاری کتاب‌ها با استفاده از getBookList و categoryId
// void getBookList({required BuildContext context, required String categoryId}) {
//   getBooksList(context: context, categortyId: categoryId);
//   // Logic to fetch books for a specific subcategory
// }
// class CategoryScreen extends StatefulWidget {
//   const CategoryScreen({super.key});

//   @override
//   State<CategoryScreen> createState() => _CategoryScreenState();
// }

// class _CategoryScreenState extends State<CategoryScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCategories(
//       context: context,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(50),
//           child: AppBar(
//             automaticallyImplyLeading: false,
//             backgroundColor: backgroundColor,
//             flexibleSpace: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           // Row(
//                           //   children: [
//                           //     IconButton(
//                           //         onPressed: () {
//                           //           Navigator.pushNamed(
//                           //               context, MyRoutes.profileScreen);
//                           //         },
//                           //         icon: Image(
//                           //           image: AssetImage(
//                           //               'lib/assets/images/miniicon.png'),
//                           //           width: 15,
//                           //         )),
//                           //     SizedBox(
//                           //       height: 20,
//                           //       width: 1,
//                           //       child: VerticalDivider(),
//                           //     ),
//                           //     IconButton(
//                           //         onPressed: () {},
//                           //         icon: Image(
//                           //           image: AssetImage(
//                           //               'lib/assets/images/handbag.png'),
//                           //           width: 15,
//                           //         )),
//                           //   ],
//                           // ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SizedBox(),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'مطالعه شده ها',
//                                       style: GoogleFonts.vazirmatn(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14),
//                                     ),
//                                     IconButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       icon: Icon(
//                                         Icons.close,
//                                         size: 20,
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Directionality(
//                     //   textDirection: TextDirection.rtl,
//                     //   child: SizedBox(
//                     //       height: 35,
//                     //       width: MediaQuery.of(context).size.width - 10,
//                     //       child: TextField(
//                     //         cursorHeight: 20,
//                     //         decoration: InputDecoration(
//                     //             prefixIcon: Icon(
//                     //               Icons.search,
//                     //               size: 18,
//                     //             ),
//                     //             floatingLabelAlignment:
//                     //                 FloatingLabelAlignment.center,
//                     //             label: Text(
//                     //               'جستجو در نیکو بوک',
//                     //               style: GoogleFonts.vazirmatn(
//                     //                   color: Colors.grey,
//                     //                   fontSize: 10,
//                     //                   fontWeight: FontWeight.w500),
//                     //             ),
//                     //             filled: true,
//                     //             fillColor: backgroundColor,
//                     //             border: OutlineInputBorder(
//                     //                 borderSide: BorderSide.none,
//                     //                 borderRadius: BorderRadius.circular(5))),
//                     //       )),
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//           )),
//       body: Expanded(
//         child: Consumer<CategoryState>(
//           builder: (context, value, child) => ListView(children: [
//             for (var element in CategoryState.categories)
//               Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: ListTile(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AnotherScreen(
//                             motherId: element.id.toString(),
//                           ),
//                         ));
//                   },
//                   title: Text(element.title.toString()),
//                   trailing: Icon(Icons.arrow_forward),
//                 ),
//               ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({super.key});

  @override
  State<AllBooksScreen> createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooksList(context: context);
  }

  bool gridVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: backgroundColor,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
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
                              Consumer<ShopCardState>(
                                builder: (context, cartProvider, child) {
                                  int itemCount = 0;

                                  if (ShopCardState.shopCardList != null &&
                                      ShopCardState
                                              .shopCardList!.shopCardItems !=
                                          null) {
                                    itemCount = ShopCardState
                                        .shopCardList!.shopCardItems!.length;
                                  }

                                  return Stack(
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          Navigator.pushNamed(
                                              context, MyRoutes.shopCardScreen);
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
                                                  BorderRadius.circular(10),
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
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image(
                              image: AssetImage('lib/assets/images/logo.png'),
                              width: 70,
                            ),
                          )
                        ],
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                          height: 35,
                          width: MediaQuery.of(context).size.width - 10,
                          child: TextField(
                            cursorHeight: 20,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 18,
                                ),
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                label: Text(
                                  'جستجو در نیکو بوک',
                                  style: GoogleFonts.vazirmatn(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                                filled: true,
                                fillColor: backgroundColor,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5))),
                          )),
                    )
                  ],
                ),
              ),
            ),
          )),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 35,
              height: 40,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('lib/assets/images/filter.png'),
                            fit: BoxFit.fill,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'فیلتر محصولات ',
                            style: GoogleFonts.vazirmatn(fontSize: 10),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image(
                            image: AssetImage('lib/assets/images/sort.png'),
                            fit: BoxFit.fill,
                            width: 20,
                            height: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'پر فروش ترین',
                            style: GoogleFonts.vazirmatn(fontSize: 10),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                gridVisible = false;
                              });
                            },
                            child: Image(
                              image: AssetImage('lib/assets/images/listt.png'),
                              fit: BoxFit.fill,
                              width: 18,
                              height: 20,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                gridVisible = true;
                              });
                            },
                            child: Image(
                              image: AssetImage('lib/assets/images/grid.png'),
                              fit: BoxFit.fill,
                              width: 18,
                              height: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: gridVisible,
              replacement: Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: BookListState.books.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => BookCardListWidget(
                    bookId: BookListState.books[index].id.toString(),
                    bookWriter: BookListState.books[index].nevisande.toString(),
                    bookRate: BookListState.books[index].rating!.toDouble(),
                    bookPrice: BookListState.books[index].price.toString(),
                    bookName: BookListState.books[index].title.toString(),
                    bookImage: BookListState.books[index].imageUrl.toString(),
                  ),
                ),
              )),
              child: Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 270,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Consumer<BookListState>(
                      builder: (context, value, child) => GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: BookListState.books.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.6, crossAxisCount: 2),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BookCardWidget(
                            discountCount:
                                "${((BookListState.books[index].price! - BookListState.books[index].totalPrice!) / BookListState.books[index].price! * 100).toStringAsFixed(0)}",
                            discountPrice: BookListState.books[index].totalPrice
                                .toString(),
                            viewCont: BookListState.books[index].viewCount!,
                            bookId: BookListState.books[index].id.toString(),
                            bookWriter:
                                BookListState.books[index].nevisande.toString(),
                            bookRate:
                                BookListState.books[index].rating!.toDouble(),
                            bookPrice:
                                BookListState.books[index].price.toString(),
                            bookName:
                                BookListState.books[index].title.toString(),
                            bookImage:
                                BookListState.books[index].imageUrl.toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherScreen extends StatefulWidget {
  final String motherId;
  const AnotherScreen({
    super.key,
    required this.motherId,
  });

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories(context: context, motherId: widget.motherId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CategoryState>(
        builder: (context, value, child) => Column(
          children: [
            for (var element in CategoryState.categoriesChild)
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BooksScreen(categoryId: element.id.toString()),
                      ));
                },
                title: Text(element.title.toString()),
              )
          ],
        ),
      ),
    );
  }
}
