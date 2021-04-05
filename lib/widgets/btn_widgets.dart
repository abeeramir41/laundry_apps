import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../utils/color.dart';

class ButtonWidget extends StatelessWidget {
  var btnText ="";
  var onClick;


  ButtonWidget({this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(150)),
          color: orangeColors
        ),
        alignment: Alignment.center,
        child: Icon(Icons.arrow_forward_outlined,size: 30,color: Colors.white,),

      ),
    );
  }
}
