class Post {
  late String id;
  late String title;
  late String description;
  late String imgLink;
  late String duration;
  late String calories;
  String? category;

  Post({required this.id, required this.title, required this.description, required this.imgLink, required this.duration, required this.calories, required this.category});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        imgLink = json['imgLink'],
        duration = json['duration'],
        calories = json['calories'],
        category = json['category'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'imgLink': imgLink,
    'duration': duration,
    'calories': calories,
    'category': category,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Post &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Post{id: $id, title: $title, description: $description, imgLink: $imgLink, duration: $duration, calories: $calories, category: $category}';
  }
}