import 'dart:convert';

import 'package:connecting_world_of_flutter/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingMap extends StatefulWidget {
  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network("https://jsonplaceholder.typicode.com/posts");
    data = network.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PODO"),
      ),
      body: Center(
        child:Container(
          child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<Post>allPosts;
              if(snapshot.hasData){
                allPosts=snapshot.data.posts;
                return Text("${allPosts[0].title}");
              }
              else
              CircularProgressIndicator(); 
            },
          ),
        ),
      );
    );
  }
}

class Network {
  final String url;
  Network(this.url);
  // Future fetchData() async {
  //   print("$url");
  //     Response response = await get(Uri.encodeFull(url));
  //   if (response.statusCode == 200) {
  //     // print("good");
  //     print(response.body);
  //     return response.body;
  //   } else {
  //     return response.statusCode;
  //   }
  // }
  Future<PostList> loadPosts() async {
    final response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      // return json.decode(response.body);
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to get posts");
    }
  }
}
