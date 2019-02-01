import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/model/Movie/MovieList.dart';

class MovieItem extends StatelessWidget {
  subject _subject;

  MovieItem(subject subject) {
    this._subject = subject;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        //主体结构, 缩略图 - 内容 - 评分
        child: Container(
      height: 130,
      child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        //缩略图
        _Poster(_subject),

        Expanded(
          child: _Content(_subject),
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
      padding: const EdgeInsets.all(5),
      child: new Image.network(
        _subject.images.small,
        height: 120,
      ),
    );
  }
}

//内容
class _Content extends StatelessWidget {
  subject _subject;

  _Content(subject subject) {
    _subject = subject;
  }

  @override
  Widget build(BuildContext context) {
    //电影标题 + 评分
    Widget title = Container(
      width: double.infinity,
      child: Stack(
//          fit: StackFit.expand,
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

    //标签列表
    List<Widget> genres = _subject.genres.map((genre) {
      return Container(
        color: Colors.blue,
        padding: EdgeInsets.only(left: 3, right: 3),
        margin: EdgeInsets.only(right: 5),
        child: Text(
          genre,
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      );
    }).toList();

    //演员列表
    List<Widget> casts = _subject.casts.map((cast) {
      return Container(
        padding: EdgeInsets.only(left: 3, right: 3),
        margin: EdgeInsets.only(top: 12, right: 5),
        child: Text(
          cast.name,
          style: TextStyle(fontSize: 10),
        ),
      );
    }).toList();

    //演员头像列表
    List<Widget> portraits = _subject.casts.map((cast) {
      return Container(
        padding: EdgeInsets.only(left: 3, right: 3),
        margin: EdgeInsets.only(top: 5, right: 5),
        child: new Image.network(
          cast.avatars.small,
          height: 40,
        ),
      );
    }).toList();

    return Container(
        height: 130,
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //电影名
            title,
            //电影标签
            Row(
              children: genres,
            ),
            //主演
            Row(
              children: casts,
            ),
            //主演头像
            Row(
              children: portraits,
            ),
          ],
        ));
  }
}
