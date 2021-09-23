import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation.dart';

class Welcome extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f3649),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: MyStatefulWidget()),
          //Expanded(flex: 1, child: myStatefulWidget()),
        ],
      ),
    );
  }

  Widget Build(BuildContext context) {
    throw UnimplementedError();
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController __controller;

  initState() {
    super.initState();
    __controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: __controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // __controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        __controller.forward();
      }
    });
    __controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    __controller.dispose();
  }

  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverFadeTransition(
        opacity: animation,
        sliver: SliverFixedExtentList(
          itemExtent: 1000,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SizedBox(height: 0),
                    // SizedBox(height: 70),
                    Text(
                      "LEGAL ADVISOR",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    // Container(
                    //   child: AnimatedTextKit(
                    //     animatedTexts: [
                    //       WavyAnimatedText('LEGAL ADVISOR',
                    //           textStyle: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 30),
                    //           speed: Duration(milliseconds: 160)),
                    //     ],
                    //     isRepeatingAnimation: false,
                    //   ),
                    // ),
                    SizedBox(height: 40),
                    Image.asset(
                      'assets/logo/images2.png',
                      // gaplessPlayback: true,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('Make Efforts For Justice',
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Agne',
                              ),
                              speed: Duration(milliseconds: 100)),
                        ],
                        isRepeatingAnimation: false,
                      ),
                    ),

                    SizedBox(height: 40),
                    AvatarGlow(
                      startDelay: Duration(milliseconds: 500),
                      glowColor: Colors.white,
                      endRadius: 95.0,
                      duration: Duration(milliseconds: 1000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: Duration(milliseconds: 5),
                      child: RaisedButton(
                        //     disabledColor: Colors.red,
                        // disabledTextColor: Colors.black,
                        padding: const EdgeInsets.all(20),
                        textColor: Color(0xff2f3649),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Navigation()));
                        },
                        child: Text('WELCOME'),
                      ),
                      // RaisedButton(
                      //   // color: Colors.black,
                      //   onPressed: () {
                      //     Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => Navigation()));
                      //   },
                      //   child: Container(
                      //     decoration: const BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(20)),
                      //       gradient: LinearGradient(
                      //         colors: <Color>[
                      //           Colors.grey,
                      //           Color(0xffEDEDED),
                      //           Colors.grey,
                      //           Color(0xffEDEDED),
                      //           Colors.grey,
                      //         ],
                      //       ),
                      //     ),
                      //     padding: const EdgeInsets.all(10.0),
                      //     child: const Text('WELCOME',
                      //         style: TextStyle(
                      //           fontSize: 20,
                      //           color: Colors.black,
                      //         ),
                      //         textAlign: TextAlign.center),
                      //   ),
                      // ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                    // SizedBox(height: 40),
                    // Text(
                    //   "LEGAL ADVISOR",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 40),
                    // ),
                    // Adobe XD layer: 'Rectangle 9 copy' (shape)
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(50.0),
                    //     color: const Color(0xff2f3649),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: const Color(0x4d000000),
                    //         offset: Offset(-1.8369701465288538e-16, 3),
                    //         blurRadius: 7,
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ),
    ]);
  }
}

// class myStatefulWidget extends StatefulWidget {
//   myStatefulWidget({Key key}) : super(key: key);
//   @override
//   _myStatefulWidgetState createState() => _myStatefulWidgetState();
// }
//
// class _myStatefulWidgetState extends State<myStatefulWidget>
//     with TickerProviderStateMixin {
//   AnimationController _controller;
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     )..forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double smallLogo = 100;
//     final double bigLogo = 200;
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final Size biggest = constraints.biggest;
//         return Stack(
//           children: [
//             PositionedTransition(
//               rect: RelativeRectTween(
//                 begin: RelativeRect.fromSize(
//                     Rect.fromLTWH(0, 0, smallLogo, smallLogo), biggest),
//                 end: RelativeRect.fromSize(
//                     Rect.fromLTWH(biggest.width - bigLogo,
//                         biggest.height - bigLogo, bigLogo, bigLogo),
//                     biggest),
//               ).animate(CurvedAnimation(
//                 parent: _controller,
//                 curve: Curves.elasticInOut,
//               )),
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: RaisedButton(
//                   color: Colors.grey,
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => Navigation()));
//                   },
//                   padding: const EdgeInsets.all(0.0),
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       gradient: LinearGradient(
//                         colors: <Color>[
//                           Color(0xff966703),
//                           Color(0xFFE19A04),
//                           Color(0xFF966703),
//                           Color(0xFFE19A04),
//                           Color(0xFF966703),
//                         ],
//                       ),
//                     ),
//                     padding: const EdgeInsets.all(10.0),
//                     child: const Text('WELCOME',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.black,
//                         ),
//                         textAlign: TextAlign.center),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
