import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry_apps/utils/color.dart';
import 'package:laundry_apps/model/voucher.dart';
import 'package:intl/intl.dart';

class Discountoffer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Discountoffer() ;
  }

}
class _Discountoffer  extends State<Discountoffer >{

  List<Voucher> items = [
    Voucher(
      name: "Get 20 % on your first order",
      price: 20,
        code: "GMP20"

    ),
    Voucher(
        name: "Get 50 % on your first order",
        price: 20,
        code: "GMP50"

    ), Voucher(
        name: "Get 40 % on your first order",
        price: 20,
        code: "GMP40"

    ),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,

          title: Text("Vouchers",style: TextStyle(
            fontFamily: 'Montserrat Regular',
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,

          ),)

      ),



      body:Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.8,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return  Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.1,
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          offset: Offset(4.0,4.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0),
                      BoxShadow(
                          color: Colors.white10,
                          offset: Offset(0.0,0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0),
                    ],

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container( width:45, height: 48,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.all(Radius.circular(50))
                            ),
                            margin: EdgeInsets.only(left: 10,top: 5),
                            child: CircleAvatar( backgroundColor:orangeColors, radius: 50,
                                child: Icon( Icons.panorama_vertical_outlined,
                                  color: Colors.white, size: 25, )),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(top:.0),
                                  child: Text( items[index].name,style: TextStyle(
                                    fontFamily: 'Montserrat Regular',
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,

                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:2),
                                  child: Text("Use following code " +  items[index].code,style: TextStyle(
                                    fontFamily: 'Montserrat Regular',
                                    color: Colors.black,
                                    fontSize: 16,


                                  ),),
                                ),

                              ],
                            ),
                          )
                        ],

                      ),Row(
                        children: [
                          IconButton(
                              onPressed:(){

                              },
                              icon: Icon(Icons.chevron_right,color: orangeColors,)
                          ),


                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: items.length,

            ),
          ),

        ],
      ),



    );

  }


}