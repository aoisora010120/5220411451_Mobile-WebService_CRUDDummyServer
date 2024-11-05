import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/dummy_server.dart';

class EditProductScreen extends StatefulWidget {
  final DummyServer dummyServer;

  const EditProductScreen({super.key, required this.dummyServer});

  @override
  EditProductScreenState createState() => EditProductScreenState();
}

class EditProductScreenState extends State<EditProductScreen> {
  Future<void> _confirmEdit(Product product) async {
    final nameController = TextEditingController(text: product.name);
    final priceController = TextEditingController(text: product.price.toString());

    final shouldSave = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit ${product.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Save Changes'),
            ),
          ],
        );
      },
    );

    if (shouldSave == true) {
      final updatedProduct = Product(
        id: product.id,
        name: nameController.text,
        price: int.parse(priceController.text),
      );
      await widget.dummyServer.updateProduct(updatedProduct);
      if (mounted) {
        setState(() {}); // Refresh UI setelah edit
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.dummyServer.getProducts();

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: ${product.price}'),
            onTap: () => _confirmEdit(product),
          );
        },
      ),
    );
  }
}
