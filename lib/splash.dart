import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law_diary/welcome.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Welcome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xff2f3649),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
          ),
          Container(
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Rawalpindi Bar Associations',
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: Duration(milliseconds: 145)),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Image.asset(
              'assets/logo/Justice.png',
              // gaplessPlayback: true,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText("Lawyer's Diary ",
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Agne',
                    ),
                    speed: Duration(milliseconds: 40)),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          Container(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                    'Lawyers are the men who hire ${"\n"} out their words and anger ${"\n"}',
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Agne',
                    ),
                    speed: Duration(milliseconds: 60)),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     AnimatedTextKit(animatedTexts: [
          //       RotateAnimatedText('AWESOME', textStyle: colorizeTextStyle),
          //       RotateAnimatedText('OPTIMISTIC'),
          //       RotateAnimatedText('DIFFERENT'),
          //     ]),
          //   ],
          // )
          // Adobe XD layer: 'Rectangle 9 copy' (shape)
        ],
      ),
    ));
    // Image.asset(
    //   'logo/splash.gif',
    //   // gaplessPlayback: true,
    //   fit: BoxFit.cover,
    // ),
  }
}
