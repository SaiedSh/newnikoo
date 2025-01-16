import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:flutter/material.dart';

class ProfileState extends ChangeNotifier {
  static UserDto? profile;
  getProfile({required UserDto newClientProfile}) {
    profile = newClientProfile;
    notifyListeners();
  }
}
