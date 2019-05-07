// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:only_korean_review/main.dart';

void main() {

  const oneSecond = Duration(seconds: 5);

  Future<void> printWithDelay(String message) async{
    await Future.delayed(oneSecond);
    print(message);
  }

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
//    await tester.pumpWidget(MyApp());
//
//    // Verify that our counter starts at 0.
//    expect(find.text('0'), findsOneWidget);
//    expect(find.text('1'), findsNothing);
//
//    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();
//
//    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('1'), findsOneWidget);

//
//    String str = "UnicOde iS a CompUtInG industRy stanDArD for ConsiStent Encoding RepresenTation, AndhanDlinG of ALL tEXT. UsinG UNIcodE, ALL HAngUl sYllAbles CAN BE ExpRessed by 16-BitdatA bEtween 0Xac00 and 0xd7aF";
//    String str2 = "eXcluSiVe oR (XoR) IS a LOGiCaL opeRAtiOn THAt RESuLTS TruE onLY whEn iNpuTs diffER(one iS TRuE, The oThEr Is FALSE). iT Is oFTEn UsEd foR bitWiSe DyADIc OPERatIonS. (0Xor 0) = 0, (1 Xor 1) = 0, (1 Xor 0) = 1, AnD (0 xor 1) = 1 ARe estABLisHeD. ";
//
//    print(str.toLowerCase());
//    print(str.replaceAll(" ", ""));
//    print(str.replaceAll(" ", "").length);
//
//    str.runes.forEach((int f){
//      var char = String.fromCharCode(f);
//      int unicode = char.codeUnitAt(0);
//      print(unicode);
//    });
//
//    print(str.toLowerCase());
//    print(str.replaceAll(" ", ""));
//    print(str.replaceAll(" ", "").length);



  printWithDelay("heel");

    String say(String from, String msg,
        [String device = 'carrier pigeon', String mood]) {
      var result = '$from says $msg';
      if (device != null) {
        result = '$result with a $device';
      }
      if (mood != null) {
        result = '$result (in a $mood mood)';
      }
      return result;
    }

    print(say('Bob', 'Howdy' , 'junsu' , 'susu') );

//    assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');


  });

  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

}
