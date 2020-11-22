import 'package:get/get.dart';
import 'package:getx_test_project/models/product.dart';

class CardController extends GetxController {
  var cardItems = List<Product>().obs; // Observable
  // Anytime from any page when we call this method by using cardController
  // it is going to update cardItems
  // whoever or wherever is listening to the cardItems
  // They are going to get the updated data
  double get totalPrice => cardItems.fold(0, (sum, item) => sum + item.price);
  int get count => cardItems.length;

  var testAmountForGetXBuilder = 0.0;

  addToCard(Product product) {
    cardItems.add(product);
    // GetBuilder Test
    testAmountForGetXBuilder = totalPrice;
    // If you use GetBuilder, you have to update it manually!
    update();
  }
}
