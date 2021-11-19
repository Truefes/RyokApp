import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class connection_auth extends StatefulWidget {
  @override
  _connection_auth createState() => _connection_auth();
}

class _connection_auth extends State<connection_auth> {
  FirebaseAuth auth = FirebaseAuth.instance; //firebase auth instance
  // FirebaseApp secondaryApp = Firebase.app('SecondaryApp'); //firebase instance in case of multiple apps
  // FirebaseAuth auth = FirebaseAuth.instanceFor(app: secondaryApp);

  late String name; // to initialize the variable later
  late String email;
  late String password;
  late String confirmPassword;
  late String error;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  //final _firestore = Firestore.instance;

  ///
  ///creates a new user then logs them in
  void signUp(String name, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // String reason = ((FirebaseAuthWeakPasswordException) task.getException()).getReason();
        print(
            'The password provided is too weak.'); //prepare message for user to see
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        print('The password is invalid or the user does not have a password.');
      } else if (e.code == 'user-not-found') {
        print(
            'There is no user record corresponding to this identifier. The user may have been deleted.');
      } else if (e.code == 'user-disabled') {
        print('The user account has been disabled by an administrator.');
      } else if (e.code == 'too-many-requests') {
        print(
            'Too many unsuccessful login attempts.  The user should receive an email allowing them to sign in.');
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
  }

  void verify() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  Widget build(BuildContext context) {
    //Events are fired when the following occurs:
    //Right after the listener has been registered.
    //When a user is signed in.
    //When the current user is signed out.
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
    );
  }
}
