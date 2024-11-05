import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/dummy_server.dart';

class ViewProductScreen extends StatelessWidget {
  final DummyServer dummyServer;

  const ViewProductScreen({super.key, required this.dummyServer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Products')),
      body: FutureBuilder<List<Product>>(
        future: Future.value(dummyServer.getProducts()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available.'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Price: ${product.price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
