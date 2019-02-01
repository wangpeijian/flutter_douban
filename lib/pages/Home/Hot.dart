import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/component/home/Hot/MovieItem.dart';
import 'package:flutter_app_demo1/model/Movie/MovieList.dart';
import 'package:flutter_app_demo1/utils/API.dart';

class HotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hot();
  }
}

class Hot extends StatefulWidget {
  @override
  _HotWidgetState createState() => new _HotWidgetState();
}

class _HotWidgetState extends State<Hot> {
  List<subject> _data = new List();
  int _count = 0;
  int _start = 0;
  int _total = 0;

  _HotWidgetState() {
    this._data = [];
    _getListData(0, 10);
  }

  //获取热门列表
  _getListData(int start, int count) async {
    Map<int, Object> req = new Map();
    req[0] = start;
    req[1] = count;
    String url = APITool.getAPI(API.movie_in_theaters, req);

    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();
    print('HotPage._getListData: ${responseBody}');
    var json = jsonDecode(responseBody);

    MovieList movieList = MovieList.fromJson(json);

    setState(() {
      _data = movieList.subjects;
      _count = movieList.count;
      _start = movieList.start;
      _total = movieList.total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieItem(_data[index]);
        },
      ),
      onRefresh: () {
        return Future(() => {});
      },
    );
  }
}
