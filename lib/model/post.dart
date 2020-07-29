class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.body, this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// we are able to get the list of posts, to get all the objects 
//post are the map 
//postlist is the list of all the posts of maps
      
class PostList {
  final List<Post> posts;

  PostList({this.posts});


  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = new List<Post>();
    posts = parsedJson.map((i) => Post.fromJson(i)).toList();

    return new PostList(posts: posts);
  }
}
