import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_edums/views/message.dart';
import 'package:chat_edums/views/two.dart';

import 'package:chat_edums/views/chatScreen.dart';

class AppRoutes {
  static String loginScreen = '/login';
  static String cardScreen = '/card';
  static String messageScreen = '/message';
  static String chatScreen = '/chatScreen';
  static List<GetPage> pages = [
    GetPage(name: cardScreen, page: () => CardPage()),
    GetPage(name: messageScreen, page: () => message()),
    GetPage(
        name: chatScreen,
        page: () => ChatScreen(
            //headerText: "aa",
            ))
  ];
}
