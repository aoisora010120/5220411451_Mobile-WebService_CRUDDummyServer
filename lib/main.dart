import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/view_product_screen.dart';
import 'screens/add_product_screen.dart';
import 'screens/edit_product_screen.dart';
import 'screens/delete_product_screen.dart';
import 'services/dummy_server.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final DummyServer dummyServer = DummyServer(); // Inisialisasi DummyServer di sini

    return MaterialApp(
      title: 'Flutter CRUD App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(dummyServer: dummyServer),
        '/view': (context) => ViewProductScreen(dummyServer: dummyServer),
        '/add': (context) => AddProductScreen(dummyServer: dummyServer),
        '/edit': (context) => EditProductScreen(dummyServer: dummyServer),
        '/delete': (context) => DeleteProductScreen(dummyServer: dummyServer),
      },
    );
  }
}
