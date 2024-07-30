import 'package:flutter/material.dart';

class SeeMyJob extends StatefulWidget {
  final String id;
  final String name;
  final String job;
  const SeeMyJob({super.key, required this.id, required this.name, required this.job});

  @override
  State<SeeMyJob> createState() => _SeeMyJobState();
}

class _SeeMyJobState extends State<SeeMyJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("See My Jobs"),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ID : ${widget.id}"),
              SizedBox(height: 20),
              Text("Name : ${widget.name}"),
              SizedBox(height: 20),
              Text("Job : ${widget.job}"),
            ],
          ),
        ],
      ),
    );
  }
}
