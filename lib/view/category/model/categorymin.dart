class CategoryMin {
  final String action;
  final String url;
  final List<CotegoryMinCategory> data;
  CategoryMin(
    this.action,
    this.url,
    this.data,
  );
  factory CategoryMin.fromJson(Map<dynamic, dynamic> json) {
    var dataList = List<CotegoryMinCategory>.empty(growable: true);
    if (json['data'] is List) {
      var data = (json['data'] as List);
      dataList = data.map((e) => CotegoryMinCategory.fromJson(e)).toList();
    }
    return CategoryMin(json['action'], json['url'], dataList);
  }
}

class CotegoryMinCategory {
  final String category_id;
  final String title;
  final String image;
  final String slug;

  CotegoryMinCategory(
    this.category_id,
    this.image,
    this.title,
    this.slug,
  );
  factory CotegoryMinCategory.fromJson(Map<dynamic, dynamic> json) {
    return CotegoryMinCategory(
        json['category_id'].toString(),
        json['image'].toString(),
        json['title'].toString(),
        json['slug'].toString());
  }
}
