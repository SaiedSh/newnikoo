import 'package:bookapp/controller/api/home_items/category_products.dart';
import 'package:bookapp/controller/api/saved/get_saved.dart';
import 'package:bookapp/controller/provider/book_saved_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.enums.swagger.dart';
import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShelfScreen extends StatefulWidget {
  const ShelfScreen({super.key});

  @override
  State<ShelfScreen> createState() => _ShelfScreenState();
}

class _ShelfScreenState extends State<ShelfScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSaved(context: context, st: SaveType.shelf);
    // getUserOrders(
    //   context: context,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
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
                              IconButton(
                                  onPressed: () {},
                                  icon: Image(
                                    image: AssetImage(
                                        'lib/assets/images/handbag.png'),
                                    width: 15,
                                  )),
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
                                      'کتابخانه من',
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
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 30,
                          child: TextField(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                            viewCont:
                                BookSavedState.savedBooks[index].viewCount!,
                            bookId:
                                BookSavedState.savedBooks[index].id.toString(),
                            bookWriter: BookSavedState
                                .savedBooks[index].nevisande
                                .toString(),
                            bookRate: BookSavedState.savedBooks[index].rating!
                                .toDouble(),
                            bookPrice: BookSavedState.savedBooks[index].price
                                .toString(),
                            bookName: BookSavedState.savedBooks[index].title
                                .toString(),
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
