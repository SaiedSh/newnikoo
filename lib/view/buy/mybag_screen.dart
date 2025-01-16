import 'package:bookapp/controller/api/profile/user_orders/get_user_orders.dart';
import 'package:bookapp/controller/provider/user_orders_state.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyBagScreen extends StatefulWidget {
  const MyBagScreen({
    super.key,
  });

  @override
  State<MyBagScreen> createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserOrders(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Row(
                                children: [
                                  Text(
                                    'خرید های من',
                                    style: GoogleFonts.vazirmatn(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
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
          child: Visibility(
            visible: UserOrdersState.orders != null ? false : true,
            replacement: Consumer<UserOrdersState>(
              builder: (context, value, child) => ListView.builder(
                  itemCount: UserOrdersState.orders.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10, top: 10),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            errorBuilder: (BuildContext context,
                                                Object error,
                                                StackTrace? stackTrace) {
                                              return Center(
                                                child: Text(
                                                  'تصویر بارگذاری نشد',
                                                  style: GoogleFonts.vazirmatn(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                ),
                                              );
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                // تصویر لود شده است
                                                return child;
                                              }
                                              // تصویر هنوز در حال لود است
                                              return CircularProgressIndicator(
                                                strokeWidth: 1,
                                              );
                                            },
                                            fit: BoxFit.fill,
                                            UserOrdersState
                                                .orders[index]
                                                .bookOrderItems!
                                                .first
                                                .bookImageUrl
                                                .toString(),
                                            width: 110,
                                            height: 80,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              UserOrdersState
                                                  .orders[index]
                                                  .bookOrderItems!
                                                  .first
                                                  .bookTitle
                                                  .toString(),
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              UserOrdersState
                                                  .orders[index]
                                                  .bookOrderItems!
                                                  .first
                                                  .bookNevisande
                                                  .toString(),
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'ناشر : ',
                                              style: GoogleFonts.vazirmatn(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 0),
                                              child: Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Colors.amber,
                                              ),
                                            ),
                                            Text(
                                              "4.8 ( 585 )",
                                              style: GoogleFonts.vazirmatn(
                                                fontSize: 12,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'در اینجا میتوانی سابقه خرید ها‌ای که انجام دادی رو چک کنی.',
                  style: GoogleFonts.vazirmatn(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 55,
                ),
                Image(
                  image: AssetImage('lib/assets/images/mybag.png'),
                  fit: BoxFit.fill,
                  width: 170,
                  height: 200,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'اولین کتابت را بخر و مطالعه را شروع کن!',
                  style: GoogleFonts.vazirmatn(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
