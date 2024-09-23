import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_edums/views/one.dart';
import 'package:chat_edums/views/two.dart';

class AppRoutes {
  static String loginScreen = '/login';
  static String cardScreen = '/card';

  static List<GetPage> pages = [
    GetPage(name: cardScreen, page: () => CardPage()),
    GetPage(name: loginScreen, page: () => LoginPage()),
  ];
}
