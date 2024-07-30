import 'package:api_integration_full/get/get_filter_data.dart';
import 'package:api_integration_full/get/get_with_multi_data.dart';
import 'package:api_integration_full/get/get_with_simple_data.dart';
import 'package:api_integration_full/home.dart';
import 'package:api_integration_full/post/create_jobs/create_jobs_home_screen.dart';
import 'package:api_integration_full/post/file_uploading/post_file_upload.dart';
import 'package:api_integration_full/post/register/post_register.dart';
import 'package:flutter/material.dart';

import 'post/login/post_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home()
    );
  }
}
