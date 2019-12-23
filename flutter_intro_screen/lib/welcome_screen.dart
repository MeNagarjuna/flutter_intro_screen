import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text(this.widget.title)),
      ),
      body: DoubleBackToCloseApp(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
            body: Center(
              child: Text(
                "WELCOME SCREEN",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
      ),
    );
  }
}
