import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:flutter/material.dart';

class UserTransactionsState extends ChangeNotifier {
  static List<PaymentTransactionsDto> transactions = [];
  getTransactions({required List<PaymentTransactionsDto> value}) {
    transactions = value;
    notifyListeners();
  }
}
