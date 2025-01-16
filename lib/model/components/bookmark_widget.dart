import 'package:flutter/material.dart';

class BookmarkWidget extends StatefulWidget {
  final String itemId;

  BookmarkWidget({required this.itemId});

  @override
  _BookmarkWidgetState createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    // You can initialize the state here by checking a persistent storage or API
    // For now, it defaults to false.
  }

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      // You can add logic to save the bookmark state to persistent storage or a database here
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: isBookmarked ? Colors.black : null,
      ),
      onPressed: _toggleBookmark,
    );
  }
}
