import 'package:bookapp/controller/provider/profile_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:bookapp/model/services/token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserDtoApiResult> getUserProfile({
  required BuildContext context,
}) async {
  final api = Tikonline.create(interceptors: [TokenInterceptor('accessToken')]);

  final postResult = await api.apiV1UserGetProfileGet();
  print(postResult);
  if (postResult.isSuccessful == true) {
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
  } else {
    final prefs = await SharedPreferences.getInstance();

    // دریافت توکن از SharedPreferences
    String? token = prefs.getString('accessToken');
    print("$token" + "TKTKTKTKTKTK");
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops2...',
      text: postResult.toString(),
    );
  }
  final response = UserDtoApiResult.fromJson(postResult.body!.toJson());
  print(response.data);
  context.read<ProfileState>().getProfile(newClientProfile: response.data!);

  return response;
}
