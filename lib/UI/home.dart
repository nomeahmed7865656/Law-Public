import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'common_widgets.dart';

BuildContext _context;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

bool check = false;
int currentIndex = 0;

@override
class _HomeState extends State<Home> {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo('Dubai Mall Food Court', Color(0xff6DC8F3), Color(0xff2f3649),
        4.4, 'Dubai · In The Dubai Mall', 'Cosy · Casual · Good for kids'),
    PlaceInfo('Hamriyah Food Court', Color(0xffFFB157), Color(0xff2f3649), 3.7,
        'Sharjah', 'All you can eat · Casual · Groups'),
    PlaceInfo('Gate of Food Court', Color(0xffFF5B95), Color(0xff2f3649), 5,
        'Dubai · Near Dubai Aquarium', 'Casual · Groups'),
    PlaceInfo('Express Food Court', Color(0xffD76EF5), Color(0xff2f3649), 4.1,
        'Dubai', 'Casual · Good for kids · Delivery'),
    PlaceInfo('BurJuman Food Court', Color(0xff42E695), Color(0xff2f3649), 4.2,
        'Dubai · In BurJuman', '...'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff999999),
        drawerDragStartBehavior: DragStartBehavior.down,
        endDrawer: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Drawer(
            child: Container(
              color: Color(0xff2f3649),
              child: ListView(
                dragStartBehavior: DragStartBehavior.start,
                // padding: EdgeInsets.zero,
                children: <Widget>[
                  Divider(
                    color: Colors.white,
                  ),
                  // SwitchListTile(
                  //     title: const Text(
                  //       'Theme Mode',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     value: check,
                  //     onChanged: (ww) {
                  //       // setState(() {
                  //       //   check = ww;
                  //       //   if (check)
                  //       //     isLightTheme.add(false);
                  //       //   else
                  //       //     isLightTheme.add(true);
                  //       // });
                  //       //isLightTheme.add(false);
                  //     }),
                  // Divider(color: Color(0xffFAAC05),),
                  // ListTile(title: Text('HISTORY',style: TextStyle(),),trailing: Icon(Icons.history,),),
                  // Divider(color: Color(0xffFAAC05),),
                  // Divider(
                  //   color: Colors.white,
                  // ),
                  ListTile(
                    title: Text(
                      'PLAYLISTS',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.featured_play_list_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Playlist()));
                    },
                  ),
                  // Divider(color: Color(0xffFAAC05)),
                  // ListTile(title: Text('NOTIFICATIONS',style: TextStyle(),),trailing: Icon(Icons.notifications_active,),),
                  // Divider(color: Color(0xffFAAC05)),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    title: Text(
                      'SETTINGS',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff2f3649),
          title: Text("Lawer's Diary"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          padding: EdgeInsets.only(bottom: 80),
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_borderRadius),
                        gradient: LinearGradient(
                            colors: [
                              items[index].startColor,
                              items[index].endColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: items[index].endColor,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: CustomPaint(
                        size: Size(100, 150),
                        painter: CustomCardShapePainter(_borderRadius,
                            items[index].startColor, items[index].endColor),
                      ),
                    ),
                    Positioned.fill(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              'assets/logo/icon.png',
                              height: 64,
                              width: 64,
                            ),
                            flex: 2,
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  items[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  items[index].category,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                  ),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        items[index].location,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Avenir',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  items[index].rating.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Avenir',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                RatingBar(rating: items[index].rating),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String category;
  final String location;
  final double rating;
  final Color startColor;
  final Color endColor;

  PlaceInfo(this.name, this.startColor, this.endColor, this.rating,
      this.location, this.category);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
