import 'package:api_integration_full/Models/SimpleData.dart';
import 'package:api_integration_full/api_services.dart';
import 'package:flutter/material.dart';

class GetWithSimpleData extends StatefulWidget {
  const GetWithSimpleData({super.key});

  @override
  State<GetWithSimpleData> createState() => _GetWithSimpleDataState();
}

class _GetWithSimpleDataState extends State<GetWithSimpleData> {
  bool isReady = false;
  List<SimpleData> simpleData = [];

  _getPost() {
    ApiServices().getSimpleData().then((value) {
      setState(() {
        simpleData = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getPost();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GET WITH SIMPLE DATA"),
        ),
        body: isReady == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: simpleData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Text(simpleData[index].userId.toString()),
                      title: Text(simpleData[index].title.toString()),
                      subtitle: Text(simpleData[index].body.toString()),
                    ),
                  );
                },
              ));
  }
}
