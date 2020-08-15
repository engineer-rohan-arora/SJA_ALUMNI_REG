

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sja_alumni_app/Frame_29.dart';


import 'bottom_navigation.dart';
import 'frame_3.dart';

void main() {
  runApp(MaterialApp(
  home: WelcomeScreen(),
  debugShowCheckedModeBanner: false,
  theme:ThemeData(primarySwatch: Colors.blue),
    routes: {
    "/login":(context)=>BottomNavigation(),
    },
  ));
}

class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds:1),
      vsync: this,
    );
    animation = ColorTween(begin:Colors.white, end: Colors.grey).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {
      });
      //print(controller.value);
    } );

    //animation= CurvedAnimation(parent: null, curve: null);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assests/logo.png'),
                    //height: 60,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TyperAnimatedTextKit(
                  text : ['MEMBERSHIP REGISTRATION'],
                  textStyle: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            sample(txt: 'Register Using Phone',onpresses: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>contact_details()));},),
            sample(txt: 'Register Using Email',onpresses: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactEmail()));},),
          ],
        ),
      ),
    );
  }
}
class sample extends StatelessWidget {

  sample({this.txt,@required this.onpresses});

  final String txt;
  final Function onpresses;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: MaterialButton(
          onPressed: onpresses,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),

          ),
        ),
      ),
    );
  }
}
