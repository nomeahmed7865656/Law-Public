import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law_diary/stickers/sticker_main.dart';

import 'UI/home.dart';
import 'adddata.dart';

BuildContext _context;

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 1;

  final List<Widget> _Children = [
    Stickers(),
    Home(),
    Add_data(),
  ];

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.transparent,
                width: size.width,
                height: size.height,
                margin: EdgeInsets.only(bottom: 0),
                child: _Children[currentIndex],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: 120,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: CustomPaint(
                        size: Size(size.width, 80),
                        painter: BNBCustomPainter(),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: size.width,
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // width: 50,
                            height: 35,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 0
                                    ? Colors.white
                                    : Color(0xff2f3649),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            margin: EdgeInsets.only(top: 65),
                            child: IconButton(
                                icon: Image.asset(
                                  "assets/logo/face.png",
                                  color: currentIndex == 0
                                      ? Color(0xff2f3649)
                                      : Colors.white,
                                ),
                                onPressed: () {
                                  // setBottomBarIndex(1);
                                  setState(() {
                                    currentIndex = 0;
                                  });
                                }),
                          ),
                          Container(
                            // width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 1
                                    ? Colors.white
                                    : Color(0xff2f3649),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            margin: EdgeInsets.only(bottom: 20),
                            child: IconButton(
                              icon: Icon(
                                Icons.home,
                                color: currentIndex == 1
                                    ? Color(0xff2f3649)
                                    : Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  currentIndex = 1;
                                });
                              },
                            ),
                          ),
                          Container(
                            // width: 30,
                            height: 35,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 2
                                    ? Colors.white
                                    : Color(0xff2f3649),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            margin: EdgeInsets.only(top: 65),
                            child: IconButton(
                                padding: EdgeInsets.only(bottom: 0),
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: currentIndex == 2
                                      ? Color(0xff2f3649)
                                      : Colors.white,
                                ),
                                onPressed: () {
                                  // setBottomBarIndex(3);
                                  setState(() {
                                    currentIndex = 2;
                                  });
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff2f3649)
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, -25); // Start
    path.quadraticBezierTo(size.width * 0.10, 0, size.width * 0.4, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.50, 0);
    path.arcToPoint(Offset(size.width * 0.50, 0),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0, 0, size.width * 0.50, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
