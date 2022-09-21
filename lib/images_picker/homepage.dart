import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:api_register_login/images_picker/api.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaHome extends StatefulWidget {
  const MediaHome({super.key});

  @override
  State<MediaHome> createState() => _MediaHomeState();
}

class _MediaHomeState extends State<MediaHome> {
  //  audio list
  List<File>? files;
  // Images List
  List<XFile> images = [];
  // initializing ImagePicker
  final ImagePicker imagePicker = ImagePicker();

  // method for uploading Mutli-Images
  void pickImage() async {
    final List<XFile>? selectImage = await imagePicker.pickMultiImage();
    if (selectImage!.isNotEmpty) {
      setState(() {
        images.addAll(selectImage);
        print(images[0].path);
      });
    }
  }
// method for uploading audio
  void pickAudioFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      print(files[0].path);
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color.fromARGB(188, 198, 226, 234),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Upload Media Form",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: Text("Select Images"),
              ),
              ElevatedButton(
                onPressed: () {
                  pickAudioFile();
                },
                child: Text("Select Audio"),
              ),
              ElevatedButton(
                onPressed: () {
                  Review.submitReview(
                          ocrResult: "HELLO",
                          qrResult: "89601785",
                          experience: "Perfect",
                          size: "M",
                          looksRatting: "4",
                          smellRatings: "5",
                          product_title: "red rose",
                          product_description:
                              "The Red Rose Symbolizes Romance, Love, Beauty, And Courage. A Red Rosebud Signifies Beauty And Purity. A Thornless Red Rose Means Love At First Sight.",
                          product_id: "163",
                          user_id: "2841",
                          audioFile: files?[0].path,
                          flower: [images[0].path, images[1].path],
                          extraFile: images[0].path)
                      .whenComplete(() => print("done"));
                },
                child: Text("Click to Upload"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
