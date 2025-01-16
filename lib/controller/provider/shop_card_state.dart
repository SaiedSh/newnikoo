import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:flutter/material.dart';

class ShopCardState extends ChangeNotifier {
  static ShopCardDto? shopCardList;
  getShopCards({required ShopCardDto value}) {
    shopCardList = value;
    notifyListeners();
  }
}
