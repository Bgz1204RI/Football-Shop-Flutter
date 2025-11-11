import 'package:flutter/material.dart';
import 'screens/menu.dart';
import 'screens/add_product_form.dart';

void main() {
  runApp(const FootballShopApp());
}

class FootballShopApp extends StatelessWidget {
  const FootballShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,

      routes: {
        '/products': (_) => const MenuPage(),              // All Products
        '/my-products': (_) => const MenuPage(),
        '/create-product': (_) => const AddProductFormPage(), // Create Product (form)
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Football Shop')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              ElevatedButton.icon(
                icon: const Icon(Icons.list),
                label: const Text('All Products'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () => Navigator.pushNamed(context, '/products'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.shopping_bag),
                label: const Text('My Products'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => Navigator.pushNamed(context, '/my-products'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Create Product'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => Navigator.pushNamed(context, '/create-product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
