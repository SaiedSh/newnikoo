import 'package:flutter/material.dart';

class Loader {
  static bool loading = false;
  static showLoader(BuildContext context) {
    loading = true;
    showDialog(
      context: context,
      builder: (context) => const AlertDialog.adaptive(
        content: SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static cloaseLoader(BuildContext context) {
    if (loading == true) {
      Navigator.of(context).pop();
      loading = false;
    }
  }
}
