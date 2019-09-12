import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/utils/ConstantString.dart';

class BottomNav {
  static final List items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications_active,
        ),
        title: Text(
          ConstantString.home_nav_soon,
        )),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.ondemand_video,
        ),
        title: Text(
          ConstantString.home_ondemand_video,
        )),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.new_releases,
        ),
        title: Text(
          ConstantString.home_new_movies,
        )),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.assessment,
        ),
        title: Text(
          ConstantString.home_nav_rank,
        )),
  ];
}
