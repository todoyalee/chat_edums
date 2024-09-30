import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_edums/routes/app_routes.dart';
import 'package:chat_edums/views/reclamation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.reclamationScreen,
      getPages: AppRoutes.pages,
    );
  }
}
