import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_edums/routes/app_routes.dart'; // Import your routes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.cardScreen, // Define the initial route
      getPages: AppRoutes.pages, // Add the routes
    );
  }
}
