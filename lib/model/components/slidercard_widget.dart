import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final String imagePath;
  const SliderWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(spreadRadius: 0.1, blurRadius: 3, color: Colors.grey)
          ],
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(18)),
    );
  }
}
