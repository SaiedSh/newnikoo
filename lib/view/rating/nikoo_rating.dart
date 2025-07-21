import 'package:bookapp/controller/provider/shop_card_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RatingNikooScreen extends StatefulWidget {
  const RatingNikooScreen({
    super.key,
  });

  @override
  State<RatingNikooScreen> createState() => _RatingNikooScreenState();
}

class _RatingNikooScreenState extends State<RatingNikooScreen> {
  List<String> myList = ["بد", "متوسط", "خوب", "خیلی خوب", "عالی"];
  double _rating = 3.0;
  TextEditingController message = TextEditingController();
  double? rate;
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
                                          ShopCardState.shopCardList!
                                                  .shopCardItems !=
                                              null) {
                                        itemCount = ShopCardState.shopCardList!
                                            .shopCardItems!.length;
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
                              Row(
                                children: [
                                  Text(
                                    'امتیاز به نیکوبوک',
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
                      ],
                    ),
                  ),
                ),
              ),
            )),
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 15),
                child: Container(
                  height: 330,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        RatingBar(
                          wrapAlignment: WrapAlignment.center,
                          itemPadding: EdgeInsets.symmetric(horizontal: 12),
                          itemSize: 40,
                          itemCount: 5,
                          unratedColor: Colors.amber,
                          ratingWidget: RatingWidget(
                            full: Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.amber)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            half: Icon(Icons.star),
                            empty: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.grade_outlined,
                                  color: Colors.grey,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                          onRatingUpdate: (value) {
                            rate = value;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            thickness: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            controller: message,
                            decoration: InputDecoration(
                                hintStyle: GoogleFonts.vazirmatn(fontSize: 10),
                                hintText: 'به نظر من ...',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            maxLines: 5,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 285,
                          height: 30,
                          child: RawMaterialButton(
                            fillColor: Color.fromARGB(255, 0, 174, 212),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'ثبت نظر',
                                  style: GoogleFonts.vazirmatn(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
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
