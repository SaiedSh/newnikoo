import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:bookapp/model/services/token.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<ApiResult> payment(
    {required BuildContext context, bool? wallet, String? discountCode}) async {
  final api = Tikonline.create(interceptors: [TokenInterceptor('accessToken')]);

  final postResult = await api.apiV1ShopCardPayShopCardPost(
      discountCode: discountCode, wallet: wallet);
  print(postResult);
  if (postResult.body!.isSuccess == true) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: 250,
          height: 50,
          child: Center(
            child: Text(
              "پرداخت با موفقیت انجام شد",
              style: GoogleFonts.vazirmatn(color: Colors.green),
            ),
          ),
        ),
      ),
    ).then(
      (value) {
        Navigator.pushNamed(context, MyRoutes.navigationBarScreen);
      },
    );
    print('Right');
    // loader maybe <====
    // QuickAlert.show(
    //   context: context,
    //   type: QuickAlertType.confirm,
    //   title: 'Oops1...',
    //   text: dto.toString(),
    // );
  } else if (postResult.statusCode == 401) {
    Navigator.pushNamed(
      context,
      MyRoutes.wellcomeScreen,
    );
  } else if (postResult.body!.isSuccess == false) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: 250,
          height: 50,
          child: Center(
            child: Text(
              "موجودی کیف پول کافی نیست",
              style: GoogleFonts.vazirmatn(color: Colors.red),
            ),
          ),
        ),
      ),
    ).then(
      (value) {
        Navigator.pushNamed(context, MyRoutes.navigationBarScreen);
      },
    );
  }
  final response = ApiResult.fromJson(postResult.body!.toJson());

  return response;
}
