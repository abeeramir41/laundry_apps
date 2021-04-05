import 'package:flutter/material.dart';

import 'package:laundry_apps/utils/color.dart';
import 'package:laundry_apps/screens/login_page.dart';
import 'package:laundry_apps/services/auth_service.dart';

class Account extends StatefulWidget {
  @override
  _accountState createState() => _accountState();
}

class _accountState extends State<Account> {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,

          title: Text("Account",style: TextStyle(
            fontFamily: 'Montserrat Regular',
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,

          ),)

      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/topheader.png'), fit: BoxFit.cover,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.only(left: 12),

                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/78/07/03/78070395106fcd1c3e66e3b3810568bb.jpg'),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,),
      child: Text(
                          'John Richardo',
                          style: TextStyle(
                              fontFamily: "Montserrat Medium",
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),

                    InkWell(
                      onTap: null,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "View & Edit Profile",
                          style: TextStyle(
                            fontFamily: "Montserrat Medium",
                            color: Colors.white,
                            fontSize: 14,

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("My Location",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15),),
            subtitle: Text("Details about Your Address",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12),),
            leading: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.my_location,
                size: 26,
                color: orangeColors,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: orangeColors,),
            onTap: null,
          ),
          ListTile(
            title: Text("Settings",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15),),
            subtitle: Text("Privacy & Policy",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12),),
            leading: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.settings,
                size: 26,
                color: orangeColors,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,color: orangeColors,),
            onTap: null,
          ),
          ListTile(
            title: Text("Help & Support",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15),),
            subtitle: Text("Help center & legal terms",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12),),
            leading: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.help,
                size: 26,
                color: orangeColors,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined, size: 26,
              color: orangeColors),
            onTap: null,
          ),
          ListTile(
            title: Text("Log Out",style: TextStyle(
                fontFamily: "Montserrat Medium",
                color: Colors.red,
                fontWeight: FontWeight.w400,
                fontSize: 15),),

            leading: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Icon(
                Icons.exit_to_app,
                size: 25,
                color:Colors.red,
              ),
            ),

            onTap: (){

              _authService.signOut(
                  ).then((value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>LoginPage()
                    ));
              });

            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
