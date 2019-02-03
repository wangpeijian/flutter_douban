import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/utils/ConstantString.dart';

class BottomNav {
  static final List items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        title: Text(
          ConstantString.home_nav_home,
        )),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.av_timer,
        ),
        title: Text(
          ConstantString.home_nav_soon,
        )),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.assessment,
        ),
        title: Text(
          ConstantString.home_nav_rank,
        )),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        title: Text(
          ConstantString.home_nav_search,
        )),
  ];
}
