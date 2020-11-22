import 'package:flutter/material.dart';
import 'package:getx_test_project/views/shopping_page.dart';

void main() {
  // We can put every Controller here as well
  // But to save memory, we are not doing this!
  // As soon as the page destroyed
  // GetX will automatically destroys the Controllers 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ShoppingPage(),
    );
  }
}
