import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(home: LandingPage(),
       
     );
   }
 }



class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization =Firebase.initializeApp() ; 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:_initialization,
      builder:(context,snapshot) {
        if(snapshot.hasError) {
          return Scaffold(body: Center(child:Text("error: ${snapshot.error}"),
          ),
          ); 

        }
        if(snapshot.connectionState==ConnectionState.done) {
          return Scaffold(
            body:Container(
              child: Center(
                child: Text("Firebase App Initialised"),
          ),
          ),
          );
        }       


        
          return Scaffold(body:
          Container(child: Center(child: Text("initialising app"),
          ),
          ),
          );
      }
      
      
    );
  }
}