import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:only_korean_review/screens/search.dart';
import 'account.dart';
import 'settings.dart';

class edit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new editHome();
  }
}

class editHome extends State<edit> {
  String results = "";
  final TextEditingController textController = new TextEditingController();

  Drawer getNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(
        child: new Center(
            child: new Column(
      children: <Widget>[
        new Image(
          image: AssetImage('image/translator.png'),
          height: 80,
        ),
      ],
    )));
    var aboutChild = new AboutListTile(
      child: new Text('About'),
      applicationName: "한국인만",
      applicationVersion: "v1.0.0",
      applicationIcon: new Image(
        image: AssetImage('image/translator.png'),
        height: 50,
      ),
      icon: new Icon(Icons.info),
    );

    ListTile getNavItem(var icon, String s, String routeName) {
      return new ListTile(
        leading: new Icon(icon),
        title: new Text(s),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.add, "단어 추가하기", AccountScreen.routeName),
      getNavItem(Icons.search, "단어 검색하기", SearchScreen.routeName),
      getNavItem(Icons.settings, "셋팅", SettingsScreen.routeName),
      aboutChild
    ];
    ListView listView = new ListView(children: myNavChildren);

    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("한국인만 볼수있는 리뷰"),
        centerTitle: true,
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: new TextField(
                  decoration: new InputDecoration(
                      hintText: "리뷰할 한국어를 입력하세요",
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 40.0)),
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  style: new TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                  controller: textController),
            ),
            new GestureDetector(
              child: new Text(results,
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 20.0)),
              onLongPress: () {
                Clipboard.setData(new ClipboardData(text: results));
                showDialog(
                    context: context,
                    builder: (BuildContext context) => getDioalog());
              },
            ),
          ],
        ),
      ),
      drawer: getNavDrawer(context),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            results = encrypted(textController.text);
          });
        },
        child: Icon(Icons.translate),
      ),
    );
  }
}

AlertDialog getDioalog() {
  AlertDialog dialog = new AlertDialog(
    content: new Text(
      "복사가 완료되었습니다",
      style: new TextStyle(fontSize: 13.0),
    ),
  );
  return dialog;
}

// ignore: missing_return
String encrypted(String result) {


  String stringChange = makeBlack(result.trim().replaceAll(" ", ""));
  var stringArray = stringChange.split(" ");
  StringBuffer sb = new StringBuffer();

  for (String str in stringArray) {

    if (str.length == 4) {
      var first = str.substring(1, 2);
      var end = str.substring(2, 3);
      var result = str.substring(0,1) +end + first + str.substring(3,4);
      sb.write(result + " ");
    }
  }

  return sb.toString();
}

// ignore: missing_return
String makeBlack(String result) {
  int count = 0;
  StringBuffer sb = new StringBuffer();

  result.runes.forEach((int rune) {
    sb.write(String.fromCharCode(rune));
    count++;
    if (count == 4) {
      sb.write(" ");
      count = 0;
    }
  });
  return sb.toString();
}

getCount(int count, int length) {
  if (count == 0) {
    return length - 1;
  } else if (count == length - 1) {
    return 0;
  } else {
    return count;
  }
}
