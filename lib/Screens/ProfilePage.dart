import 'package:flutter/material.dart';
import 'package:kranti/Screens/PhoneVerification.dart';
import 'package:kranti/theme.dart';
import 'package:kranti/Components/SimpleRoundButton.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  _handleSignuporsignin() {
    print("Handle signup/signin was called");
    // Now take user to the signup/signin page
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return PhoneVerificationPage();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SimpleRoundButton(
          backgroundColor: MyColors.primaryColorLight,
          buttonText: Text(
            "SignUp / SignIn",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "QuickSandMedium",
            ),
            textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.25,
          ),
          textColor: Colors.white,
          onPressed: () {
            _handleSignuporsignin();
          },
        ),
      ),
    );
  }
}
