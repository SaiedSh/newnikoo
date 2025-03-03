import 'dart:async';

import 'package:bookapp/controller/api/book/book_list.dart';
import 'package:bookapp/controller/api/home_items/category_products.dart';
import 'package:bookapp/controller/api/home_items/items.dart';
import 'package:bookapp/controller/api/search_fillter/search_fillter.dart';
import 'package:bookapp/controller/provider/book_list_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/provider/index_items_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  TextEditingController searchNumber = TextEditingController();
  int _currentPage = 0;
  Timer? _timer;
  List categoryList = ['ادبیات', 'تاریخ', 'رمان', 'کودکان'];
  List sliderImageList = [
    'lib/assets/images/banner2.jpg',
    'lib/assets/images/banner3.jpg',
    'lib/assets/images/banner.jpg'
  ];
  // List bookImageList = [
  //   'lib/assets/images/book.jpg',
  //   'lib/assets/images/book2.jpg',
  //   'lib/assets/images/book3.jpg'
  // ];
  String searchText = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    // getCategories(
    //   context: context,
    // );
    getIndexItems(context: context);
    getProductsByCategory(context: context);
    getBooksList(context: context);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // بازگشت غیرفعال می‌شود
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(110),
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
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      Navigator.pushNamed(
                                          context, MyRoutes.profileScreen);
                                    },
                                    icon: Image(
                                      image: AssetImage(
                                          'lib/assets/images/miniicon.png'),
                                      width: 17,
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
                                      width: 17,
                                    )),
                              ],
                            ),
                            Image(
                              image: AssetImage('lib/assets/images/logo.png'),
                              width: 70,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Center(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         border: Border.all(color: primaryColor),
                      //         borderRadius: BorderRadius.circular(5)),
                      //     width: 250,
                      //     child: Column(
                      //       children: [
                      //         Autocomplete<String>(
                      //           optionsViewBuilder:
                      //               (context, onSelected, options) => Padding(
                      //             padding: const EdgeInsets.only(right: 160),
                      //             child: Align(
                      //               alignment: Alignment.topRight,
                      //               child: Material(
                      //                 shape: const RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.vertical(
                      //                       bottom: Radius.circular(4.0)),
                      //                 ),
                      //                 child: Center(
                      //                   child: Container(
                      //                     child: ListView.builder(
                      //                       padding: EdgeInsets.zero,
                      //                       itemCount: options.length,
                      //                       shrinkWrap: false,
                      //                       itemBuilder: (BuildContext context,
                      //                           int index) {
                      //                         final String option =
                      //                             options.elementAt(index);
                      //                         return InkWell(
                      //                           onTap: () => onSelected(option),
                      //                           child: Padding(
                      //                             padding:
                      //                                 const EdgeInsets.all(16.0),
                      //                             child: Text(option),
                      //                           ),
                      //                         );
                      //                       },
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           optionsBuilder:
                      //               (TextEditingValue textEditingValue) {
                      //             searchNumber.text = textEditingValue.text;

                      //             if (textEditingValue.text == '') {
                      //               return const Iterable<String>.empty();
                      //             }
                      //             return List.generate(
                      //               BookListState.books.length,
                      //               (index) {
                      //                 return BookListState.books[index].title!;
                      //               },
                      //             ).where((String option) {
                      //               return option.contains(
                      //                   textEditingValue.text.toLowerCase());
                      //             });
                      //           },
                      //           onSelected: (String selection) {
                      //             searchAndFillter(
                      //                 context: context,
                      //                 body:
                      //                     BookSearchDto(name: searchNumber.text));

                      //             // searchNumber.text = selection;
                      //             // getUserByPhonenumber(
                      //             //         context: context,
                      //             //         phoneNumber:
                      //             //             searchNumber.text.persianToEN())
                      //             //     .then(
                      //             //   (value) {
                      //             //     name.text = UserByNumberState
                      //             //         .userGetNumber!.fname
                      //             //         .toString();
                      //             //     familyName.text = UserByNumberState
                      //             //         .userGetNumber!.lname
                      //             //         .toString();
                      //             //     selectedDate = UserByNumberState
                      //             //         .userGetNumber!.birthDay!
                      //             //         .toJalali()
                      //             //         .formatCompactDate();

                      //             //     refferalCode.text = UserByNumberState
                      //             //         .userGetNumber!.refferalCode
                      //             //         .toString()
                      //             //         .persianToEN();
                      //             //   },
                      //             // );
                      //             // debugPrint('You just selected $selection');
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
            )),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Consumer<IndexItemsState>(builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(0),
                  child: IndexItemsState.IndexLists != null
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          child: PageView(
                            controller: _pageController,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'lib/assets/images/banner.jpg'),
                                )),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    // Text(
                                    //   IndexItemsState
                                    //       .IndexLists!.indexInfo!.banner1Title
                                    //       .toString(),
                                    //   style: GoogleFonts.vazirmatn(
                                    //       fontWeight: FontWeight.w500,
                                    //       fontSize: 20,
                                    //       color: Colors.white),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 100),
                                    //   child: Divider(),
                                    // ),
                                    // Text(
                                    //   IndexItemsState.IndexLists!.indexInfo!
                                    //       .banner1Description
                                    //       .toString(),
                                    //   style: GoogleFonts.vazirmatn(
                                    //       fontSize: 14,
                                    //       color: Colors.grey.shade300),
                                    // ),
                                    SizedBox(
                                      height: 160,
                                    ),
                                    AnimatedSmoothIndicator(
                                      activeIndex: 0,
                                      count: 3,
                                      effect: ExpandingDotsEffect(
                                          activeDotColor: secondaryColor,
                                          dotHeight: 10,
                                          dotWidth: 10,
                                          dotColor: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'lib/assets/images/banner2.jpg'))),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    // Text(
                                    //   IndexItemsState
                                    //       .IndexLists!.indexInfo!.banner2Title
                                    //       .toString(),
                                    //   style: GoogleFonts.vazirmatn(
                                    //       fontWeight: FontWeight.w500,
                                    //       fontSize: 20,
                                    //       color: Colors.black),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 100),
                                    //   child: Divider(),
                                    // ),
                                    // Text(
                                    //   IndexItemsState.IndexLists!.indexInfo!
                                    //       .banner2Description
                                    //       .toString(),
                                    //   style: GoogleFonts.vazirmatn(
                                    //       fontSize: 14, color: Colors.grey),
                                    // ),
                                    SizedBox(
                                      height: 160,
                                    ),
                                    AnimatedSmoothIndicator(
                                      activeIndex: 1,
                                      count: 3,
                                      effect: ExpandingDotsEffect(
                                          activeDotColor: secondaryColor,
                                          dotHeight: 10,
                                          dotWidth: 10,
                                          dotColor: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'lib/assets/images/banner3.jpg'))),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    // Text(
                                    //   IndexItemsState
                                    //       .IndexLists!.indexInfo!.banner3Title
                                    //       .toString(),
                                    //   style: GoogleFonts.vazirmatn(
                                    //       fontWeight: FontWeight.w500,
                                    //       fontSize: 20,
                                    //       color: Colors.white),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 100),
                                    //   child: Divider(),
                                    // ),
                                    // Text(
                                    //   IndexItemsState.IndexLists!.indexInfo!
                                    //       .banner3Description
                                    //       .toString(),
                                    //   style: GoogleFonts.vazirmatn(
                                    //       fontSize: 14,
                                    //       color: Colors.grey.shade300),
                                    // ),
                                    SizedBox(
                                      height: 160,
                                    ),
                                    AnimatedSmoothIndicator(
                                      activeIndex: 2,
                                      count: 3,
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
                        )
                      : SizedBox(
                          height: 220,
                        ),
                );
              }),

              // SizedBox(
              //   height: 20,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width - 20,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 5),
              //         child: Container(
              //           width: 80,
              //           height: 80,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(
              //                 Icons.volume_up_outlined,
              //                 size: 25,
              //               ),
              //               Text('کتاب صوتی')
              //             ],
              //           ),
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(10)),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 5),
              //         child: Container(
              //           width: 80,
              //           height: 80,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(
              //                 Icons.menu_book_outlined,
              //                 size: 25,
              //               ),
              //               Text('کتاب متنی')
              //             ],
              //           ),
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(10)),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 5),
              //         child: Container(
              //           width: 80,
              //           height: 80,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(
              //                 Icons.mic,
              //                 size: 25,
              //               ),
              //               Text('پادکست')
              //             ],
              //           ),
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(10)),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 5),
              //         child: Container(
              //           width: 80,
              //           height: 80,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(
              //                 Icons.star_border_purple500_sharp,
              //                 size: 25,
              //               ),
              //               Text('کتاب رایگان')
              //             ],
              //           ),
              //           decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(10)),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   height: 90,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 10,
              //     itemBuilder: (context, index) => Padding(
              //       padding: const EdgeInsets.all(5),
              //       child: Container(
              //         width: 80,
              //         height: 80,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(10)),
              //       ),
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'کتاب های تخصصی دندانپزشکی',
                      style: GoogleFonts.vazirmatn(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 342,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Consumer<BookListState>(
                    builder: (context, value, child) => ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: BookCardWidget(
                          discountCount:
                              "${((BookListState.books[index].price! - BookListState.books[index].totalPrice!) / BookListState.books[index].price! * 100).toStringAsFixed(0)}",
                          discountPrice:
                              BookListState.books[index].totalPrice.toString(),
                          bookId: BookListState.books[index].id.toString(),
                          bookWriter:
                              BookListState.books[index].nevisande.toString(),
                          bookRate:
                              BookListState.books[index].rating!.toDouble(),
                          bookPrice:
                              BookListState.books[index].price.toString(),
                          bookName: BookListState.books[index].title.toString(),
                          bookImage:
                              BookListState.books[index].imageUrl.toString(),
                          viewCont: BookListState.books[index].viewCount!,
                        ),
                      ),
                      itemCount: BookListState.books.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.tazeHa,
                          arguments: IndexItemsState.IndexLists!.freeBooks);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'تازه ها',
                        style: GoogleFonts.vazirmatn(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 342,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Consumer<IndexItemsState>(
                    builder: (context, value, child) => ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: BookCardWidget(
                          discountCount:
                              "${((IndexItemsState.IndexLists!.freeBooks![index].price! - IndexItemsState.IndexLists!.freeBooks![index].totalPrice!) / IndexItemsState.IndexLists!.freeBooks![index].price! * 100).toStringAsFixed(0)}",
                          discountPrice: IndexItemsState
                              .IndexLists!.freeBooks![index].totalPrice
                              .toString(),
                          bookId: IndexItemsState
                              .IndexLists!.freeBooks![index].id
                              .toString(),
                          bookWriter: IndexItemsState
                              .IndexLists!.freeBooks![index].nevisande
                              .toString(),
                          bookRate: IndexItemsState
                              .IndexLists!.freeBooks![index].rating!
                              .toDouble(),
                          bookPrice: IndexItemsState
                              .IndexLists!.freeBooks![index].price
                              .toString(),
                          bookName: IndexItemsState
                              .IndexLists!.freeBooks![index].title
                              .toString(),
                          bookImage: IndexItemsState
                              .IndexLists!.freeBooks![index].imageUrl
                              .toString(),
                          viewCont: IndexItemsState
                              .IndexLists!.freeBooks![index].viewCount!,
                        ),
                      ),
                      itemCount: IndexItemsState.IndexLists!.freeBooks!.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.porForoshHa,
                          arguments:
                              IndexItemsState.IndexLists!.mostViewedBooks);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        'پرفروش ها',
                        style: GoogleFonts.vazirmatn(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 370,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Consumer<IndexItemsState>(
                    builder: (context, value, child) => ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: BookCardWidget(
                          discountCount:
                              "${((IndexItemsState.IndexLists!.mostViewedBooks![index].price! - IndexItemsState.IndexLists!.mostViewedBooks![index].totalPrice!) / IndexItemsState.IndexLists!.mostViewedBooks![index].price! * 100).toStringAsFixed(0)}",
                          discountPrice: IndexItemsState
                              .IndexLists!.mostViewedBooks![index].totalPrice
                              .toString(),
                          bookId: IndexItemsState
                              .IndexLists!.mostViewedBooks![index].id
                              .toString(),
                          bookWriter: IndexItemsState
                              .IndexLists!.mostViewedBooks![index].nevisande
                              .toString(),
                          bookRate: IndexItemsState
                              .IndexLists!.mostViewedBooks![index].rating!
                              .toDouble(),
                          bookPrice: IndexItemsState
                              .IndexLists!.mostViewedBooks![index].price
                              .toString(),
                          bookName: IndexItemsState
                              .IndexLists!.mostViewedBooks![index].title
                              .toString(),
                          bookImage: IndexItemsState
                              .IndexLists!.mostViewedBooks![index].imageUrl
                              .toString(),
                          viewCont: IndexItemsState
                              .IndexLists!.mostViewedBooks![index].viewCount!,
                        ),
                      ),
                      itemCount:
                          IndexItemsState.IndexLists!.mostViewedBooks!.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height - 100,
              //   width: MediaQuery.of(context).size.width - 10,
              //   child: AnimationLimiter(
              //     child: GridView.count(
              //       shrinkWrap: true,
              //       childAspectRatio: 0.6,
              //       crossAxisCount: 2,
              //       children: List.generate(
              //         8,
              //         (int index) {
              //           return AnimationConfiguration.staggeredGrid(
              //             position: index,
              //             duration: const Duration(milliseconds: 375),
              //             columnCount: 2,
              //             child: ScaleAnimation(
              //               child: FadeInAnimation(
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: BookCardWidget(),
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //   ),
              // ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DropdownButton<String>(
              //     value: selectedCategory,
              //     onChanged: (String? newValue) {
              //       setState(() {
              //         selectedCategory = newValue!;
              //       });
              //       _filterItems(selectedCategory);
              //     },
              //     items:
              //         categories.map<DropdownMenuItem<String>>((String category) {
              //       return DropdownMenuItem<String>(
              //         value: category,
              //         child: Text(category),
              //       );
              //     }).toList(),
              //   ),
              // ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: filteredItems.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text(filteredItems[index]['name']!),
              //         subtitle: Text(filteredItems[index]['category']!),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
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
