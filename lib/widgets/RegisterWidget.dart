import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Widget? child;
  final List<Widget>? children;

  const RegisterWidget(
      {Key? key, this.title, this.child, this.children, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Register'),
      ),
      body: Center(
        child: Column(children: [
          Text("Register page"),
          ElevatedButton(onPressed: onPressed, child: Text('go back'))
        ]),
      ),
    );
  }
}
