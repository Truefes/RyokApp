import 'package:flutter/material.dart';
import 'package:ryok_application/widgets/status_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widgets/importAll.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //required for firebase to work
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        '/status': (context) => status_widget(
              onPressed: () {
                Navigator.pop(context);
              },
            ),

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
  final Future<FirebaseApp> _initialization =
      Firebase.initializeApp(); //required for firebase to work

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
            //future builder to wait for firebase to initialize
            FutureBuilder<FirebaseApp>(
              future: _initialization,
              builder: (context, snapshot) {
                // return some feedback when firebase is initializing
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    'Ready to go!',
                    style: Theme.of(context).textTheme.headline4,
                  );
                  
                } else {
                  // return some feedback when firebase is not initialized
                  return const CircularProgressIndicator();//may also indicate failed initialization
                }
              },
            ),
            WelcomeWidget(
              title: 'Welcome to Ryok App ',

              loginOnPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              signupOnPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              // statusOnPressed: () {
              //   Navigator.pushNamed(context, '/status');
              // },
            ),
          ],
        ),
      ),
    );
  }
}
