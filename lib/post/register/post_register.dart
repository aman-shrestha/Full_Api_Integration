import 'package:api_integration_full/Models/RegisterModel.dart';
import 'package:api_integration_full/api_services.dart';
import 'package:api_integration_full/post/register/post_register_home.dart';
import 'package:flutter/material.dart';
// {
// "email": "eve.holt@reqres.in",
// "password": "pistol"
// }
class PostRegister extends StatefulWidget {
  const PostRegister({super.key});

  @override
  State<PostRegister> createState() => _PostRegisterState();
}

class _PostRegisterState extends State<PostRegister> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RegisterModel registerModel = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("eve.holt@reqres.in"),
            Text("pistol"),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(hintText: "Email"),
              controller: email,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(hintText: "Password"),
              controller: password,
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                ApiServices()
                    .register(email.text.toString(), password.text.toString())
                    .then((value) {
                  setState(() {
                    registerModel = value!;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PostRegisterHome(id: registerModel.id.toString(),token: registerModel.token.toString(),)));
                  });
                }).onError((error, stackTrace) {
                  print(error);
                });
              },
              child: Container(
                height: 70,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text("REGISTER"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
