import 'package:flutter/material.dart';
import 'package:flutter_app2/constants.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("HomePage",style: Constants.regularHeading,),),
      
    );
  }
}