import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:laundry_apps/utils/color.dart';
import 'package:laundry_apps/bnvscreens/home.dart';
import 'package:laundry_apps/model/orderdetails.dart';
import 'package:laundry_apps/screens/bnvmain.dart';
import 'package:intl/intl.dart';

class Order extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrderState();
  }

}
class _OrderState extends State<Order>{

  List<OrderDeatils> items = [
    OrderDeatils(
      orderNo: 1,
      status: "Processing",
      Placeddate: DateTime.now(),

    ),
    OrderDeatils(
      orderNo: 2,
      status: "Processing",
      Placeddate: DateTime.now(),

    ),
    OrderDeatils(
      orderNo: 3,
      status: "Processing",
      Placeddate: DateTime.now(),

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

          title: Text("Order",style: TextStyle(
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
                  height: MediaQuery.of(context).size.height*0.12,
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
                                  child: Icon( Icons.event_note_rounded,
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
                                child: Text("Order No. : " +  items[index].orderNo.toString(),style: TextStyle(
                                  fontFamily: 'Montserrat Regular',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,

                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:2),
                                child: Text("Order Status : " +  items[index].status,style: TextStyle(
                                  fontFamily: 'Montserrat Regular',
                                  color: Colors.black,
                                  fontSize: 16,


                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0,top: 2),
                                child: Text( "Order Placed : " + DateFormat.yMMMd().format(items[index].Placeddate),style: TextStyle(
                                  fontFamily: 'Montserrat Regular',
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,

                                ),),
                              )
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