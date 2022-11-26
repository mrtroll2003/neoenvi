import 'package:flutter/material.dart';
import 'package:neoenvi/Forum.dart';
import 'package:neoenvi/LoginScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:neoenvi/webcrawl.dart';
import 'package:html/parser.dart' as parser;
import 'package:neoenvi/ArticleDetail.dart';

class Object {
  final String title;
  final String link;

  Object({required this.title, required this.link});
}

List<Object> yourObjectList = [
  Object(
      title: "Tận dụng mọi nguồn sáng tự nhiên trong nhà ở",
      link:
          "https://znews-photo.zingcdn.me/w960/Uploaded/jqkpvowk/2022_11_23/MFOX1937_Edit_Edit_1.jpeg"),
  Object(
      title: "6 lỗi sai phổ biến khi treo gương trong nhà",
      link:
          "https://znews-photo.zingcdn.me/w960/Uploaded/jqkpvowk/2022_11_24/WT5LeiLdnX7RUKwQytPdfF_1920_80.j_1.jpg"),
  Object(
      title: "Đối mới không gian với cây sắc hồng",
      link:
          "https://znews-photo.zingcdn.me/w960/Uploaded/ovunhuo/2022_11_23/colvin_best_office_plants_1664230150_1_.jpeg"),
  Object(
      title: "Dai-ichi Life Việt Nam góp phần mang đến 'Hạnh phúc cho Trái Đất",
      link:
          "https://znews-photo.zingcdn.me/w1200/Uploaded/wyhktpu/2022_11_08/image001_3.jpg"),
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

int _index = 0;

@override
Widget build(BuildContext context) {
  switch (_index) {
    case 1:
    Future.delayed(Duration.zero, () async {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Forum()),
                  );
    });
      break;
  }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 13),
                  child: Container(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            "assest/images/LoginScreen/LoginScreen_TempAva.jpg"),
                        radius: 68,
                      )))
            ],
          )
        ],
      ),
      body: Column(children: <Widget>[
        Text(
          "News",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        SizedBox(height: 100),
        CarouselSlider(
          options: CarouselOptions(height: 400.0),
          items: yourObjectList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticleDetail()),
                      );
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(i.link),
                                fit: BoxFit.cover)),
                        child: Padding(
                            padding: EdgeInsets.only(top: 340.0, left: 10.0),
                            child: Text(
                              i.title,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))));
              },
            );
          }).toList(),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Diễn đàn",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Cài đặt",
          ),
        ],
      ),
    );
  }
}
