import 'package:api_integration_full/Models/MultiData.dart';
import 'package:api_integration_full/api_services.dart';
import 'package:flutter/material.dart';

class GetWithMultiData extends StatefulWidget {
  const GetWithMultiData({super.key});

  @override
  State<GetWithMultiData> createState() => _GetWithMultiDataState();
}

class _GetWithMultiDataState extends State<GetWithMultiData> {
  MultiData multiData = MultiData();
  bool isReady = false;
  // MultiData? multiData; // Initialize as nullable

  _getMultiData() {
    isReady = true;
    ApiServices().getMultiData().then((value) {
      if (value != null) {
        setState(() {
          multiData = value;
          isReady = false;
        });
      } else {
        // Handle null value from API call
        // Show error message or retry mechanism
      }
    }).onError((error, stackTrace) {
      print(error);
      // Handle error from API call
      // Show error message or retry mechanism
    });
  }

  //
  // _getMultiData() {
  //   ApiServices().getMultiData().then((value) {
  //     setState(() {
  //       multiData = value!;
  //     });
  //   }).onError((error, stackTrace) {
  //     print(error);
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    _getMultiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET WITH MULTI DATA"),
      ),
      body: isReady == true?Center(child: CircularProgressIndicator(),):
      Container(
        child: multiData == null
            ? Center(child: CircularProgressIndicator()) // Show loading indicator if data is null
            : Column(
          children: [
            Text(multiData!.page.toString()), // Use null check operator (!) since we checked multiData != null
            Text(multiData!.total.toString()), // Use null check operator (!) since we checked multiData != null
            Expanded(
              child: ListView.builder(
                itemCount: multiData!.data!.length,
                itemBuilder: (BuildContext, index) {
                  return Card(
                    child: ListTile(
                      title: Text(multiData!.data![index].name.toString()), // Use null check operator (!) since we checked multiData!.data != null
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}
