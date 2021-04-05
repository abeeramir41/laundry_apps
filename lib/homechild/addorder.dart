import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:laundry_apps/utils/color.dart';
import 'package:laundry_apps/bnvscreens/home.dart';
import 'package:laundry_apps/model/product.dart';
import 'package:laundry_apps/screens/bnvmain.dart';

class AddOrder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddOrderState();
  }

}
class _AddOrderState extends State<AddOrder>{

  List<Product> items = [
    Product(
        image: 'assets/images/tshirt.png',
        name: 'T-Shirt',
        price: 2,
      qty: 0
    ),
    Product(
        image:
        'assets/images/coat.png',
        name: 'Coat',
        price: 2,
    qty: 0),
    Product(
        image:
        'assets/images/dress.png',
        name: 'Dress',
        price: 2,
    qty: 0),
    Product(
        image:
        'assets/images/sher.png',
        name: 'Sherwani',
        price: 2,
    qty: 0)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        elevation: 0,
            centerTitle: true,
        leading:  IconButton(icon: Icon(Icons.chevron_left,color: Colors.black,),onPressed: (){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>Bnvmain()));
        },),
        title: Text("Add Details",style: TextStyle(
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
                height: 60,
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
                        Image.asset(items[index].image ,width: 100,height: 100,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Text(items[index].name,style: TextStyle(
                                fontFamily: 'Montserrat Regular',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,

                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0,top: 2),
                              child: Text( items[index].price.toString() +" Rs"" ",style: TextStyle(
                                fontFamily: 'Montserrat Regular',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,

                              ),),
                            )
                          ],
                        )
                      ],

                    ),Row(
                      children: [
                        IconButton(
                            onPressed:(){
                              setState(() {

                               items[index].qty++;
                              });
                            },
                            icon: Icon(Icons.add_circle,color: orangeColors,)
                        ),
                        Text(  items[index].qty.toString(),style: TextStyle(
                          fontFamily: 'Montserrat Regular',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,

                        ),),


                        IconButton( onPressed: (){
                          setState(() {
                            if( items[index].qty <=0) {
                              items[index].qty=0;
                            }else {
                              items[index].qty--;
                            }
                          });

                        }, icon: Icon(Icons.indeterminate_check_box_rounded,color: orangeColors,)
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
        Container(

          width: double.infinity,
          height: 50,
          margin: EdgeInsets.only(left: 20,right: 20),

          child: RaisedButton(onPressed: (){},
          child: Text("Done",style: TextStyle(
            fontFamily: 'Montserrat Regular',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),),
            shape: StadiumBorder(),
            color: orangeColors,

          ),
        )
      ],
    ),



    );

  }



}