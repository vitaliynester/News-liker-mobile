class NewsModel {
  int id;
  String title;
  String createdAt;
  String adt;

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    adt = json['adt'];
  }

  Map<String, dynamic> toJson() {
    var json = {};
    json['id'] = id;
    json['title'] = title;
    json['created_at'] = createdAt;
    json['adt'] = adt;
    return json;
  }
}
