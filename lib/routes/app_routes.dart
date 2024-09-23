import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_edums/views/message.dart';
import 'package:chat_edums/views/two.dart';

class AppRoutes {
  static String loginScreen = '/login';
  static String cardScreen = '/card';
  static String messageScreen = '/message';
  static List<GetPage> pages = [
    GetPage(name: cardScreen, page: () => CardPage()),
    GetPage(name: messageScreen, page: () => message())
  ];
}
