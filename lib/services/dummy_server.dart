import '../models/product.dart';

class DummyServer {
  final List<Product> _products = [];

  Future<void> addProduct(Product product) async {
    _products.add(product);
  }

  Future<void> deleteProduct(String id) async {
    _products.removeWhere((product) => product.id == id);
  }

  Future<void> updateProduct(Product updatedProduct) async {
    int index = _products.indexWhere((product) => product.id == updatedProduct.id);
    if (index != -1) {
      _products[index] = updatedProduct;
    }
  }

  List<Product> getProducts() {
    return _products;
  }
}
