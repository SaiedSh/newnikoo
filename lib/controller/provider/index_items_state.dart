import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:flutter/material.dart';

class IndexItemsState extends ChangeNotifier {
  static IndexDto? IndexLists;
  getIndexItems({required IndexDto newClientProfile}) {
    IndexLists = newClientProfile;
    notifyListeners();
  }
}
