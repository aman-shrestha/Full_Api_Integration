import 'package:flutter/material.dart';

class PostLoginHomeScreen extends StatefulWidget {
  final String? token;
  const PostLoginHomeScreen({super.key, required this.token});

  @override
  State<PostLoginHomeScreen> createState() => _PostLoginHomeScreen();
}

class _PostLoginHomeScreen extends State<PostLoginHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HELLO"),
      ),
      body: Container(
        child: Center(child: Text("${widget.token}",),),
      ),
    );

  }
}
