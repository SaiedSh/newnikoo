import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenInterceptor implements Interceptor {
  TokenInterceptor(this.token);

  final String token;

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("accessToken").toString();
    final request =
        applyHeader(chain.request, 'Authorization', 'Bearer $token');
    return chain.proceed(request);
  }
}
