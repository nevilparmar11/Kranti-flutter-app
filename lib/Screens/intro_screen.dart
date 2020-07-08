import 'package:kranti/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:kranti/theme.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro_screen extends StatefulWidget {
  @override
  _intro_screenState createState() => _intro_screenState();
}

class _intro_screenState extends State<intro_screen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Feature Name - 1",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'QuickSandBold'),
        description: "Example Feature details - 1",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 20.0, fontFamily: 'QuickSandLight'),
        pathImage: "assets/images/grains.png",
        backgroundColor: MyColors.primaryColor,
      ),
    );
    slides.add(
      Slide(
        title: "Feature Name - 2",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'QuickSandBold'),
        description: "Example Feature Details - 2",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 20.0, fontFamily: 'QuickSandLight'),
        pathImage: "assets/images/grains.png",
        backgroundColor: MyColors.primaryColor,
      ),
    );
    slides.add(
      Slide(
        title: "Feature Name - 3",
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'QuickSandBold',
        ),
        pathImage: "assets/images/grains.png",
        description: "Example Feature Details 3",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 20.0, fontFamily: 'QuickSandLight'),
        backgroundColor: MyColors.primaryColor,
      ),
    );
    slides.add(
      Slide(
        title: "Terms and Conditions",
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'QuickSandBold',
        ),
        pathImage: "assets/images/terms.png",
        description:
            "You agree or not, \n Hit Next !! \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 20.0, fontFamily: 'QuickSandLight'),
        backgroundColor: MyColors.primaryColor,
      ),
    );
  }

  void onDonePress() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('seen', true);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  void onSkipPress() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('seen', true);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: MyColors.primaryColorLightv4,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: MyColors.primaryColorLightv4,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: MyColors.primaryColorLightv4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: MyColors.naviBlueLight.withOpacity(0.50),
      colorActiveDot: MyColors.primaryColorLightv4,
      sizeDot: 13.0,
    );
  }
}
