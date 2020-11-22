import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_project/controllers/cart_controller.dart';
import 'package:getx_test_project/controllers/shopping_controller.dart';

// We don't need to create StafulWidget with GetX
class ShoppingPage extends StatelessWidget {
  // Dependency Injection
  // One time we put something like CardController into dependency
  // We don't have to create it again
  // Entire lifecycle of the application, until we destroy this page,
  // it is going to be exist in the dependencies
  // When we nagivate to another page, we can still access CardController
  // By using the Get.find(), so For each page we don't have to put again and again
  // It is only one time process
  final shoppingController = Get.put(ShoppingController());
  final cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(
                                          '${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cardController
                                      .addToCard(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to Cart'),
                              ),
                              Obx(() => IconButton(
                                    icon: controller
                                            .products[index].isFavorite.value
                                        ? Icon(Icons.check_box_rounded)
                                        : Icon(Icons
                                            .check_box_outline_blank_outlined),
                                    onPressed: () {
                                      controller.products[index].isFavorite
                                          .toggle(); // Works only on booleans, no need to write anything
                                    },
                                  ))
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),
            Obx(() {
              return Text(
                "Total amount: \$ ${cardController.totalPrice}",
                style: TextStyle(fontSize: 32),
              );
            }),
            // GetX<CardController>(builder: (controller) {
            //   return Text(
            //     "Total amount: \$ ${controller.totalPrice}",
            //     style: TextStyle(fontSize: 32),
            //   );
            // }),
            // GetBuilder<CardController>(builder: (controller) {
            //   return Text(
            //     "Total amount: \$ ${controller.testAmountForGetXBuilder}",
            //     style: TextStyle(fontSize: 32),
            //   );
            // }),
            // GetX<CardController>(builder: (controller) {
            //   return Text(
            //     "Total amount: \$ ${controller.totalPrice}",
            //     style: TextStyle(fontSize: 32),
            //   );
            // }),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CardController>(
          builder: (controller) {
            return Text(controller.count.toString());
          },
        ),
        icon: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
