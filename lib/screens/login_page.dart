import 'package:e_commerce_app/constans.dart';
import 'package:e_commerce_app/screens/home_page.dart';
import 'package:e_commerce_app/widgets/already_have_an_account_check.dart';
import 'package:e_commerce_app/widgets/background.dart';
import 'package:e_commerce_app/widgets/login_body.dart';
import 'package:e_commerce_app/widgets/rounded_button.dart';
import 'package:e_commerce_app/widgets/rounded_input_field.dart';
import 'package:e_commerce_app/widgets/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }

  // Create a new user account
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // Run the create account method
    String _loginFeedback = await _loginAccount();

    // If the string is not null, we got error while create account.
    if (_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  // Default Form Loading State
  bool _loginFormLoading = false;

  // Form Input Field Values
  String _loginEmail = "";
  String _loginPassword = "";

  // Focus Node for input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                Image.asset(
                  "assets/images/profile_image.png",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "Your Email",
                  onChanged: (value) {
                   _loginEmail = value;
                  },
                  onSubmitted: (value) {
                    _passwordFocusNode.requestFocus();
                  },
                  textInputAction: TextInputAction.next,
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    _loginPassword = value;
                  },
                  focusNode: _passwordFocusNode,
                  isPasswordField: true,
                  onSubmitted: (value) {
                    _submitForm();
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  onPressed: () {
                    _submitForm();
                  },
                  isLoading: _loginFormLoading,
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}

    // return Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //       width: double.infinity,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Container(
    //             padding: EdgeInsets.only(
    //               top: 24.0,
    //             ),
    //             child: Text(
    //               "Welcome User,\nLogin to your account",
    //               textAlign: TextAlign.center,
    //               style: Constants.boldHeading,
    //             ),
    //           ),
    //           Column(
    //             children: [
    //               CustomInput(
    //                 hintText: "Email...",
    //                 onChanged: (value) {
    //                   _loginEmail = value;
    //                 },
    //                 onSubmitted: (value) {
    //                   _passwordFocusNode.requestFocus();
    //                 },
    //                 textInputAction: TextInputAction.next,
    //               ),
    //               CustomInput(
    //                 hintText: "Password...",
    //                 onChanged: (value) {
    //                   _loginPassword = value;
    //                 },
    //                 focusNode: _passwordFocusNode,
    //                 isPasswordField: true,
    //                 onSubmitted: (value) {
    //                   _submitForm();
    //                 },
    //               ),
    //               CustomBtn(
    //                 text: "Login",
    //                 onPressed: () {
    //                   _submitForm();
    //                 },
    //                 isLoading: _loginFormLoading,
    //               )
    //             ],
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(
    //               bottom: 16.0,
    //             ),
    //             child: CustomBtn(
    //               text: "Create New Account",
    //               onPressed: () {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                       builder: (context) => RegisterPage()
    //                   ),
    //                 );
    //               },
    //               outlineBtn: true,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

