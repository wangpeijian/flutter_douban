import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/model/Movie/MovieList.dart';
import 'package:flutter_app_demo1/pages/Detail/Index.dart';
import 'package:flutter_app_demo1/utils/ConstantString.dart';

class MovieItem extends StatefulWidget {
  subject _subject;
  int _index;

  MovieItem(subject subject, int index) {
    _subject = subject;
    _index = index;
  }

  @override
  MovieItemState createState() {
    return new MovieItemState();
  }
}

class MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        //主体结构, 缩略图 - 内容 - 评分
        child: GestureDetector(
      onTap: () {
        //监听点击事件,跳转到详情页面
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(widget._subject.id)),
        );
      },
      child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        //缩略图
        _Poster(widget._subject),

        Expanded(
          child: _Content(widget._subject, widget._index),
        )
            //内容介绍
            ,
      ]),
    ));
  }
}

//列表缩略图
class _Poster extends StatelessWidget {
  subject _subject;

  _Poster(subject subject) {
    _subject = subject;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(5),
      child: Image.network(
        _subject.images.small,
        height: 120,
        width: 85,
      ),
    );
  }
}

//内容
class _Content extends StatelessWidget {
  subject _subject;
  int _index;

  _Content(subject subject, int index) {
    _subject = subject;
    _index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //电影名
            _getTitle(),
            //电影标签
            _getSubTitle(),
            //主演
            _getCasts(),
            //主演头像
            _getPortraits(),
          ],
        ));
  }

  //获取标题
  _getTitle() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Text(
            _subject.title,
            textAlign: TextAlign.left,
          ),
          Positioned(
            right: 10,
            child: Text(
              '${_subject.rating.average}',
              style: TextStyle(color: Colors.redAccent, fontSize: 18),
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(top: 3, bottom: 5),
    );
  }

  //副标题内容(扩展数据 + 标签列表)
  _getSubTitle() {
    List<Widget> subTitle = [];

    //标签栏扩展数据(电影年份, 导演)
    //电影年份
    subTitle.add(Container(
      color: Colors.black,
      padding: EdgeInsets.only(left: 3, right: 3),
      margin: EdgeInsets.only(right: 5),
      child: Text(
        _subject.year,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    ));

    //导演
    subTitle.add(Container(
      color: Colors.black,
      padding: EdgeInsets.only(left: 3, right: 3),
      margin: EdgeInsets.only(right: 5),
      child: Text(
        _subject.directors[0].name,
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    ));

    //标签列表
    List<Widget> genres = _subject.genres.map((genre) {
      return Container(
        color: ConstantColors.app_theme_color,
        padding: EdgeInsets.only(left: 3, right: 3),
        margin: EdgeInsets.only(right: 5),
        child: Text(
          genre,
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      );
    }).toList();

    subTitle.addAll(genres);

    return Row(
      children: subTitle,
    );
  }

  //演员列表
  _getCasts() {
    List<String> castName = [];
    _subject.casts.forEach((cast) {
      castName.add(cast.name);
    });

    return Container(
      padding: EdgeInsets.only(left: 3, right: 3),
      margin: EdgeInsets.only(top: 10, right: 5),
      child: Text(
        castName.join(','),
        style: TextStyle(fontSize: 10),
      ),
    );
  }

  //演员头像列表
  _getPortraits() {
    List<Widget> portraits = _subject.casts.map((cast) {
      if (cast.avatars == null) {
        return Container();
      }

      return Container(
        padding: EdgeInsets.only(left: 3, right: 3),
        margin: EdgeInsets.only(top: 4, right: 5),
        child: Image.network(
          cast.avatars.small,
          height: 40,
        ),
      );
    }).toList();

    return Row(
      children: portraits,
    );
  }
}
