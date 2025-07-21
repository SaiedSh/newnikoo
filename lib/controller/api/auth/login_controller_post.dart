import 'package:bookapp/controller/api/payment/shop_card/get_shopcard_list.dart'
    show getShopCardList;
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<TempUserDtoApiResult> login(
    {required String phoneNumber,
    String? userName,
    required BuildContext context}) async {
  final api = Tikonline.create();

  final postResult = await api.apiV1AuthenticationLoginSignUpPost(
    body: TempUserDto(
      phoneNumber: phoneNumber,
    ),
  );
  print(postResult.body);
  print(postResult.error);

  if (postResult.isSuccessful == true) {
    print(postResult.error);
    if (postResult.body!.isSuccess == true) {
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: postResult.error.toString(),
      );
    }
  } else {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: postResult.error.toString(),
    );
  }
  final response = TempUserDtoApiResult.fromJson(postResult.body!.toJson());

  return response;
}

Future<AccessToken> loginOtp({
  required BuildContext context,
  required TempUserDto body,
}) async {
  print("OTP");
  final api = Tikonline.create();
  final postResult = await api.apiV1AuthenticationLoginSignUpValidationPost(
    body: body,
  );
  //print(LoginOtpDto().code);
  print(postResult.body);
  print(postResult.error);
  //postResult.body.token

  if (postResult.isSuccessful == true) {
    print("hey im after route");
    final response = AccessToken.fromJson(postResult.body!.toJson());
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("accessToken", response.accessToken.toString());
    getShopCardList(context: context);

    Navigator.pushNamed(context, MyRoutes.navigationBarScreen);
  } else if (postResult.statusCode == 401) {
    Navigator.pushNamed(
      context,
      MyRoutes.wellcomeScreen,
    );
  } else {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'کد وارد شده اشتباه است',
        confirmBtnText: 'باشه');
  }
  final response = AccessToken.fromJson(postResult.body!.toJson());

  return response;
}
