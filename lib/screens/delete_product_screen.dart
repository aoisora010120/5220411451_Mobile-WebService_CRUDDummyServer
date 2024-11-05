import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/dummy_server.dart';

class DeleteProductScreen extends StatefulWidget {
  final DummyServer dummyServer;

  const DeleteProductScreen({super.key, required this.dummyServer});

  @override
  DeleteProductScreenState createState() => DeleteProductScreenState();
}

class DeleteProductScreenState extends State<DeleteProductScreen> {
  Future<void> _confirmDelete(Product product) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete ${product.name}?'),
          content: const Text('Are you sure you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (shouldDelete == true) {
      await widget.dummyServer.deleteProduct(product.id);
      if (mounted) {
        setState(() {}); // Refresh UI setelah delete
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = widget.dummyServer.getProducts();

    return Scaffold(
      appBar: AppBar(title: const Text('Delete Product')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: ${product.price}'),
            onTap: () => _confirmDelete(product),
          );
        },
      ),
    );
  }
}
