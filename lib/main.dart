import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app2/screens/landingpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       
       debugShowCheckedModeBanner: false,
       theme:ThemeData(
         accentColor:Colors.orange[800]

        ),
        
      
       
       home: LandingPage(),
       
     );
   }
 }



