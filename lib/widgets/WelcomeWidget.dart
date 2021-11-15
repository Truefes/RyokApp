import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  final String? title; //? =>  nullable => can be null
  final String? AssetImageLocation;
  final String? signinText;
  final String? signupText;
  final VoidCallback? loginOnPressed;
  final VoidCallback? signupOnPressed;
  // final VoidCallback? statusOnPressed; for debugging has to be added to constuctor parameters
  final Widget? child;
  final List<Widget>? children;
  const WelcomeWidget(
      {Key? key,
      this.title,
      this.AssetImageLocation,
      this.signinText,
      this.signupText,
      this.child,
      this.children,
      this.loginOnPressed,
      this.signupOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            this.title ??
                "WELCOME TO RYOK", // ?? => if parameter value is null then use this value
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple[800],
              decoration: TextDecoration.underline,
            ),
          ),
          Image(
            image: AssetImage(this.AssetImageLocation ??
                'assets/images/welcome_page/profile.png'),
          ),
          SizedBox(height: 100), //space between image and buttons
          Column(
            children: [
              ElevatedButton(
                onPressed: loginOnPressed,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                ),
                child: Text(
                  this.signinText ?? "Login",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal, //FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: signupOnPressed,
                child: Text(
                  this.signupText ?? "Register", //Register might be clearer
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal, //FontWeight.w400,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(Size(250, 50)),
                ),
              ),
              // ElevatedButton(onPressed: statusOnPressed, child: Text("status")),
            ],
          ),
        ],
      ),
    );
  } //
}
