import 'package:api_integration_full/Models/CreateJobModel.dart';
import 'package:api_integration_full/api_services.dart';
import 'package:api_integration_full/post/create_jobs/see_my_job.dart';
import 'package:flutter/material.dart';

class CreateJobsHomeScreen extends StatefulWidget {
  const CreateJobsHomeScreen({super.key});

  @override
  State<CreateJobsHomeScreen> createState() => _CreateJobsHomeScreenState();
}

class _CreateJobsHomeScreenState extends State<CreateJobsHomeScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController jobs = TextEditingController();
  CreateJobModel createJobModel = CreateJobModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CREATE JOBS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Name"),
              controller: name,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(hintText: "Jobs"),
              controller: jobs,
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: (){
                ApiServices().createJob(name.text.toString(), jobs.text.toString()).then((value) {
                  setState(() {
                    createJobModel = value!;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SeeMyJob(
                      id: createJobModel.id.toString(),
                      name: createJobModel.name.toString(),
                      job: createJobModel.job.toString(),
                    )));
                  });
                });
              },
              child: Container(
                height: 70,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text("CREATE JOB"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
