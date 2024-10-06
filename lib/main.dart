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

class PendingIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[350],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Positioned(
              left: i * 20.0,
              child: Container(
                  width: 15,
                  height: 15,
                  //color: Colors.primaries[i % Colors.primaries.length],
                  color: Colors.blue),
            ),
        ],
      ),
    );
  }
}
