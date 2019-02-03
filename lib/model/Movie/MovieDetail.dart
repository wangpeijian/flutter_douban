import 'dart:convert' show json;

class MovieDetail {
  Object current_season;
  Object do_count;
  Object episodes_count;
  Object seasons_count;
  int collect_count;
  int comments_count;
  int ratings_count;
  int reviews_count;
  int wish_count;
  String alt;
  String douban_site;
  String id;
  String mobile_url;
  String original_title;
  String schedule_url;
  String share_url;
  String subtype;
  String summary;
  String title;
  String year;
  List<String> aka;
  List<Cast> casts;
  List<String> countries;
  List<Director> directors;
  List<String> genres;
  image images;
  Rating rating;

  MovieDetail.fromParams(
      {this.current_season,
      this.do_count,
      this.episodes_count,
      this.seasons_count,
      this.collect_count,
      this.comments_count,
      this.ratings_count,
      this.reviews_count,
      this.wish_count,
      this.alt,
      this.douban_site,
      this.id,
      this.mobile_url,
      this.original_title,
      this.schedule_url,
      this.share_url,
      this.subtype,
      this.summary,
      this.title,
      this.year,
      this.aka,
      this.casts,
      this.countries,
      this.directors,
      this.genres,
      this.images,
      this.rating});

  factory MovieDetail(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new MovieDetail.fromJson(json.decode(jsonStr))
          : new MovieDetail.fromJson(jsonStr);

  MovieDetail.fromJson(jsonRes) {
    current_season = jsonRes['current_season'];
    do_count = jsonRes['do_count'];
    episodes_count = jsonRes['episodes_count'];
    seasons_count = jsonRes['seasons_count'];
    collect_count = jsonRes['collect_count'];
    comments_count = jsonRes['comments_count'];
    ratings_count = jsonRes['ratings_count'];
    reviews_count = jsonRes['reviews_count'];
    wish_count = jsonRes['wish_count'];
    alt = jsonRes['alt'];
    douban_site = jsonRes['douban_site'];
    id = jsonRes['id'];
    mobile_url = jsonRes['mobile_url'];
    original_title = jsonRes['original_title'];
    schedule_url = jsonRes['schedule_url'];
    share_url = jsonRes['share_url'];
    subtype = jsonRes['subtype'];
    summary = jsonRes['summary'];
    title = jsonRes['title'];
    year = jsonRes['year'];
    aka = jsonRes['aka'] == null ? null : [];

    for (var akaItem in aka == null ? [] : jsonRes['aka']) {
      aka.add(akaItem);
    }

    casts = jsonRes['casts'] == null ? null : [];

    for (var castsItem in casts == null ? [] : jsonRes['casts']) {
      casts.add(castsItem == null ? null : new Cast.fromJson(castsItem));
    }

    countries = jsonRes['countries'] == null ? null : [];

    for (var countriesItem in countries == null ? [] : jsonRes['countries']) {
      countries.add(countriesItem);
    }

    directors = jsonRes['directors'] == null ? null : [];

    for (var directorsItem in directors == null ? [] : jsonRes['directors']) {
      directors.add(
          directorsItem == null ? null : new Director.fromJson(directorsItem));
    }

    genres = jsonRes['genres'] == null ? null : [];

    for (var genresItem in genres == null ? [] : jsonRes['genres']) {
      genres.add(genresItem);
    }

    images = jsonRes['images'] == null
        ? null
        : new image.fromJson(jsonRes['images']);
    rating = jsonRes['rating'] == null
        ? null
        : new Rating.fromJson(jsonRes['rating']);
  }

  @override
  String toString() {
    return '{"current_season": $current_season,"do_count": $do_count,"episodes_count": $episodes_count,"seasons_count": $seasons_count,"collect_count": $collect_count,"comments_count": $comments_count,"ratings_count": $ratings_count,"reviews_count": $reviews_count,"wish_count": $wish_count,"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"douban_site": ${douban_site != null ? '${json.encode(douban_site)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"mobile_url": ${mobile_url != null ? '${json.encode(mobile_url)}' : 'null'},"original_title": ${original_title != null ? '${json.encode(original_title)}' : 'null'},"schedule_url": ${schedule_url != null ? '${json.encode(schedule_url)}' : 'null'},"share_url": ${share_url != null ? '${json.encode(share_url)}' : 'null'},"subtype": ${subtype != null ? '${json.encode(subtype)}' : 'null'},"summary": ${summary != null ? '${json.encode(summary)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"year": ${year != null ? '${json.encode(year)}' : 'null'},"aka": $aka,"casts": $casts,"countries": $countries,"directors": $directors,"genres": $genres,"images": $images,"rating": $rating}';
  }
}

class Rating {
  int max;
  int min;
  var average;
  String stars;

  Rating.fromParams({this.max, this.min, this.average, this.stars});

  Rating.fromJson(jsonRes) {
    max = jsonRes['max'];
    min = jsonRes['min'];
    average = jsonRes['average'];
    stars = jsonRes['stars'];
  }

  @override
  String toString() {
    return '{"max": $max,"min": $min,"average": $average,"stars": ${stars != null ? '${json.encode(stars)}' : 'null'}}';
  }
}

class image {
  String large;
  String medium;
  String small;

  image.fromParams({this.large, this.medium, this.small});

  image.fromJson(jsonRes) {
    large = jsonRes['large'];
    medium = jsonRes['medium'];
    small = jsonRes['small'];
  }

  @override
  String toString() {
    return '{"large": ${large != null ? '${json.encode(large)}' : 'null'},"medium": ${medium != null ? '${json.encode(medium)}' : 'null'},"small": ${small != null ? '${json.encode(small)}' : 'null'}}';
  }
}

class Director {
  String alt;
  String id;
  String name;
  Avatar avatars;

  Director.fromParams({this.alt, this.id, this.name, this.avatars});

  Director.fromJson(jsonRes) {
    alt = jsonRes['alt'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    avatars = jsonRes['avatars'] == null
        ? null
        : new Avatar.fromJson(jsonRes['avatars']);
  }

  @override
  String toString() {
    return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"avatars": $avatars}';
  }
}

class Avatar {
  String large;
  String medium;
  String small;

  Avatar.fromParams({this.large, this.medium, this.small});

  Avatar.fromJson(jsonRes) {
    large = jsonRes['large'];
    medium = jsonRes['medium'];
    small = jsonRes['small'];
  }

  @override
  String toString() {
    return '{"large": ${large != null ? '${json.encode(large)}' : 'null'},"medium": ${medium != null ? '${json.encode(medium)}' : 'null'},"small": ${small != null ? '${json.encode(small)}' : 'null'}}';
  }
}

class Cast {
  String alt;
  String id;
  String name;
  Avatar avatars;

  Cast.fromParams({this.alt, this.id, this.name, this.avatars});

  Cast.fromJson(jsonRes) {
    alt = jsonRes['alt'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    avatars = jsonRes['avatars'] == null
        ? null
        : new Avatar.fromJson(jsonRes['avatars']);
  }

  @override
  String toString() {
    return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"avatars": $avatars}';
  }
}
