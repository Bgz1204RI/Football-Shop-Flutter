import 'package:flutter/material.dart';

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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }

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
                onPressed: () =>
                    _showSnack(context, 'You have pressed the All Products button'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.shopping_bag),
                label: const Text('My Products'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () =>
                    _showSnack(context, 'You have pressed the My Products button'),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Create Product'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () =>
                    _showSnack(context, 'You have pressed the Create Product button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
