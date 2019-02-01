import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/component/home/BottomNav.dart';
import 'package:flutter_app_demo1/pages/Home/Hot.dart';
import 'package:flutter_app_demo1/utils/ConstantString.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Index();
  }
}

class Index extends StatefulWidget {
  @override
  _WidgetState createState() => new _WidgetState();
}

class _WidgetState extends State<Index> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    HotPage(),
    Text('Index 0: Business'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
    Text('Index 3: School'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _neverSatisfied() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Rewind and remember'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You will never be satisfied.'),
                  Text('You\’re like me. I’m never satisfied.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Regret'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        drawer: new Drawer(
            semanticLabel: "哈哈哈",
            child: new ListView(
              itemExtent: 60.0,
              padding: EdgeInsets.only(),
              children: <Widget>[
                new RaisedButton(
                  color: Colors.white70,
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    _neverSatisfied();
                  },
                  child: new Text('dialog弹出'),
                ),
              ],
            )),
        appBar: new AppBar(
          title: new Text(ConstantString.home_title),
          backgroundColor: Colors.deepOrange,
          leading: new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: '菜单提示',
            onPressed: null,
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.search),
              tooltip: '搜索提示',
              onPressed: null,
            ),
          ],
        ),
        body: new Container(
          child: _widgetOptions[_selectedIndex],
          alignment: Alignment.center,
          color: Colors.grey,
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
          fixedColor: Colors.blue,
          items: BottomNav.items,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
