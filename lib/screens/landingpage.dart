import 'package:flutter/material.dart' ;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app2/homepage.dart';
import 'package:flutter_app2/login.dart';





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
              if (snapshot.connectionState == ConnectionState.done) {

          // StreamBuilder can check the login state live
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              // If Stream Snapshot has error
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamSnapshot.error}"),
                  ),
                );
              }

              // Connection state active - Do the user login check inside the
              // if statement
              if(streamSnapshot.connectionState == ConnectionState.active) {

                // Get the user
                User _user = streamSnapshot.data;

                // If the user is null, we're not logged in
                if(_user == null) {
                  // user not logged in, head to login
                  return login();
                } else {
                  // The user is logged in, head to homepage
                  return homePage();
                }
              }

              // Checking the auth state - Loading
              return Scaffold(
                body: Center(
                  child: Text(
                    "Checking Authentication...",
                    
                  ),
                ),
              );
            },
          );
        }

        // Connecting to Firebase - Loading
        return Scaffold(
          body: Center(
            child: Text(
              "Initialization App...",
              
            ),
          ),
        );
      },
    );
  }
}