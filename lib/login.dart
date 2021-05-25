import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/USER/AndroidStudioProjects/flutter_app2/lib/register.dart';
import 'package:flutter_app2/widgets/custombutton.dart';
import 'package:flutter_app2/widgets/custominput.dart';




class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

   Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Close "),
                onPressed: () {
                  Navigator.pop(context);
              },
            )
          ],
      ) ;
    }
    ) ;
  }
    

   Future<String> _loginAccount() async {
     try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(email: _loginemail, password: _loginpassword) ;
       return null ; 
      } on FirebaseAuthException catch(e){
          if (e.code == 'weak-password') {
    return 'The password provided is too weak.';
  } else if (e.code == 'email-already-in-use') {
    return 'The account already exists for that email.' ;
   }     return e.message ; 

       } catch(e) {
         return e.toString() ;
       }

     
   }
     
     void _submitform() async{
       setState((){
         _loginformloading=true ;
       }) ;
       String _createaccountfeedback=await _loginAccount() ;
       if(_createaccountfeedback!=null) {
         _alertDialogBuilder(_createaccountfeedback) ;
           setState((){
         _loginformloading=false;
       }) ;
       } else {Navigator.pop(context) ; }

      

     } 
  bool _loginformloading=false ;
  String _loginemail= "" ; 
  String _loginpassword= "" ; 
  FocusNode _passwordFocusNode;

  void initState() {
    _passwordFocusNode= FocusNode() ;
    super.initState();
  }
   @override
  void dispose() {
    _passwordFocusNode.dispose() ;
    super.dispose();
  }


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
              child: Text("Welcome To FreeStyle",textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
            ),
     Column(
          children: [
                  Custominput(
                    hintText: "Email...",
                    onChanged: (value) {
                      _loginemail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),

                   Custominput(
                    hintText: "Password...",
                    onChanged: (value) {
                      _loginpassword = value;
                    },
                    focusNode: _passwordFocusNode,
                    ispassword: true,
                    onSubmitted: (value) {
                      _submitform();
                    },
                  ),
            custombutton(
              text: "login",
              onPressed: () {
                _submitform();
              },
              isloading: _loginformloading,
            )
          ],
     ),
      Padding(
        padding: const EdgeInsets.only(bottom:16),
        child: custombutton(
          text: "Createn New Account",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (Context)=>registerpage()
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