import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<String> storageDownload(String imageName)async{
  final storageRef = FirebaseStorage.instance.ref();
  final String imageUrl =
      await storageRef.child("generateImage/"+imageName).getDownloadURL();
  return imageUrl;
}

Future<String> storageUpload(XFile file)async{
  final storageRef = FirebaseStorage.instance.ref();
  Reference _reference = storageRef.child("pozes/"+getRandomString(15));
  String uploadedPhotoUrl = '';
  if(kIsWeb){
    await _reference
        .putData(
      await file!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    )
        .whenComplete(() async {
      await _reference.getDownloadURL().then((value) {
        uploadedPhotoUrl = value;
      });
    });
  }else{
    await _reference.putFile(File(file.path));
    uploadedPhotoUrl = await _reference.getDownloadURL();
  }
  return uploadedPhotoUrl;
}


const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));