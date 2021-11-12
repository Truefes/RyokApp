import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  final String? title;
  final VoidCallback? onPressed;
  final Widget? child;
  final List<Widget>? children;
  final String? url;
  LoginWidget(
      {Key? key,
      this.url,
      this.title,
      this.child,
      this.children,
      this.onPressed})
      : super(key: key);

  @override
  _loginWidgetState createState() => _loginWidgetState();
}

class _loginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Login'),
      ),
      body: Center(
        child: Column(children: [
          Text('login page'),
          ElevatedButton(onPressed: widget.onPressed, child: Text('go back')),
          Image.network(widget.url ?? 'https://www.baidu.com/img/bd_logo1.png'),
        ]),
      ),
    );
  }
}
