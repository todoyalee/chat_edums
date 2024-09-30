import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_edums/views/message.dart';
import 'package:chat_edums/views/two.dart';

import 'package:chat_edums/views/chatScreen.dart';

import 'package:chat_edums/views/reclamation.dart';

import 'package:chat_edums/views/components/ReclamtionDetails.dart';

class AppRoutes {
  static String loginScreen = '/login';
  static String cardScreen = '/card';
  static String messageScreen = '/message';
  static String chatScreen = '/chatScreen';
  static String reclamationDetailsScreen = '/reclamationDetails';

  static String reclamationScreen = '/ReclamationScreen';
  static List<GetPage> pages = [
    GetPage(name: cardScreen, page: () => CardPage()),
    GetPage(name: messageScreen, page: () => message()),
    GetPage(name: chatScreen, page: () => ChatScreen()),
    GetPage(name: reclamationScreen, page: () => ReclamationApp()),
//    GetPage(name: reclamationDetailsScreen, page: () => ReclamationDetails(reclamation: null,))
  ];
}
