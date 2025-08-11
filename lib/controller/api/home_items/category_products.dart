import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:bookapp/model/services/token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

Future<CategoryDtoListApiResult> getCategories(
    {String? motherId, required BuildContext context}) async {
  final api = Tikonline.create(interceptors: [TokenInterceptor('accessToken')]);

  final postResult = await api.apiV1CategoryListGet(motherId: motherId);
  print(motherId);
  print(postResult.body);
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
    );
  }
  final response = CategoryDtoListApiResult.fromJson(postResult.body!.toJson());

  // if (motherId != null) {
  // context.read<CategoryState>().getChildCategory(value: response.data!);
  // } else {
  context.read<CategoryState>().getCategory(value: response.data!);
  // }

  return response;
}

Future<BookDtoListApiResult> getProductsByCategory(
    {String? categortyId, required BuildContext context}) async {
  final api = Tikonline.create(interceptors: [TokenInterceptor('accessToken')]);

  final postResult = await api.apiV1BookListGet(categortyId: categortyId);

  if (postResult.isSuccessful == true) {
    print(postResult.body!.data.toString());
    print('Rightkjbiugiugb');
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
    );
  }
  final response = BookDtoListApiResult.fromJson(postResult.body!.toJson());
  context.read<ProductsState>().getBooksByCategory(value: response.data!);

  return response;
}
