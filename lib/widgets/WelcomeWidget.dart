import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  final String? title;
  final VoidCallback? loginOnPressed;
  final VoidCallback? signupOnPressed;
  final VoidCallback? statusOnPressed;
  final Widget? child;
  final List<Widget>? children;
  const WelcomeWidget(
      {Key? key,
      this.title,
      this.child,
      this.children,
      this.loginOnPressed,
      this.signupOnPressed,
      this.statusOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            this.title ?? "WELCOME TO RYOK",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple[800],
              decoration: TextDecoration.underline,
            ),
          ),
          

          Column(
            children: [
              ElevatedButton(
                onPressed: loginOnPressed,
                child: Text("sign in"),
              ),
              ElevatedButton(
                onPressed: signupOnPressed,
                child: Text("sign up"),
              ),
              ElevatedButton(onPressed: statusOnPressed, child: Text("status"))
            ],
          ),
        ],
      ),
    );
  } //
}
