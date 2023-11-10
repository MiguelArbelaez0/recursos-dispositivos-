import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageScreen extends StatefulWidget {
  const SelectImageScreen({super.key});

  @override
  State<SelectImageScreen> createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends State<SelectImageScreen> {
  File? _selectImage;

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectImage = File(returnedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pickImageFromGallery();
                },
                child: const Text('galeria'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _pickImageFromCamera();
                },
                child: const Text('camara'),
              ),
              const SizedBox(height: 20),
              _selectImage != null
                  ? Image.file(_selectImage!)
                  : Text("por favor seleccionar una imagen")
            ],
          ),
        ),
      ),
    );
  }
}
