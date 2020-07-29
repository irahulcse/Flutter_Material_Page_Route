import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';

class JsonParsing extends StatefulWidget {
  @override
  _JsonParsingState createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {
  Future data;

  @override
  void initState() {
    super.initState();
    data = Network("https://jsonplaceholder.typicode.com/posts").fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happiness is the key"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getData(),
          // initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              // return Text(createListView(data, context),),
              createListView(snapshot.data, context);
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future getData() async {
    String url;
    url = "https://jsonplaceholder.typicode.com/posts";
    var data;
    Network network = Network(url);
    data = network.fetchData();
    return data;
  }
}

//jsonplaceholder.typicode.com/posts
class Network {
  final String url;
  Network(this.url);
  Future fetchData() async {
    print("$url");
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      // print("good");
      print(response.body);
      return response.body;
    } else {
      return response.statusCode;
    }
  }
}

Widget createListView(List data, BuildContext context) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            subtitle: Text(
              "${data[index]["title"]}",
            ),
            title: Text("${data[index]["id"]}",
            ),
            leading: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 24,
                  child: Text(
                    "${data[index]["userId"]}",
                  ),
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}
