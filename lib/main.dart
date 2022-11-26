import 'package:flutter/material.dart';
import 'package:neoenvi/LoginScreen.dart';
//import 'package:firebase_core/firebase_core.dart';
void main() => runApp(MyApp());
//Test Firebase
/*Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Launch',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xff64A6FF),
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
            Container(
              margin: const EdgeInsets.only(top: 220.0,right: 200),
              child:ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text("-> Bắt đầu",
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  minimumSize: Size(70, 70),
                  backgroundColor: const Color(0xff2A2A2A),
                ),
            ),
            ),
          ]
        ),
      ),
    );
  }
}
