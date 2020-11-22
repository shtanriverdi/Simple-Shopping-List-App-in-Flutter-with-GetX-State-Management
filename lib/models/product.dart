import 'package:get/state_manager.dart';

class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;

  Product(
      {this.id,
      this.productName,
      this.productImage,
      this.productDescription,
      this.price});

  // It will be automatically changed
  final isFavorite = false.obs;
  final quantity = 1.obs;
}
