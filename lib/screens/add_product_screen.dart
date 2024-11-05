  import 'package:flutter/material.dart';
  import '../models/product.dart';
  import '../services/dummy_server.dart';

  class AddProductScreen extends StatefulWidget {
    final DummyServer dummyServer;

    const AddProductScreen({super.key, required this.dummyServer});

    @override
    AddProductScreenState createState() => AddProductScreenState();
  }

  class AddProductScreenState extends State<AddProductScreen> {
    final _nameController = TextEditingController();
    final _priceController = TextEditingController();

    Future<void> _addProductAndNavigateBack() async {
      final product = Product(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        price: int.parse(_priceController.text),
      );

      await widget.dummyServer.addProduct(product);

      if (mounted) {
        Navigator.of(context).pop();
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Add Product')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addProductAndNavigateBack,
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      );
    }
  }
