import 'package:e_commerce_app/constans.dart';
import 'package:e_commerce_app/screens/home_page.dart';
import 'package:e_commerce_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initilization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
              body: Center(
            child: Text("Error:${snapshot.error}"),
          ));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return
          //StreamBuilder can check the login state live
            StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder:(context,StreamSnapshot){
                  if (snapshot.hasError) {
                    return Scaffold(
                        body: Center(
                          child: Text("Error:${StreamSnapshot.error}"),
                        )
                    );
                  }

                  //Connection state active do the user login check inside the if statement

                  if(StreamSnapshot.connectionState == ConnectionState.active)
                    {
                     //Get the user
                      User _user = StreamSnapshot.data;

                      //If the user is null we're not logged in
                      if(_user == null){
                        return LoginPage();
                      }
                      else{
                        return HomePage();
                      }

                    }
                //Checking the auth state loading
                  return Scaffold(
                    body: Center(
                      child: Text("Checking Authentication....",
                        style: Constants.regularHeading,
                      ),

                    ),
                  );
                }
            );
        }
        return Scaffold(
          body: Center(
            child: Text("Initializing APP....",
              style: Constants.regularHeading,
            ),

          ),
        );
      },
    );
  }
}
