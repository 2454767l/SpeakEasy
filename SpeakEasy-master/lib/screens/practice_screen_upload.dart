import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:speakeasy/firebase_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Practice_Screen_upload extends StatefulWidget {
  const Practice_Screen_upload({Key? key}) : super(key: key);

  @override
  State<Practice_Screen_upload> createState() => _MyAppState();
}

class _MyAppState extends State<Practice_Screen_upload> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text('UPLOAD',
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
      floatingActionButton: Container(
        width: 300,
        child: buildNavigateButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Container(
                alignment: Alignment.center,
                //padding: const EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                decoration: const BoxDecoration(
                    color: Color(0xFF9747FF),
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                height: 250,
                width: 350,
                child: const Text(
                  'Congratulations on completing your public speaking practise! Tap the button below to see your results!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
              const SizedBox(height: 60),
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

  Widget buildNavigateButton() => FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          'Select and Upload Video',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        //icon: Icon(Icons.arrow_circle_right_outlined),
        backgroundColor: Colors.green,
        onPressed: () {
          selectFile();
          uploadFile();
          /*ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Uploaded to Firebase!')),
          );*/
        },
      );
}
