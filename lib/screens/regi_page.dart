import 'package:laundry_apps/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry_apps/utils/color.dart';
import 'package:laundry_apps/widgets/btn_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laundry_apps/services/auth_service.dart';


class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  AuthService _authService = AuthService();
  final fullnameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  Widget build(BuildContext context) {
    int group=1;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/topheader.png'),fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: <Widget>[


            Image.asset('assets/images/col.png',width:MediaQuery.of(context).size.width*0.75,height: MediaQuery.of(context).size.height*0.29,),



            Expanded(

              child: Container(
                decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60) )
                ),


                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[

                    Container(

                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20,top: 50),
                      child: Text('Get Started',style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                        color: orangeColors
                      ),),
                    ),

                    _textInput(hint: "Fullname" , icon: Icons.person),
                    _textEmailInput(hint: "Email", icon: Icons.email),
                    _textPassInput(hint: "Password", icon: Icons.vpn_key),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child:Radio(
                                  activeColor:  orangeColors,
                                  value: 0,
                                  groupValue: group,
                                  onChanged: (value) {
                                    setState(() {
                                      group = value;
                                    });
                                  },

                                ),
                              ), RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "I agree to the ",
                                      style: TextStyle(color: Colors.black,fontSize: 12)),
                                  TextSpan(
                                      text: "Terms of Services ",
                                      style: TextStyle(color: orangeColors,fontSize: 12)),
                                  TextSpan(
                                      text: "and  ",
                                      style: TextStyle(color: Colors.black,fontSize: 12)),
                                  TextSpan(
                                      text: "Privacy Policy",
                                      style: TextStyle(color: orangeColors,fontSize: 12)),

                                ]
                                ),
                              ),
                            ],
                          ) ,



                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Text("Sign Up",style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                                color: orangeColors
                            ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            alignment: Alignment.centerRight,
                            child: ButtonWidget(
                              onClick: () {
                                if(fullnameController.text.length < 4 && fullnameController.text.isEmpty){
                                  Fluttertoast.showToast(msg: "please enter your full name");
                                }if(passwordController.text.length<6){
                                  Fluttertoast.showToast(msg: "password must be 6 character long");

                                }if(!emailController.text.contains("@")){
                                  Fluttertoast.showToast(msg: "please enter correct email");

                                }else if (emailController.text.contains("@")){
                                  registerUser(context);
                                  fullnameController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                  Fluttertoast.showToast(msg: "User Successfully Created");
                                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage()));

                                }


                              },
                              btnText: "LOGIN",
                            ),

                          ),

                        ],
                      ),

                    ),InkWell(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 30,top: 10),
                        child: Text('Sign In',style:TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                            color: orangeColors
                        ),
                        ),
                      ),onTap: (){
                      onTap: Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _textInput({controller, hint, icon}) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(left: 20,right: 20),
        child: TextFormField(
          controller: fullnameController,
          decoration: InputDecoration(

            hintText: hint , hintStyle: TextStyle(
            fontSize: 15,

          ),
            prefixIcon: Icon(icon,size: 18,),
          ),
        )
    );
  }
  Widget _textEmailInput({controller, hint, icon}) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(left: 20,right: 20),
        child: TextFormField(
          controller: emailController,
          decoration: InputDecoration(

            hintText: hint , hintStyle: TextStyle(
            fontSize: 15,

          ),
            prefixIcon: Icon(icon,size: 18,),
          ),
        )
    );
  }
  Widget _textPassInput({controller, hint, icon}) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(left: 20,right: 20),
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(

            hintText: hint , hintStyle: TextStyle(
            fontSize: 15,

          ),
            prefixIcon: Icon(icon,size: 18,),
          ),
        )
    );
  }

  void registerUser(BuildContext context) async{

    _authService
        .createPerson(
        fullnameController.text,
        emailController.text,
        passwordController.text)
        .then((value) {
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage()));
    });



  }

}
