import 'package:bookapp/controller/api/home_items/category_products.dart';
import 'package:bookapp/controller/api/search_fillter/search_fillter.dart';
import 'package:bookapp/controller/provider/book_list_state.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/provider/search_fillter_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchFillterScreen extends StatefulWidget {
  const SearchFillterScreen({super.key});

  @override
  State<SearchFillterScreen> createState() => _SearchFillterScreenState();
}

TextEditingController searchNumber = TextEditingController();

class _SearchFillterScreenState extends State<SearchFillterScreen> {
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
                                      'لیست جست و جو',
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
                            controller: searchNumber,
                            onSubmitted: (value) {
                              context.read<SearchFillterState>().reset();
                              searchAndFillter(
                                      context: context,
                                      body: BookSearchDto(
                                          name: searchNumber.text))
                                  .then(
                                (value) {
                                  Navigator.pushNamed(
                                      context, MyRoutes.searchFillterScreen);
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
                    child: Consumer<SearchFillterState>(
                      builder: (context, value, child) => GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: SearchFillterState.subscriptions.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.5, crossAxisCount: 2),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BookCardWidget(
                            discountCount: BookListState
                                .books[index].discountPercentage
                                .toString(),
                            discountPrice: BookListState
                                .books[index].discountPrice
                                .toString(),
                            viewCont: 0,
                            bookId: SearchFillterState.subscriptions[index].id
                                .toString(),
                            bookWriter: SearchFillterState
                                        .subscriptions[index].nevisande !=
                                    null
                                ? SearchFillterState
                                    .subscriptions[index].nevisande
                                    .toString()
                                : "",
                            bookRate: SearchFillterState
                                        .subscriptions[index].rating !=
                                    null
                                ? SearchFillterState
                                    .subscriptions[index].rating!
                                    .toDouble()
                                : 0,
                            bookPrice: SearchFillterState
                                        .subscriptions[index].price !=
                                    null
                                ? SearchFillterState.subscriptions[index].price
                                    .toString()
                                : "",
                            bookName: SearchFillterState
                                        .subscriptions[index].title !=
                                    null
                                ? SearchFillterState.subscriptions[index].title
                                    .toString()
                                : "",
                            bookImage: SearchFillterState
                                        .subscriptions[index].imageUrl !=
                                    null
                                ? SearchFillterState
                                    .subscriptions[index].imageUrl
                                    .toString()
                                : "",
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
