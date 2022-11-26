import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Launch',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xff2984ff),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child:new Column(
          children: <Widget>[
            Image.asset('assest/images/FirstLaunch/FirstLaunch_Illustrator_1.png'),
            Text(
                "Chào mừng",
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24, height: 2.5),
            ),
            Text(
              "Cảm ơn bạn đã góp phần",
              style: const TextStyle(fontWeight: FontWeight.w100, color: Colors.white, fontSize: 24),
            ),
            Text(
              "thực hiện bảo vệ môi trường",
              style: const TextStyle(fontWeight: FontWeight.w100, color: Colors.white, fontSize: 24),
            ),

          ]
        ),
      ),
    );
  }
}
