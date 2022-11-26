import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom ;


Future getWebsiteData() async {
  final url = Uri.parse('https://zingnews.vn/xu-huong.html');
  final response = await http.get(url);
  dom.Document html = dom.Document.html(response.body);

  final titles = html.querySelectorAll('header > p.article-title > a')
  .map((element) => element.innerHtml.trim())
  .toList();

  print('Count: ${titles.length}');
  for (final title in titles){
    debugPrint(title);
  }

}



class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState(){
    super.initState();
    getWebsiteData();
  }
  Widget build(BuildContext context) {
    return Container();
  }
}