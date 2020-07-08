import 'package:cached_network_image/cached_network_image.dart';
import 'package:kranti/Services/CrudServices.dart';
import 'package:kranti/Models/UserModel.dart';
import 'package:kranti/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  CrudMethodsUsers crudMethodsObj = new CrudMethodsUsers();

  ListTile _createListTile(String name, IconData iconname, Function fname) {
    return ListTile(
      leading: Icon(
        iconname,
        size: 25,
        color: Colors.black,
      ),
      title: Text(
        name,
        style: TextStyle(
            color: Colors.black, fontFamily: 'QuickSandRegular', fontSize: 22),
      ),
      onTap: () {
        fname();
      },
    );
  }

  ListTile madeWithLoveTile() {
    return ListTile(
      title: Center(
        child: Text(
          "Made With ❤",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'QuickSandRegular',
              fontSize: 16),
        ),
      ),
      subtitle: Center(
        child: Text(
          "KRANTI",
          style: TextStyle(
              color: Colors.black, fontFamily: 'QuickSandLight', fontSize: 11),
        ),
      ),
      contentPadding: EdgeInsets.all(10),
      onTap: () {
        print('Made with Love tapped');
      },
    );
  }

  _handleHome() {
    print('Home was tapped');
  }

  _handleSuggestion() {
    print('Suggestion was tapped');
  }

  _handleSignOut() {
    print('Sign Out was tapped');
    crudMethodsObj.signOutGoogle();
    SystemNavigator.pop();
  }

  _handleAboutUs() {
    print("About us was tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: MyColors.primaryColor),
              arrowColor: Colors.white,
              accountName: Text(
                User.fname + " " + User.lname,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'QuickSandRegular',
                    fontSize: 24),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/grains.png"),
                  backgroundColor: Colors.white,
                ),
              )),
          _createListTile("Home", Icons.home, _handleHome),
          _createListTile("About Us", Icons.person_outline, _handleAboutUs),
          _createListTile("Suggestion", Icons.feedback, _handleSuggestion),
          _createListTile("Sign Out", Icons.exit_to_app, _handleSignOut),
          Container(
            height: 200,
          ),
          madeWithLoveTile(),
        ],
      ),
      elevation: 12,
    );
  }
}
