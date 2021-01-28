import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'e-Shopping',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.orange,
        ),
        home: SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Welcome to Flutter Firestore eCommerce by Mehnaz.",
          style: TextStyle(color: Colors.deepOrange, fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//         home:LandingPage(),
//
//     );
//   }
//
// }
//
// class LandingPage extends StatelessWidget{
//   final Future<FirebaseApp>_initilization = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initilization,
//       builder:(context,snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//               body: Center(
//                 child: Text("Error:${snapshot.error}"),
//
//               )
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Scaffold(
//             body: Container(
//               child: Center(
//                 child: Text("FireBase APP Initialized"),
//               ),
//             ),
//           );
//         }
//          return Scaffold(
//            body: Center(
//             child: Text("Initializing APP...."),
//           ),
//         );
//
//       },
//     );
//   }
//
// }
//
