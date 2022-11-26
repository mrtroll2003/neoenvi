import 'package:flutter/material.dart';
import 'package:neoenvi/LoginScreen.dart';
import 'package:neoenvi/MainScreen.dart';
import 'package:neoenvi/webcrawl.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({super.key});

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Image(
                image: NetworkImage(
                    "https://znews-photo.zingcdn.me/w960/Uploaded/jqkpvowk/2022_11_23/MFOX1937_Edit_Edit_1.jpeg")),
            Padding(
                padding: EdgeInsets.only(left: 5.0, top: 24.0),
                child: Text(
                  "Tận dụng mọi nguồn sáng tự nhiên trong nhà ở",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: 5.0, top: 24.0),
                child: Text(
                  "Ánh sáng tự nhiên có thể được khai thác tối đa nếu bạn thiết kế các cửa sổ một cách hợp lý và sử dụng màu sơn trắng.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: 5.0, top: 24.0),
                child: Text(
                  "Tối ưu ánh sáng tự nhiên là một trong những tiêu chí quan trọng khi thiết kế nhà. Đây là nguồn sáng dồi dào, có sẵn, giúp không gian thêm rộng thoáng, đồng thời cải thiện tâm trạng của người ở.Không chỉ thế, tận dụng được nguồn sáng này cũng giúp các gia chủ tiết kiệm chi phí hơn so với sử dụng đèn điện.Để khai thác tối đa ánh sáng tự nhiên trong nhà ở, bạn có thể tham khảo những gợi ý dưới đây của House & Garden.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                )),
          ],
        ));
  }
}
