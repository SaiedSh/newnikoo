import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:flutter/material.dart';

class SubscriptionsState extends ChangeNotifier {
  static List<SubscriptionDto> subscriptions = [];
  getSubscriptions({required List<SubscriptionDto> value}) {
    subscriptions = value;
    notifyListeners();
  }
}
