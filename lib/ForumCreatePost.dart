import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';


class ForumCreatePost extends StatefulWidget {
  const ForumCreatePost({super.key});

  @override
  State<ForumCreatePost> createState() => _ForumCreatePostState();
}

class _ForumCreatePostState extends State<ForumCreatePost> {
  TextEditingController sampledata1 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
                children: [
                  TextFormField(
                    controller: sampledata1,
                    decoration: InputDecoration(
                      hintText: "Nhập trạng thái"
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  ElevatedButton(onPressed: () {
                    Map <String,dynamic> data = {"field1" : sampledata1.text};
                    
                  }, child: Text("Xác nhận")),
                ],
            )
          ),
      ),
    );
  }
}