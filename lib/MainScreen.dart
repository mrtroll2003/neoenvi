import 'package:flutter/material.dart';
import 'package:neoenvi/LoginScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom ;
import 'package:neoenvi/webcrawl.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainPage(),
    );
  }
}



class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          Row(
            children: <Widget>[
              Container(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assest/images/LoginScreen/LoginScreen_TempAva.jpg"),
                    radius: 68,
                  ))
            ],
          )
        ],
      ),
      body: Column(children: <Widget>[
        Text(
          "Đừng bỏ lỡ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
                SizedBox(height: 180),
        CarouselSlider(
          options: CarouselOptions(height: 400.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
      ]),
    );
  }
}
