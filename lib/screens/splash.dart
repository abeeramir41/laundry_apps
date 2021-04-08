import 'dart:async';

import 'package:flutter/material.dart';
import '../utils/color.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_apps/screens/bnvmain.dart';



class SplashPage extends StatefulWidget {




  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  User firebaseUser = FirebaseAuth.instance.currentUser;

  Widget firstWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      if (firebaseUser != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Bnvmain()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }

}
