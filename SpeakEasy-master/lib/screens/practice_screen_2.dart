import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:speakeasy/firebase_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Practice_Screen_2 extends StatefulWidget {
  const Practice_Screen_2({Key? key}) : super(key: key);

  @override
  State<Practice_Screen_2> createState() => _MyAppState();
}

class _MyAppState extends State<Practice_Screen_2> {
  UploadTask? task;
  File? file;

  Future pickImage(ImageSource source) async {
    try {
      final file = await ImagePicker().pickVideo(source: source);
      if (file == null) return;
      final imagePermanent = await saveImagePermanently(file.path);
      await GallerySaver.saveVideo(file.path, toDcim: true);
      setState(() => this.file = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final file = File('${directory.path}/$name');
    return File(imagePath).copy(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text('PRACTICE',
            style: TextStyle(
              color: Color(0xFFAFF4C6),
              fontSize: 35.0,
            )),
        centerTitle: true,
        brightness: Brightness.light,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Colors.black12,
        elevation: 100,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SizedBox(),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onSurface: Colors.green,
                  primary: Color(0xFF9747FF),
                  minimumSize: const Size(200, 200),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)),
                ),
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Tap here to record your video',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onSurface: Colors.green,
                  primary: Colors.green,
                  minimumSize: const Size(200, 200),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)),
                ),
                onPressed: () {
                  selectFile();
                  uploadFile();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Uploaded to Firebase!')),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Select and Upload Video',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;
    final fileName = file!.path;
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);

    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage%',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
