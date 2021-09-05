/*

 "id": 1,
            "title": "test",
            "content": "hello",
            "img": "public/s3v0qW8UCQO1cvhkpYTeX6JdqmjFg5MRjDiLwhol.png",
            "created_at": "2021-09-04T15:24:31.000000Z",
            "updated_at": "2021-09-04T15:24:31.000000Z",
            "deleted_at": null
 */

class SliderImage {
  int? id;
  String? title;
  String? content;
  String? img;
  String? updatedAt;
  String? createdAt;

  SliderImage({
    this.id,
    this.title,
    this.content,
    this.img,
    this.updatedAt,
    this.createdAt,
  });

  SliderImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    img = json['img'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['img'] = this.img;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
