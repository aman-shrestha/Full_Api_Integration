import 'package:api_integration_full/get/get_filter_data.dart';
import 'package:api_integration_full/get/get_with_multi_data.dart';
import 'package:api_integration_full/get/get_with_simple_data.dart';
import 'package:api_integration_full/post/create_jobs/create_jobs_home_screen.dart';
import 'package:api_integration_full/post/file_uploading/post_file_upload.dart';
import 'package:api_integration_full/post/login/post_login.dart';
import 'package:api_integration_full/post/register/post_register.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FULL API INTEGRATION "),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetWithSimpleData()),
                  );

                },
                child: Text("GET WITH SIMPLE DATA"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetWithMultiData()),
                  );

                },
                child: Text("GET WITH COMPLEX DATA"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GetFilterData()),
                  );

                },
                child: Text("GET FILTER DATA"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PostLogin()),
                  );

                },
                child: Text("POST LOGIN"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PostFileUpload()),
                  );
                },
                child: Text("POST FILE UPLOAD"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PostRegister()),
                  );
                },
                child: Text("POST REGISTER"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateJobsHomeScreen()),
                  );
                },
                child: Text("POST CREATE JOBS"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
