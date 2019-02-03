import 'package:flutter/material.dart';
import 'package:flutter_app_demo1/model/Movie/MovieDetail.dart';
import 'package:flutter_app_demo1/utils/API.dart';

class DetailPage extends StatelessWidget {
  String id;

  DetailPage(String id) {
    this.id = id;
  }

  @override
  Widget build(BuildContext context) {
    return Detail(id);
  }
}

class Detail extends StatefulWidget {
  String id;

  Detail(String id) {
    this.id = id;
  }

  @override
  _DetailWidgetState createState() => new _DetailWidgetState();
}

class _DetailWidgetState extends State<Detail> with TickerProviderStateMixin {
  MovieDetail movieDetail;

  @override
  initState() {
    super.initState();

    _getMovieDetail();
  }

  //获取电影详情
  _getMovieDetail() async {
    Map<Object, Object> req = new Map();
    req[0] = widget.id;
    var json = await APITool.get(API.movie_subject, req: req);

    print(MovieDetail(json));

    setState(() {
      movieDetail = MovieDetail(json);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSkeleton(),
    );
  }

  _getSkeleton() {
    //加载中效果
    if (this.movieDetail == null) {
      return Container(
        color: Colors.white,
        child: Center(child: new CircularProgressIndicator()),
      );
    } else {
      //页面详情展示
      return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            new SliverAppBar(
              backgroundColor: Colors.blueAccent,
              pinned: true,
              expandedHeight: 400.0,
              title: Container(
                child: Text(movieDetail.title),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movieDetail.images.small),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ];
        },
        body: _getBody(),
      );
    }
  }

  //获取电影介绍信息
  _getBody() {
    return Container(
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
        color: Colors.white70,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            //标签
            _getTags(),
            //内容介绍
            _getSummary(),
            //导演
            _getDirector(),
            //演员
            _getCast(),
          ],
        ));
  }

  //标签
  _getTags() {
    List<Widget> countries = movieDetail.countries.map((countries) {
      return Container(
        color: Colors.black,
        padding: EdgeInsets.only(left: 3, right: 3),
        margin: EdgeInsets.only(right: 5),
        child: Text(
          countries,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      );
    }).toList();

    List<Widget> genres = movieDetail.genres.map((genres) {
      return Container(
        color: Colors.blueAccent,
        padding: EdgeInsets.only(left: 3, right: 3),
        margin: EdgeInsets.only(right: 5),
        child: Text(
          genres,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      );
    }).toList();

    List<Widget> allTag = [
      Container(
        color: Colors.redAccent,
        padding: EdgeInsets.only(left: 3, right: 3),
        margin: EdgeInsets.only(right: 5),
        child: Text(
          movieDetail.year,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      )
    ];

    allTag.addAll(countries);
    allTag.addAll(genres);

    //计算电影星级
    List<Icon> starts = [];

    double average = double.parse('${movieDetail.rating.average}');
    //转换为5分制
    int integer = average ~/ 2;
    double remainder = average / 2 % 1;

    print(integer.toString());
    print(remainder.toString());

    for (int i = 0; i < integer; i++) {
      starts.add(Icon(
        Icons.star,
        color: Colors.amber,
      ));
    }

    if (remainder > 0.5) {
      starts.add(Icon(
        Icons.star,
        color: Colors.amber,
      ));
    } else if (remainder > 0) {
      starts.add(Icon(
        Icons.star_half,
        color: Colors.amber,
      ));
    }

    while (starts.length < 5) {
      starts.add(Icon(
        Icons.star_border,
        color: Colors.grey,
      ));
    }

    String original_title = "";
    if (movieDetail.original_title != movieDetail.title) {
      original_title = '(${movieDetail.original_title})';
    }

    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text('${movieDetail.title} ${original_title}',
                  style: TextStyle(fontSize: 16)),
            ),
            Row(
              children: allTag,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: starts,
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  //内容介绍
  _getSummary() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text(
              "简介",
            ),
            Text(movieDetail.summary),
          ],
        ),
      ),
    );
  }

  //导演
  _getDirector() {
    List<Widget> director = movieDetail.directors.map((director) {
      return Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 5),
          child: Image.network(director.avatars.small),
        ),
        Text(
          director.name,
          style: TextStyle(fontSize: 12),
        ),
      ]);
    }).toList();

    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                "导演",
              ),
            ),
            Column(
              children: director,
            )
          ],
        ),
      ),
    );
  }

  //演员
  _getCast() {
    List<Widget> director = movieDetail.casts.map((cast) {
      return Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 5),
          child: Image.network(cast.avatars.small),
        ),
        Text(
          cast.name,
          style: TextStyle(fontSize: 12),
        ),
      ]);
    }).toList();

    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                "演员",
              ),
            ),
            Column(
              children: director,
            )
          ],
        ),
      ),
    );
  }
}
