import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';

class AddProductFormPage extends StatefulWidget {
  const AddProductFormPage({super.key});

  @override
  State<AddProductFormPage> createState() => _AddProductFormPageState();
}

class _AddProductFormPageState extends State<AddProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  int _price = 0;
  String _description = '';
  String _thumbnail = '';
  String _category = '';
  String _size = '';
  int _stock = 0;
  bool _isFeatured = false;
  bool _forSale = true;

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Product Saved'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Name: $_name'),
              Text('Price: $_price'),
              Text('Description: $_description'),
              Text('Thumbnail: $_thumbnail'),
              Text('Category: $_category'),
              Text('Size: $_size'),
              Text('Stock: $_stock'),
              Text('Featured: ${_isFeatured ? "Yes" : "No"}'),
              Text('For Sale: ${_forSale ? "Yes" : "No"}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                onSaved: (v) => _name = v!.trim(),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Name is required' : null,
              ),
              const SizedBox(height: 12),

              // Price
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (v) => _price = int.parse(v!),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Price is required';
                  final x = int.tryParse(v);
                  if (x == null || x <= 0) {
                    return 'Price must be a positive number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Description
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onSaved: (v) => _description = v!.trim(),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Description is required' : null,
              ),
              const SizedBox(height: 12),

              // Thumbnail
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Thumbnail URL',
                  border: OutlineInputBorder(),
                ),
                onSaved: (v) => _thumbnail = v!.trim(),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Thumbnail is required';
                  }
                  // light check; adjust if your spec wants stricter
                  if (!v.startsWith('http://') && !v.startsWith('https://')) {
                    return 'Enter a valid URL (http/https)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Category
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  hintText: 'e.g. Shoes, Jersey, Ball',
                  border: OutlineInputBorder(),
                ),
                onSaved: (v) => _category = v!.trim(),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Category is required' : null,
              ),
              const SizedBox(height: 12),

              // Size
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Size',
                  hintText: 'e.g. 42, M, 5',
                  border: OutlineInputBorder(),
                ),
                onSaved: (v) => _size = v!.trim(),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Size is required' : null,
              ),
              const SizedBox(height: 12),

              // Stock
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Stock',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (v) => _stock = int.parse(v!),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Stock is required';
                  final x = int.tryParse(v);
                  if (x == null || x < 0) {
                    return 'Stock must be 0 or more';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // is_featured
              SwitchListTile(
                title: const Text('Featured Product'),
                value: _isFeatured,
                onChanged: (val) {
                  setState(() {
                    _isFeatured = val;
                  });
                },
              ),

              // for_sale
              SwitchListTile(
                title: const Text('Available for Sale'),
                value: _forSale,
                onChanged: (val) {
                  setState(() {
                    _forSale = val;
                  });
                },
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _showResultDialog();
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
