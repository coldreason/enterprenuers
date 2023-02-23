import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class BackgroundProvider extends GetConnect {

  final storageRef = FirebaseStorage.instance.ref();

  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }


}
