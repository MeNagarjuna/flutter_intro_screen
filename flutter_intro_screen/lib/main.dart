import 'package:flutter/material.dart';
import 'package:flutter_intro_screen/welcome_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Intro Screen Demo'),
      routes: <String, WidgetBuilder>{
        //app routes
        '/welcomescreen': (BuildContext context) => new WelcomeScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageDecoration = PageDecoration(
    titleTextStyle:
        PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/images/image1.png"),
        title: "Language",
        body: "This is first screen",
        footer: Text(
          "Welcome screen one",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("assets/images/image2.png"),
        title: "C Language",
        body: "This is Sceond screen",
        footer: Text(
          "Welcome screen Two",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("assets/images/image3.jpeg"),
        title: "Mango Language",
        body: "This is Third screen",
        footer: Text(
          "Welcome screen third",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("assets/images/image4.png"),
        title: "Java Language",
        body: "This is forth screen",
        footer: RaisedButton(
          onPressed: () {
            newScreen();
          },
          child: Text(
            "Lets ' go !!!",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.blue,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        decoration: pageDecoration,
      ),
    ];
  }

  newScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(
          title: "Welcome Screen",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scaffold(
        body: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          dotsDecorator: DotsDecorator(
              shape: RoundedRectangleBorder(), activeColor: Colors.blue),
          pages: getPages(),
          done: Text(
            "Done",
            style: TextStyle(color: Colors.blue),
          ),
          showSkipButton: true,
          skip: Text("Skip", style: TextStyle(color: Colors.blue)),
          onDone: () {
            // Here Navigate to your main screen.
            newScreen();
          },
        ),
      ),
    );
  }
}
