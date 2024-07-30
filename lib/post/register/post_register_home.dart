import 'package:flutter/material.dart';

class PostRegisterHome extends StatefulWidget {
  final String id;
  final String token;
  const PostRegisterHome({super.key, required this.id, required this.token});

  @override
  State<PostRegisterHome> createState() => _PostRegisterHomeState();
}

class _PostRegisterHomeState extends State<PostRegisterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ID : ${widget.id}"),
              Text("Token: ${widget.token}"),
            ],
          ),
        ],
      ),
    );
  }
}
