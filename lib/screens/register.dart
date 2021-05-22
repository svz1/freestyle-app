import 'package:flutter/material.dart';
import 'package:flutter_app2/widgets/custombutton.dart';
import 'package:flutter_app2/widgets/custominput.dart';



class registerpage extends StatefulWidget {
  @override
  _registerpageState createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
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
              child: Text("Create a New Account,",textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
            ),
     Column(
          children: [
            Custominput(hintText:"Email..",),
            Custominput(hintText: "Password...",),
            custombutton(
              text: "Create New Account",
              onPressed: () {
                print("login button clicked") ;
              },
            )
          ],
     ),
      Padding(
        padding: const EdgeInsets.only(bottom:16),
        child: custombutton(
          text: "Back to Login",
          onPressed: () { Navigator.pop(context) ;
               
            print("clicked the create account button") ;
          },
          
        ),
      ) ],
      ), 
      ),
      
      
    ),
    ) ; 
      
   
  }
}