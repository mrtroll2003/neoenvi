import 'package:flutter/material.dart';
import 'package:neoenvi/LoginScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:neoenvi/webcrawl.dart';
import 'package:html/parser.dart' as parser;

class Object {
  final String title;
  final String link;

  Object({required this.title,required this.link});
}

 List<Object> yourObjectList = [
    Object(title: "Tận dụng mọi nguồn sáng tự nhiên trong nhà ở", link: "https://znews-photo.zingcdn.me/w960/Uploaded/jqkpvowk/2022_11_23/MFOX1937_Edit_Edit_1.jpeg"),
    Object(title: "6 lỗi sai phổ biến khi treo gương trong nhà", link: "https://znews-photo.zingcdn.me/w960/Uploaded/jqkpvowk/2022_11_24/WT5LeiLdnX7RUKwQytPdfF_1920_80.j_1.jpg"),
  ];
class MainScreen extends StatefulWidget {

  const MainScreen({super.key});

  @override
  _MyAppState createState() => _MyAppState();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(),
    );
  }
}


class _MyAppState extends State<MainScreen> {
  
  Future<List<String>> extractData() async {
    // Getting the response from the targeted url
    final response =
        await http.Client().get(Uri.parse('https://www.geeksforgeeks.org/'));

    // Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {
      // Getting the html document from the response
      var document = parser.parse(response.body);
      try {
        // Scraping the first article title
        var responseString1 = document
            .getElementsByClassName('articles-list')[0]
            .children[0]
            .children[0]
            .children[0];

        print(responseString1.text.trim());

        // Scraping the second article title
        var responseString2 = document
            .getElementsByClassName('articles-list')[0]
            .children[1]
            .children[0]
            .children[0];

        print(responseString2.text.trim());

        // Scraping the third article title
        var responseString3 = document
            .getElementsByClassName('articles-list')[0]
            .children[2]
            .children[0]
            .children[0];

        print(responseString3.text.trim());

        // Converting the extracted titles into
        // string and returning a list of Strings
        return [
          responseString1.text.trim(),
          responseString2.text.trim(),
          responseString3.text.trim()
        ];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }


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
          items: ["1", 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.blue, 
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(image: NetworkImage("https://znews-photo.zingcdn.me/w960/Uploaded/jqkpvowk/2022_11_23/MFOX1937_Edit_Edit_1.jpeg"),
                        fit: BoxFit.cover)),
                    child: Text(
                      '$i',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ));
              },
            );
          }).toList(),
        ),
      ]),
    );
  }
}
