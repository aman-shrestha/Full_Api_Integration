import 'package:flutter/material.dart';

class LoginWithAccessToken extends StatefulWidget {
  const LoginWithAccessToken({super.key});

  @override
  State<LoginWithAccessToken> createState() => _LoginWithAccessTokenState();
}

class _LoginWithAccessTokenState extends State<LoginWithAccessToken> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("LOGIN WITH ACCESS TOKEN"),),);
  }
}
