import 'package:flutter/material.dart';

class WalletChargeState extends ChangeNotifier {
  static String? link;
  getLink({required String value}) {
    link = value;
    notifyListeners();
  }
}

class SubChargeState extends ChangeNotifier {
  static String? link;
  getLink({required String value}) {
    link = value;
    notifyListeners();
  }
}

class ShopCardChargeState extends ChangeNotifier {
  static String? link;
  getLink({required String value}) {
    link = value;
    notifyListeners();
  }
}
