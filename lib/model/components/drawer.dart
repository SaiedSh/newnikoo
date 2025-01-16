import 'package:bookapp/controller/provider/category_product_state.dart';
import 'package:bookapp/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 230,
      child: Consumer<CategoryState>(
        builder: (context, value, child) => ListView(children: [
          DrawerHeader(
            child: Center(child: Text('Book')),
          ),
          for (var element in CategoryState.categories)
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnotherScreen(
                        motherId: element.id.toString(),
                      ),
                    ));
              },
              title: Text(element.title.toString()),
              trailing: Icon(Icons.arrow_forward),
            ),
        ]),
      ),
    );
  }
}
