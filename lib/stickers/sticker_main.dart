import 'package:flutter/material.dart';
import 'package:law_diary/stickers/sticker_list.dart';

class Stickers extends StatelessWidget {
  final String title = 'Trendy WhatsApp Stickers';

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   AdmobAd.initialize();
  //   AdmobAd.showBannerAd();
  // }
  // @override
  // void dispose() {
  //   AdmobAd.hideBannerAd();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // List<Widget> fakeBottomButtons = new List<Widget>();
    // fakeBottomButtons.add(
    //   Container(
    //     height: 50.0,
    //   ),
    // );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff999999),
        appBar: AppBar(
          backgroundColor: Color(0xff2f3649),
          title: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/logo/face.png',
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 5,
                  child: Text(
                    'Trending Stickers',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  )),
            ],
          ),
          // backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Container(
            //color: Theme.of(context).backgroundColor.withOpacity(0.3),
            height: MediaQuery.of(context).size.height / 1.07,
            child: StaticContent()),
        // drawer: Drawer(
        //   child: MyDrawer(),
        // ),
        //persistentFooterButtons: fakeBottomButtons,
      ),
    );
  }
}
