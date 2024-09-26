import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_edums/routes/app_routes.dart';
import 'package:chat_edums/views/reclamation.dart';

void main() {
  runApp(ReclamationApp());
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
