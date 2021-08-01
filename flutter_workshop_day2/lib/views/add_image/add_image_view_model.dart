import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_day2/core/services/upload_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_workshop_day2/core/logger.dart';
import 'package:path/path.dart';

class AddImageViewModel extends BaseViewModel {
  Logger log;

  AddImageViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  ImagePicker picker = ImagePicker();
  File _imageFromMobile;
  bool isImage = false;

  get getImageFromMobile => _imageFromMobile;

  pickImageFromMobile() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    _imageFromMobile = File(image.path);
    isImage = true;
    notifyListeners();
  }

  bool isDone = true;
  Future uploadFile(context) async {
    final fileName = basename(_imageFromMobile.path);
    final destination = 'files/$fileName';
    final task = FirebaseAPI.uploadFile(destination, _imageFromMobile);

    isDone = false;
    notifyListeners();

    final snapshot = await task.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print(urlDownload);

    await FirebaseFirestore.instance
        .collection('files')
        .add({'name': fileName, 'url': urlDownload});

    Navigator.pop(context);
    notifyListeners();
  }
}
