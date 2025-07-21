import 'package:bookapp/controller/api/home_items/category_products.dart';
import 'package:bookapp/controller/api/saved/get_saved.dart';
import 'package:bookapp/controller/api/search_fillter/search_fillter.dart';
import 'package:bookapp/controller/provider/book_saved_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/provider/shop_card_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.enums.swagger.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSaved(context: context, st: SaveType.like);
  }

  TextEditingController searchNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  onPressed: () {
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
                          Padding(
                            padding: const EdgeInsets.only(top: 0, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                Row(
                                  children: [
                                    Text(
                                      'مورد علاقه ها',
                                      style: GoogleFonts.vazirmatn(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                            floatingLabelBehavior: FloatingLabelBehavior.never,
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
      body: Center(
        child: Column(
          children: [
            // SizedBox(
            //   height: 15,
            // ),
            // Container(
            //   width: MediaQuery.of(context).size.width - 35,
            //   height: 40,
            //   child: Directionality(
            //     textDirection: TextDirection.rtl,
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 15),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Image(
            //                 image: AssetImage('lib/assets/images/filter.png'),
            //                 fit: BoxFit.fill,
            //                 width: 20,
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 width: 5,
            //               ),
            //               Text(
            //                 'فیلتر محصولات ',
            //                 style: GoogleFonts.vazirmatn(fontSize: 10),
            //               )
            //             ],
            //           ),
            //           Row(
            //             children: [
            //               Image(
            //                 image: AssetImage('lib/assets/images/sort.png'),
            //                 fit: BoxFit.fill,
            //                 width: 20,
            //                 height: 15,
            //               ),
            //               SizedBox(
            //                 width: 5,
            //               ),
            //               Text(
            //                 'پر فروش ترین',
            //                 style: GoogleFonts.vazirmatn(fontSize: 10),
            //               )
            //             ],
            //           ),
            //           Row(
            //             children: [
            //               Image(
            //                 image: AssetImage('lib/assets/images/listt.png'),
            //                 fit: BoxFit.fill,
            //                 width: 18,
            //                 height: 20,
            //               ),
            //               SizedBox(
            //                 width: 8,
            //               ),
            //               Image(
            //                 image: AssetImage('lib/assets/images/grid.png'),
            //                 fit: BoxFit.fill,
            //                 width: 18,
            //                 height: 20,
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10), color: Colors.white),
            // ),

            Center(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 160,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Consumer<BookSavedState>(
                    builder: (context, value, child) => GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: BookSavedState.savedBooks.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.5, crossAxisCount: 2),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BookCardWidget(
                          discountCount:
                              "${((BookSavedState.savedBooks[index].price! - BookSavedState.savedBooks[index].totalPrice!) / BookSavedState.savedBooks[index].price! * 100).toStringAsFixed(0)}",
                          discountPrice: BookSavedState
                              .savedBooks[index].totalPrice
                              .toString(),
                          viewCont: BookSavedState.savedBooks[index].viewCount!,
                          bookId:
                              BookSavedState.savedBooks[index].id.toString(),
                          bookWriter: BookSavedState.savedBooks[index].nevisande
                              .toString(),
                          bookRate: BookSavedState.savedBooks[index].rating!
                              .toDouble(),
                          bookPrice:
                              BookSavedState.savedBooks[index].price.toString(),
                          bookName:
                              BookSavedState.savedBooks[index].title.toString(),
                          bookImage: BookSavedState.savedBooks[index].imageUrl
                              .toString(),
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
