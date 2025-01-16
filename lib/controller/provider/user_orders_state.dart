import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:flutter/material.dart';

class UserOrdersState extends ChangeNotifier {
  static List<BookOrderDto> orders = [];
  getUserOrders({required List<BookOrderDto> value}) {
    orders = value;
    notifyListeners();
  }
}
