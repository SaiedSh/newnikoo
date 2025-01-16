import 'dart:async';

import 'package:chopper/chopper.dart';

// class MyRequestInterceptor implements Interceptor {
//   MyRequestInterceptor(this.token);

//   final String token;

//   @override
//   FutureOr<Response<BodyType>> intercept<BodyType>(
//       Chain<BodyType> chain) async {
//     final request = applyHeader(chain.request, 'auth_token', 'Bearer $token');
//     return chain.proceed(request);
//   }
// }

// class MyResponseInterceptor implements Interceptor {
//   MyResponseInterceptor(this._token);

//   String _token;

//   @override
//   FutureOr<Response<BodyType>> intercept<BodyType>(
//       Chain<BodyType> chain) async {
//     final response = await chain.proceed(chain.request);
//     _token = response.headers['auth_token']!;
//     return response;
//   }
// }

class AccessOriginHeader implements Interceptor {
  AccessOriginHeader(this.token);

  final String token;

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    final request =
        applyHeader(chain.request, 'Access-Control-Allow-Origin', '*');
    return chain.proceed(request);
  }
}

class StreamByte implements Interceptor {
  StreamByte(this.token);

  final String token;

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    final request =
        applyHeader(chain.request, 'Content-Type', 'application/octet-stream');
    return chain.proceed(request);
  }
}
