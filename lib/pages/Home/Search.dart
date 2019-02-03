import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/component/home/Hot/MovieItem.dart';
import 'package:flutter_app_demo1/model/Movie/MovieList.dart';
import 'package:flutter_app_demo1/rigger/ScrollableList.dart';
import 'package:flutter_app_demo1/utils/API.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Search();
  }
}

class Search extends StatefulWidget {
  @override
  _SearchWidgetState createState() => new _SearchWidgetState();
}

class _SearchWidgetState extends ScrollableList<Search> {
  @override
  requestData(int start, int pageSize) async {
    Map<int, Object> req = new Map();
    req[0] = start;
    req[1] = pageSize;
    var json = await APITool.get(API.movie_search, req: req);
    return MovieList.fromJson(json);
  }

  @override
  itemBuilder(BuildContext context, List data, int index) {
    return MovieItem(data[index], index);
  }
}
