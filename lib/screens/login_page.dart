import 'package:laundry_apps/screens/bnvmain.dart';
import 'package:flutter/material.dart';
import 'package:laundry_apps/screens/regi_page.dart';
import 'package:laundry_apps/utils/color.dart';
import 'package:laundry_apps/widgets/btn_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laundry_apps/services/auth_service.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthService _authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  int group = 1 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/topheader.png'), fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/col.png',width:  MediaQuery.of(context).size.width*0.75,height: MediaQuery.of(context).size.height*0.29,),


              Expanded(


                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 20, top: 50),
                        child: Text('Welcome Back', style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                            color:   orangeColors
                        ),),
                      ),
                      _textEmailInput(hint: "Email", icon: Icons.email),
                      _textPassInput(hint: "Password", icon: Icons.vpn_key),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Radio(
                                    activeColor:  orangeColors,
                                    value: 0,
                                    groupValue: group,
                                    onChanged: (value) {
                                      setState(() {
                                        group = value;
                                      });
                                    },

                                  ),
                                ), Text("Remeber Me"),
                              ],
                            ),


                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "Forgot Password?",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[ InkWell(
                            child: Container(
                                margin: EdgeInsets.only(left: 30),
                                child: Text("Sign In", style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand',
                                    color: orangeColors
                                ),),
                              ),
                            onTap: (){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Bnvmain()
                                  ));
                            },
                          ),

                            Container(
                              margin: EdgeInsets.only(right: 15),
                              alignment: Alignment.centerRight,
                              child: ButtonWidget(
                                onClick: () {
                                  if (passwordController.text.length < 6) {
                                    Fluttertoast.showToast(
                                        msg: "password must be 6 character long");
                                  }
                                  if (!emailController.text.contains("@") && emailController.text.isEmpty) {
                                    Fluttertoast.showToast(msg: "please enter correct email");
                                  } else
                                  if (emailController.text.contains("@")) {
                                    signIn(context);
                                    emailController.clear();
                                    passwordController.clear();


                                  }

                                },
                                btnText: "LOGIN",
                              ),

                            ),

                          ],
                        ),

                      ), InkWell(child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 30, top: 10),
                        child: Text('Sign Up', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                            color: orangeColors
                        ),),
                      ),
                        onTap: () {
                          onTap:
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => RegPage()));
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textEmailInput({controller, hint, icon}) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          controller: emailController,
          decoration: InputDecoration(

            hintText: hint, hintStyle: TextStyle(
            fontSize: 15,

          ),
            prefixIcon: Icon(icon, size: 18,),
          ),
        )
    );
  }

  Widget _textPassInput({controller, hint, icon}) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(

            hintText: hint, hintStyle: TextStyle(
            fontSize: 15,

          ),
            prefixIcon: Icon(icon, size: 18,),
          ),
        )
    );
  }


  void signIn(BuildContext context) async {

    _authService
        .signIn(
        emailController.text, passwordController.text)
        .then((value) {
      if(value!=null) {
Center(child: CircularProgressIndicator());
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Bnvmain()
            ));
      }
    });

  }

}

