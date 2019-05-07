import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = "/account";

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    TextEditingController resultController = new TextEditingController();


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
                controller: resultController,
              )
            ],
          ),
        ),
        padding: EdgeInsets.all(10.0),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {


            if(controller.text.length != 0 && resultController.text.length != 0){
              showDialog(
                  context: context,
                  builder: (BuildContext context) => getDialog(context));
            }else{

              showDialog(
                  context: context,
                  builder: (BuildContext context) => new AlertDialog(content: new Text('빈칸이 있습니다'),));
            }
          }),
    );
  }

  AlertDialog getDialog(BuildContext context){
    AlertDialog dialog = new AlertDialog(
      content: new Text("단어를 추가하시겠습니까?"),
      title: new Text('한국인만'),
      actions: <Widget>[
        new FlatButton(
          child: new Text("네"),
          onPressed: () {

          },
        ),
        new FlatButton(
          child: new Text("아니요"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    return dialog;
  }
}
