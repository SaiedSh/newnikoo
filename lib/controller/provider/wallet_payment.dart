import 'package:flutter/material.dart';

class WalletChargeState extends ChangeNotifier {
  static String? link;
  getLink({required String value}) {
    link = value;
    notifyListeners();
  }
}
