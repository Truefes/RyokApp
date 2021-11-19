import 'dart:ui';

import 'package:flutter/material.dart';

import 'menu_widget.dart';

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
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: new Image.asset(
                      'assets/images/0fe920d5c91b4d43ac729ce3f5be5262 (1).png'),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Forgotted Password!');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print("Successul Login.");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => menu_widget()),
                      );
                    },
                    color: Colors.deepPurple[800],
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Colors.black,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '''Don't have an account? ''',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Sign Up');
                      },
                      child: Text('Register Now'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
