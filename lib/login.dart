import 'package:flutter/material.dart';

import 'constants.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("login page",style: Constants.regularHeading,),),
      
    );
  }
}