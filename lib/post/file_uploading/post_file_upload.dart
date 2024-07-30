import 'dart:typed_data';
import 'package:api_integration_full/api_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostFileUpload extends StatefulWidget {
  const PostFileUpload({super.key});

  @override
  State<PostFileUpload> createState() => _PostFileUploadState();
}

class _PostFileUploadState extends State<PostFileUpload> {
  String uploadedImage = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FILE UPLOAD"),
      ),
      body: Center(
        child: isLoading? CircularProgressIndicator():
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            uploadedImage == ""
                ? SizedBox()
                : Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(uploadedImage))),
                  ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                // Pick an image.
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    isLoading = true;
                  });
                  Uint8List bytes = await image.readAsBytes();
                  ApiServices().uploadImage(bytes, image.name).then((value) {
                    setState(() {
                      uploadedImage = value["location"].toString();
                      isLoading = false;
                    });
                    print(value.toString());
                  }).onError((error, stackTrace) {
                    print(error.toString());
                  });
                }
              },
              child: Text("UPLOAD IMAGE"),
            ),
          ],
        ),
      ),
    );
  }
}
