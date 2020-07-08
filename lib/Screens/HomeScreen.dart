import 'package:flutter/material.dart';
import 'package:kranti/Components/MyAppbar.dart';
import 'package:kranti/Components/MyDrawer.dart';
import 'package:kranti/Controller/Controller.dart';
import 'package:kranti/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  Controller controller = new Controller();

  _selectScreen(int index) {
    setState(() {
      _page = index;
    });
  }

  _createTrade() {
    print("Create New Trade was pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Container(
        child: controller.selectScreen(_page),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: MyColors.primaryColor,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "QuickSandMedium",
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: MyColors.primaryColor,
            ),
            title: Text(
              "My Profile",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "QuickSandMedium",
              ),
            ),
          ),
        ],
        onTap: (index) {
          _selectScreen(index);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _createTrade();
        },
      ),
    );
  }
}
