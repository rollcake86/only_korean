import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SearchHome();
  }
}

class SearchHome extends State<SearchScreen> {
  final String url = "https://swapi.co/api/people";
  List data;

  Future<String> getJSONData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      data = dataConvertedToJSON['results'];
    });
    return "Successfull";
  }

  @override
  void initState() {
    this.getJSONData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("단어 검색하기"),
      ),
      body: Container(
          child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {},
            controller: controller,
            decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Expanded(
          child: new ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                  child: new Center(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Card(
                          child: new Container(
                            child: new Text(
                              data[index]['name'],
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.lightBlueAccent),
                            ),
                            padding: EdgeInsets.all(15.0),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ])),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.search),
          onPressed: () {
            this.getJSONData();
          }),
    );
  }
}
