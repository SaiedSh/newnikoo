import 'package:bookapp/controller/provider/wallet_payment.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:bookapp/model/services/token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

Future<StringApiResult> buySubscriptions(
    {required BuildContext context, String? subId, bool? wallet}) async {
  final api = Tikonline.create(interceptors: [TokenInterceptor('accessToken')]);

  final postResult =
      await api.apiV1PaymentBuySubscriptionPost(subId: subId, wallet: wallet);
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
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops2...',
      text: postResult.toString(),
    );
  }
  final response = StringApiResult.fromJson(postResult.body!.toJson());
  context.read<SubChargeState>().getLink(value: response.data!);

  return response;
}
