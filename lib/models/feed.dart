class Feed {
  String id;
  String username;
  String title;
  String description;
  String userId;

  Feed({this.id,
        this.username,
        this.title,
        this.description,
        this.userId});
  
  factory Feed.fromJson(Map<String, dynamic> userJson) {
    Feed feed = new Feed();
    feed.id = userJson['id'];
    feed.username = userJson['username'];
    feed.title = userJson['title'];
    feed.description = userJson['description'];
    feed.userId = userJson['userId'];
    return feed;
  }
}