import 'dart:convert';
import 'dart:typed_data';

import 'package:api_integration_full/Models/LoginModel.dart';
import 'package:api_integration_full/Models/RegisterModel.dart';
import 'package:api_integration_full/Models/SimpleData.dart';
import 'package:api_integration_full/Models/users_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'Models/CreateJobModel.dart';
import 'Models/MultiData.dart';

class ApiServices {
  Future<List<SimpleData>?> getSimpleData() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        List<SimpleData> model = List<SimpleData>.from(
            json.decode(response.body).map((x) => SimpleData.fromJson(x)));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<MultiData?> getMultiData() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
      if (response.statusCode == 200) {
        MultiData model = MultiData.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<LoginModel?> loginWithModel(String email, String password) async {
    try {
      // var url = Uri.parse("https://reqres.in/api/login");
      var response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<CreateJobModel?> createJob(String name, String job) async{
    try {
      var url = Uri.parse("https://reqres.in/api/users");
      var response = await http.post(url, body: {
        "name": name,
        "job": job,
      });
      if(response.statusCode == 201 || response.statusCode == 200){
        CreateJobModel model = CreateJobModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }
  }
  Future<RegisterModel?> register(String email, String password) async{
    try {
      var url = Uri.parse("https://reqres.in/api/register");
      var response = await http.post(url, body: {
        "email": email,
        "password": password
      });
      if(response.statusCode == 201 || response.statusCode == 200){
        RegisterModel model = RegisterModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }
  }
  Future<dynamic> uploadImage (Uint8List bytes, String filename) async{
    var request = http.MultipartRequest('POST', Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));
    var multipartFile = http.MultipartFile(
      'file',
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: filename,
    );
    request.files.add(multipartFile);
    final response = await request.send();
    if(response.statusCode == 201){
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    }else{
      return null;
    }
  }
  Future<UsersList?> getUserList() async {
    try {
      var response = await http.get(Uri.parse("https://dummyjson.com/users"));
      if (response.statusCode == 200) {
        return UsersList.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }
}
