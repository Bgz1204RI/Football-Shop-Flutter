import 'package:flutter/material.dart';
import 'package:football_shop/widgets/item_card.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'add_product_form.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Adidas Football Shoes',
        'price': 1200000,
        'description': 'Comfortable firm-ground football boots.',
        'thumbnail':
            'https://images.pexels.com/photos/1405355/pexels-photo-1405355.jpeg',
        'category': 'Shoes',
        'size': '42',
        'stock': 10,
        'is_featured': true,
        'for_sale': true,
      },
      {
        'name': 'Nike Jersey',
        'price': 750000,
        'description': 'Lightweight and breathable training jersey.',
        'thumbnail':
            'https://images.pexels.com/photos/999309/pexels-photo-999309.jpeg',
        'category': 'Jersey',
        'size': 'L',
        'stock': 5,
        'is_featured': false,
        'for_sale': true,
      },
      {
        'name': 'Puma Goalkeeper Gloves',
        'price': 500000,
        'description': 'GripControl palms with latex coating.',
        'thumbnail':
            'https://images.pexels.com/photos/399187/pexels-photo-399187.jpeg',
        'category': 'Gloves',
        'size': 'M',
        'stock': 0,
        'is_featured': false,
        'for_sale': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Shop'),
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ItemCard(
            name: item['name'],
            price: item['price'],
            description: item['description'],
            thumbnail: item['thumbnail'],
            category: item['category'],
            size: item['size'],
            stock: item['stock'],
            isFeatured: item['is_featured'],
            forSale: item['for_sale'],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddProductFormPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
