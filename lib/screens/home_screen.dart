import 'package:flutter/material.dart';
import '../services/dummy_server.dart';

class HomeScreen extends StatelessWidget {
  final DummyServer dummyServer;

  const HomeScreen({super.key, required this.dummyServer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Management')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/view'),
              child: const Text('View Product'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/add'),
              child: const Text('Add Product'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/edit'),
              child: const Text('Edit Product'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/delete'),
              child: const Text('Delete Product'),
            ),
          ],
        ),
      ),
    );
  }
}
