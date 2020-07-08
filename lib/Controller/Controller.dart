import 'package:flutter/cupertino.dart';
import 'package:kranti/Screens/HomeScreenFeed.dart';
import 'package:kranti/Screens/ProfilePage.dart';
import 'package:kranti/Constants.dart';

class Controller {
  Widget selectScreen(int number) {
    switch (number) {
      case 0:
        appBarString = "KRANTI";
        return HomeScreenFeed();
        break;

      default:
        appBarString = "My Profile";
        return ProfilePage();
    }
  }
}
