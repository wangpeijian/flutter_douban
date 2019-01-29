// import 'package:flutter/material.dart';
// //主函数（入口函数），下面我会简单说说Dart的函数
// void main() =>runApp(MyApp());
// // 声明MyApp类
// class MyApp extends StatelessWidget{
//   //重写build方法
//   @override
//   Widget build(BuildContext context){
//     //返回一个Material风格的组件
//    return MaterialApp(
//       title:'Welcome to Flutteraa',
//       home:Scaffold(
//         //创建一个Bar，并添加文本
//         appBar:AppBar(
//           title:Text('Welcome to Flutter11'),
//         ),
//         //在主体的中间区域，添加一个hello world 的文本
//         body:Center(
//           child:Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//StatelessWidget？
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutteraa', //?
      home: Scaffold(
          appBar: new AppBar(
            title: new Text('Welcome to Flutter'),
            backgroundColor: Colors.deepOrange,
          ),
          body: Container(
            child: Text("hell121233123o"),
            alignment: Alignment.center,
            width: 500.0,
            height: 400.0,
            color: Colors.lightBlue,
          )),
    );
  }
}
