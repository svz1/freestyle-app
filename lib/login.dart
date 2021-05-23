import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/register.dart';
import 'package:flutter_app2/widgets/custombutton.dart';
import 'package:flutter_app2/widgets/custominput.dart';




class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: 
    
      SafeArea(
        child:Container(
          width: double.infinity,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[ 
            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,0),
              child: Text("Welcome User,\n Login To your Account",textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
            ),
     Column(
          children: [
            Custominput(hintText:"Email..",),
            Custominput(hintText: "Password...",),
            custombutton(
              text: "login",
              onPressed: () {
               
              },
            )
          ],
     ),
      Padding(
        padding: const EdgeInsets.only(bottom:16),
        child: custombutton(
          text: "Createn New Account",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (Context)=>RegisterPage()
                )
                ) ;
          },
          
        ),
      ) ],
      ), 
      ),
      
      
    ),
    ) ; 
  }
}