import 'dart:convert';
import 'dart:io';

//apikey=0df993c66c0c636e29ecbb5344252a4a
//https://douban.uieee.com/v2
//https://www.jianshu.com/p/d9701a81be8e
class API {
  //豆瓣热映
  //start: 数据的开始项
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
      'https://api.douban.com/v2/movie/search?start=#{0}&count=#{1}&q=#{2}&tag=#{3}';

  //即将上映
  //start: 数据的开始项
  //count：单页条数
  static const String movie_coming_soon =
      'https://api.douban.com/v2/movie/coming_soon?start=#{0}&count=#{1}';

  //条目详情
  //id: 电影id
  static const String movie_subject =
      'https://api.douban.com/v2/movie/subject/#{0}';
}

class APITool {
  //api地址拼接参数
  static generateURL(String api, Map<Object, Object> map) {
    map.forEach((index, value) {
      api = api.replaceAll('#{$index}', value.toString());
    });
    print('APITool.getAPI:' + api);
    return api;
  }

  //发送get请求
  static get(String api, {Map<Object, Object> req}) async {
    if (req != null) {
      api = generateURL(api, req);
    }

    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(api));
    var response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();
    print('APITool.get result:' + responseBody);
    return jsonDecode(responseBody);
  }
}
