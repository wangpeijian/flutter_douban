class API {
  //豆瓣热映
  // start: 数据的开始项
  //count：单页条数
  //city：城市
  static const String movie_in_theaters =
      'https://api.douban.com/v2/movie/in_theaters?start=#{0}&count=#{1}';

  //电影top250
  //start: 数据的开始项
  //count：单页条数
  static const String movie_top_250 =
      'https://api.douban.com/v2/movie/top250?start=#{0}&count=#{1}';

  //电影条目检索
  //start: 数据的开始项
  //count：单页条数
  //q：要搜索的电影关键字
  //tag：要搜索的电影的标签
  static const String movie_search =
      'https://api.douban.com/v2/movie/search?q=#{0}&tag=#{1}&start=#{2}&count=#{3}';

  //条目详情
  //id: 电影id
  static const String movie_subject =
      'https://api.douban.com/v2/movie/subject/#{0}';
}

class APITool {
  //api地址拼接参数
  static getAPI(String api, Map<Object, Object> map) {
    map.forEach((index, value) {
      api = api.replaceAll('#{$index}', '${value}');
    });
    print('APITool.getAPI: ${api}');
    return api;
  }
}
