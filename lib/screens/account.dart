import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = "/account";

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("단어 추가하기"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: new TextField(
                    decoration: InputDecoration(hintText: '원래 단어를 입력하세요'),
                    style: new TextStyle(fontSize: 17.0),
                    textAlign: TextAlign.center,
                    controller: controller,
                  )),
              new TextField(
                decoration: InputDecoration(hintText: '변경할 단어를 입력하세요'),
                style: new TextStyle(fontSize: 17.0),
                textAlign: TextAlign.center,
                controller: controller,
              )
            ],
          ),
        ),
        padding: EdgeInsets.all(10.0),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add), onPressed: () {}),
    );
  }
}
