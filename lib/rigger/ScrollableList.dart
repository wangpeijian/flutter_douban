import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/model/PageDataResult.dart';

abstract class ScrollableList<T extends StatefulWidget> extends State<T>
    with TickerProviderStateMixin {
  static const int _defaultPageIndex = 1;
  static const int _pageSize = 10;

//  AnimationController controller;
//  CurvedAnimation curved;

  ScrollController scrollController = ScrollController();

  List _data = new List();
  int _pageIndex = _defaultPageIndex;
  bool _loading = false;
  bool _end = false;
  bool _init = true;

  @override
  initState() {
    super.initState();

    _getListData(_pageIndex);

    //监听列表滚动事件
    scrollController.addListener(() {
      if (!_loading &&
          !_end &&
          scrollController.position.pixels >
              scrollController.position.maxScrollExtent - 200) {
        _getListData(_pageIndex + 1);
      }
    });

    //初始化旋转动画
//    controller = new AnimationController(
//        vsync: this, duration: const Duration(seconds: 1));
//    curved = new CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: _getPageContent(),
      onRefresh: () {
        return Future(() => _getListData(1));
      },
    );
  }

  //获取分页数据
  _getListData(int page, {int pageSize: _pageSize}) async {
    setState(() {
      _pageIndex = page;
      _loading = true;
    });

    PageDataResult pageData =
        await requestData((page - 1) * pageSize, _pageSize);

    List list = [];
    if (page != 1) {
      list.addAll(_data);
    }
    list.addAll(pageData.subjects);

    setState(() {
      _data = list;
      _loading = false;
      _end = pageData.subjects.length == 0;
      _init = false;
    });
  }

  ///获取页面展示内容.
  ///loading & pageindex == 1 -> 加载中
  ///end & data.length == 0 -> 页面无内容
  ///else 展示列表
  _getPageContent() {
    //第一页加载中
//    controller.stop();
//    if (_loading && _pageIndex == 1) {
//      controller.repeat();
//      return Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new RotationTransition(
//            turns: curved,
//            child: Icon(Icons.cached, size: 15),
//          ),
//          Text('加载中...')
//        ],
//      );
//    }

    if (_loading && _init) {
      return Center(child: new CircularProgressIndicator());
    }

    //页面为空
    if (_end && _data.length == 0) {
      return ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 120),
                child: Text('暂无内容'),
              ),
            ],
          )
        ],
      );
    }

    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return itemBuilder(context, _data, index);
        },
        controller: scrollController);
  }

  //发送请求数据,返回接口对象
  requestData(int start, int pageSize);

  //构造列表项
  itemBuilder(BuildContext context, List data, int index);
}
