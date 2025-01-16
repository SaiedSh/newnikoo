import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTextCard extends StatelessWidget {
  final String name;
  const CategoryTextCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            name,
            style: GoogleFonts.vazirmatn(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
