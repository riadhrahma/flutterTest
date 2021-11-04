

class CardModel {
  String id;
  String image;
  String title;
  String content;
  String createdAt;

  CardModel({this.id, this.image, this.title, this.content, this.createdAt});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
        id: json['id'],
        image: json['image'],
        content: (json['content'] as String).replaceAll('"', ''),
        createdAt: json['created_at'],
        title: json['title']);
  }

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'image': this.image,
        'title': this.title,
        'content': this.content,
        'created_at': this.createdAt
      };

  toJSON() => {
        "id": "${this.id}",
        "image": "${this.image}",
        "title": "${this.title}",
        "content": "${this.content}",
        "created_at": "${this.createdAt}"
      }.toString();

  String toJSONString() =>
      '{"id":"$id","image":"$image","title":"$title","content":"$content","created_at":"$createdAt"}';
}
