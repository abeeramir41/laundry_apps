import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:laundry_apps/utils/color.dart';
import 'package:laundry_apps/bnvscreens/home.dart';
import 'package:laundry_apps/bnvscreens/account.dart';
import 'package:laundry_apps/bnvscreens/order.dart';
import 'package:laundry_apps/bnvscreens/Discountedoffers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_apps/services/messagehendle.dart';

class Bnvmain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BnvmainState();
  }

}
class _BnvmainState extends State<Bnvmain>{


  Icon notificationicon = new Icon(Icons.notifications_active);
  int _currentindex=0;
  final tabs =[
    HomeScreen(),
   Order(),
    Discountoffer(),
    Account(),

  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: tabs[_currentindex],
      bottomNavigationBar:  BottomNavyBar(
        selectedIndex: _currentindex,

        onItemSelected: (index){
          setState(() {
            _currentindex=index;
          },
          );
        },items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home_outlined,size: 22,),
            title: Text("Home",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: orangeColors,
                fontWeight: FontWeight.w600,
                fontSize: 15),),
            activeColor: orangeColors,
            inactiveColor: Colors.grey

          ),
        BottomNavyBarItem(
            icon: Icon(Icons.text_snippet_outlined,size: 22,),
            title: Text("Order",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: orangeColors,
                fontWeight: FontWeight.w600,
                fontSize: 15),),
            activeColor: orangeColors,
            inactiveColor: Colors.grey

        ),
        BottomNavyBarItem(

            icon: Icon(Icons.panorama_vertical_outlined,size: 22,),
            title: Text("Voucher",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: orangeColors,
                fontWeight: FontWeight.w600,
                fontSize: 15),),
            activeColor: orangeColors,
            inactiveColor: Colors.grey

        ),
        BottomNavyBarItem(
            icon: Icon(Icons.person_outline_outlined,size: 22,),
            title: Text("Account",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: orangeColors,
                fontWeight: FontWeight.w600,
                fontSize: 15),),
            activeColor:orangeColors,
            inactiveColor: Colors.grey

        ),

      ],
      ),
    );
  }


}