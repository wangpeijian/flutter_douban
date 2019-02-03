import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/component/home/BottomNav.dart';
import 'package:flutter_app_demo1/pages/Home/Hot.dart';
import 'package:flutter_app_demo1/pages/Home/Search.dart';
import 'package:flutter_app_demo1/pages/Home/Soon.dart';
import 'package:flutter_app_demo1/pages/Home/Top.dart';
import 'package:flutter_app_demo1/utils/ConstantString.dart';
//import 'package:fluwx/fluwx.dart' as fluwx;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeWidgetState createState() => new _HomeWidgetState();
}

class _HomeWidgetState extends State<Home> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    Soon(),
    HotPage(),
    TopPage(),
    SearchPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
//    fluwx.register(appId: "wxd930ea5d5a258f4f");

//    Future<void> _neverSatisfied() async {
//      return showDialog<void>(
//        context: context,
//        barrierDismissible: false, // user must tap button!
//        builder: (BuildContext context) {
//          return AlertDialog(
//            title: Text('Rewind and remember'),
//            content: SingleChildScrollView(
//              child: ListBody(
//                children: <Widget>[
//                  Text('You will never be satisfied.'),
//                  Text('You\’re like me. I’m never satisfied.'),
//                ],
//              ),
//            ),
//            actions: <Widget>[
//              FlatButton(
//                child: Text('Regret'),
//                onPressed: () {
//                  Navigator.of(context).pop();
//                },
//              ),
//            ],
//          );
//        },
//      );
//    }

    return Scaffold(
//        drawer: new Drawer(
//            semanticLabel: "哈哈哈",
//            child: new ListView(
//              itemExtent: 60.0,
//              padding: EdgeInsets.only(),
//              children: <Widget>[
//                new RaisedButton(
//                  color: Colors.white70,
//                  shape: new RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(30.0)),
//                  onPressed: () {
//                    _neverSatisfied();
//                  },
//                  child: new Text('dialog弹出'),
//                ),
//              ],
//            )),
        appBar: new AppBar(
          title: new Text(ConstantString.home_title),
//          backgroundColor: ConstantColors.app_bar_background,
//          leading: new IconButton(
//            icon: new Icon(Icons.menu),
//            tooltip: '菜单提示',
//            onPressed: null,
//          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.share),
              onPressed: null,
            ),
          ],
        ),
        body: new Container(
          child: _widgetOptions[_selectedIndex],
          alignment: Alignment.center,
        ),
//        floatingActionButton: new FloatingActionButton(
//          tooltip: 'Add',
//          child: new Icon(Icons.add),
//          onPressed: () {
//            Navigator.push(
//              context,
//              new MaterialPageRoute(builder: (context) => new Two()),
//            );
//          },
//        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: ConstantColors.app_theme_color,
          items: BottomNav.items,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
