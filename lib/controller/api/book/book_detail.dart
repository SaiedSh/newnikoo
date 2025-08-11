import 'package:bookapp/controller/provider/book_detail_state.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:bookapp/model/services/token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

Future<BookDtoApiResult> getBookDetails(
    {required BuildContext context, String? bookId}) async {
  final api = Tikonline.create(interceptors: [TokenInterceptor('accessToken')]);

  final postResult = await api.apiV1BookDetailGet(bookId: bookId);
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
    );
  }
  final response = BookDtoApiResult.fromJson(postResult.body!.toJson());
  print(response.data);
  context.read<BookDetailState>().getBookDetail(value: response.data!);

  return response;
}
