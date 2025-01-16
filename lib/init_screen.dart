import 'package:bookapp/controller/routes/routes.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  static Future<bool> isTokenExpired() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool token = sharedPreferences.containsKey("accessToken");

    if (token == false) {
      return true;
    }

    return false;
  }

  void _checkToken() async {
    bool isExpired = await isTokenExpired();
    if (isExpired) {
      Navigator.pushNamed(
        context,
        MyRoutes.wellcomeScreen,
      );
    } else {
      Navigator.pushNamed(
        context,
        MyRoutes.navigationBarScreen,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
      color: primaryColor,
    )));
  }
}
