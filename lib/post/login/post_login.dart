import 'dart:convert';

import 'package:api_integration_full/Models/LoginModel.dart';
import 'package:api_integration_full/api_services.dart';
import 'package:flutter/material.dart';

import 'post_login_home.dart';

// {
// "email": "eve.holt@reqres.in",
// "password": "cityslicka"
// }

class PostLogin extends StatefulWidget {
  const PostLogin({super.key});

  @override
  State<PostLogin> createState() => _PostLoginState();
}

class _PostLoginState extends State<PostLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginModel loginModel = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST LOGIN"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("eve.holt@reqres.in"),
            Text("cityslicka"),
            SizedBox(height: 20),
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                ApiServices()
                    .loginWithModel(
                        email.text.toString(), password.text.toString())
                    .then((value) {
                  setState(() {
                    loginModel = value!;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostLoginHomeScreen(
                                token: loginModel.token.toString())));
                  });
                }).onError((error, stackTrace) {
                  print(error);
                });
              },
              child: Container(
                color: Colors.amber,
                height: 50,
                child: Center(
                  child: Text("LOGIN"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
