import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  
  static const String routeName = "/settings";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SettingHome();
  }
}

class SettingHome extends State<SettingsScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("셋팅"),
      ),
      body: new Container(
        child: new Center(
          child: new Text('Settings Screen'),
        ),
      ),
    );
  }

}