import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/constants.dart';
import 'package:flutter_app2/services/firebase_service.dart';
import 'package:flutter_app2/tabs/hometab.dart';
import 'package:flutter_app2/tabs/savedtab.dart';
import 'package:flutter_app2/tabs/searchtab.dart';
import 'package:flutter_app2/widgets/bottomtabs.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Firebaseservices _firebaseservices=Firebaseservices();
  PageController __tabspagecontroller ;
  int _selectedtab=0 ; 
   

  @override
  void initState() {
    print("UserID:${_firebaseservices.getUserId()}") ;
   __tabspagecontroller=PageController();
    super.initState();
  }
   
   @override
  void dispose() {
    __tabspagecontroller.dispose() ;
    super.dispose();
  }

  @override
   
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
                     child: PageView(
                       controller: __tabspagecontroller,
                       onPageChanged: (num)  { 
                         setState(() {
                           _selectedtab=num ; 
                         });

                       },
              children: [
              hometab(),
              searchtab(),
              savedtab(),

              


                ]
                  ),
          ),
           
          bottomtabs(
            selectedtab:_selectedtab,
            tabpressed: (num) {
              setState(() {
                           __tabspagecontroller.animateToPage(num, duration: Duration(microseconds:300 ), curve: Curves.easeOutCubic) ;
                         });

            },
          )
         
        ],
        
      ),

    );
  }
} 
