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
    String _title; //null check for title !
    if (title == null) {
      _title = "Welcome"; //if title is null then set it to welcome
    } else {
      _title = title!;
    }

    return Container(
      child: Column(
        children: <Widget>[
          Text(_title),
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
              ElevatedButton(
                onPressed: statusOnPressed,
                child: Text("status"))
            ],
          ),
        ],
      ),
    );
  } //
}
