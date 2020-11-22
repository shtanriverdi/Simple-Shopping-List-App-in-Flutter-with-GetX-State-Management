import 'package:get/get.dart';
import 'package:getx_test_project/models/product.dart';

class ShoppingController extends GetxController {
  // Anytime the data changes, it is going to UI as well
  // List Of Prodcuts
  var products = List<Product>().obs; // Observable
  @override
  onInit() {
    super.onInit();
    // Call API on init
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 2,
          productName: "Melo",
          productImage: "asd",
          productDescription: "Some MELOOO lays here!",
          price: 10.0),
      Product(
          id: 2,
          productName: "Seno",
          productImage: "agg",
          productDescription: "Some Senoseno lays here!",
          price: 25.0),
      Product(
          id: 2,
          productName: "Gülderen",
          productImage: "gülgül",
          productDescription: "Some gülgül lays here!",
          price: 50.0),
    ];
    // Update the products from the data came from API
    products.assignAll(productResult);
  }
}
