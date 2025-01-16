import 'package:bookapp/controller/api/home_items/category_products.dart';
import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksScreen extends StatefulWidget {
  final String categoryId;
  const BooksScreen({super.key, required this.categoryId});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductsByCategory(context: context, categortyId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProductsState>(
        builder: (context, value, child) => Column(
          children: [
            for (var element in ProductsState.books)
              ListTile(
                title: Text(element.title.toString()),
              )
          ],
        ),
      ),
    );
  }
}
