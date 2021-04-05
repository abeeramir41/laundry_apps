import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry_apps/homechild/addorder.dart';
import 'package:laundry_apps/screens/cart.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/topheader.png')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),

                   child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/78/07/03/78070395106fcd1c3e66e3b3810568bb.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top:8.0,),
                              child:  Text(
                                'Welcome Back',
                                style: TextStyle(
                                    fontFamily: "Montserrat Medium",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 30.0,top: 2),
                                child:  Text(
                                  'John Richardo',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,

                                      fontFamily: "Montserrat Regular"),
                                )
                            )
                          ],
                        ),
                      )
                    ],

                  ),Column(

                    children: [
                      IconButton(
                          onPressed:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Cart()));

                          },
                          icon: Icon(Icons.shopping_cart,color: Colors.white,)
                      ),


                    ],
                  )
                ],
              ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.13,
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/wash2.png" ,width: 100,height: 100,),
                                Text(
                                  'Wash & Iron',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => AddOrder()));
                          },
                        ),
                        InkWell(
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/iron1.png" ,width: 100,height: 100,),

                                Text(
                                  'Ironing',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => AddOrder()));
                          },
                        ),

                       InkWell(
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/dry1.png" ,width: 100,height: 100,),
                                Text(
                                  'Dry Cleaning',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                         onTap: (){
                           Navigator.push(context,MaterialPageRoute(builder: (context) => AddOrder()));
                         },
                        ),

                     InkWell(
                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/pack.png" ,width: 100,height: 100,),

                                Text(
                                  'Packages',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => AddOrder()));
                          },
                        ),

                                              ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
