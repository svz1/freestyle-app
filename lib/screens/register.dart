import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/widgets/custombutton.dart';
import 'package:flutter_app2/widgets/custominput.dart';



class registerpage extends StatefulWidget {
 
  @override
  _registerpageState createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
    Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text("error"),
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
    
   Future<String> _createaccount() async {
     try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _registeremail, password: _registerpassword) ;
       return null ; }
       on FirebaseAuthException catch(e){
          if (e.code == 'weak-password') {
    return 'The password provided is too weak.';
  } else if (e.code == 'email-already-in-use') {
    return 'The account already exists for that email.' ;
   }     return e.message ; 

       } catch(e) {
         return e.toString ;
       }

     
   }
     void _submitform() async{
       setState((){
         _registerformloading=true ;
       }) ;
       String _createaccountfeedback=await _createaccount() ;
       if(_createaccountfeedback!=null) {
         _alertDialogBuilder(_createaccountfeedback) ;
           setState((){
         _registerformloading=false;
       }) ;
       } else{
         Navigator.pop(context);
       }

      

     } 
  bool _registerformloading=false ;
  String _registeremail= "" ; 
  String _registerpassword= "" ; 
  FocusNode _passwordFocusNode;
  @override
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
              child: Text("Create a New Account,",textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: Colors.white),),
            ),
     Column(
          children: [
            Custominput(hintText:"Email..",
            onChanged: (value) {
              _registeremail=value ; 
            },
            onSubmitted: (value) {
              _passwordFocusNode.requestFocus() ; 
            },
            ),
            Custominput(hintText: "Password...",
             onChanged: (value) {
              _registerpassword=value ;},
               focusNode: _passwordFocusNode,
               ispassword: true,
               onSubmitted: (value) { 
                 _submitform() ;
               }, ),
            custombutton(
              text: "Create New Account",
              onPressed: () {
                _submitform() ;
               
               
              },
              isloading: _registerformloading,
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