import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/add_product_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Football Shop'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MenuPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Product'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AddProductFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
