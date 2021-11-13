import 'package:flutter/material.dart';
import 'package:ryok_application/widgets/status_widget.dart';
import 'widgets/importAll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ryok Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'RyokApp'),
      initialRoute: '/',
      routes: {
        '/home': (context) => WelcomeWidget(),
        // '/home': (context) => home_widget(),
        '/login': (context) => LoginWidget(
              onPressed: () {
                Navigator.pop(context);
              },
              title: 'Login page',
              url: 'https://picsum.photos/250?image=9',
            ),
        '/register': (context) => RegisterWidget(onPressed: () {
              Navigator.pop(context);
            }),
        '/status': (context) => status_widget(onPressed: (){Navigator.pop(context);},),

        // '/forgot_password': (context) => forgot_password_widget(),
        // '/reset_password': (context) => reset_password_widget(),
        // '/profile': (context) => profile_widget(),
        // '/settings': (context) => settings_widget(),
        // '/about': (context) => about_widget(),
        // '/contact': (context) => contact_widget(),
        // '/privacy_policy': (context) => privacy_policy_widget(),
        // '/terms_and_conditions': (context) => terms_and_conditions_widget(),
        // '/help': (context) => help_widget(),
        // '/home_page': (context) => home_page_widget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WelcomeWidget(
              title: 'Welcome to Ryok App ',
              loginOnPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              signupOnPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              statusOnPressed: (){
                Navigator.pushNamed(context,'/status');
              },
            ),
          ],
        ),
      ),
    );
  }
}