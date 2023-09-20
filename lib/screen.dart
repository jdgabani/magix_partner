import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  FilePickerResult? Result;
  String? fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  Future<void> pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      Result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        //allowedExtensions: ['pdf'],
        allowMultiple: false,
      );

      if (Result != null) {
        fileName = Result!.files.first.name;
        pickedfile = Result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());

        print('File name $fileName');
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickFile();
        },
        child: Icon(Icons.file_copy_outlined),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (pickedfile != null)
                  SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: Image.file(fileToDisplay!)),
              ],
            ),
    );
  }
}
