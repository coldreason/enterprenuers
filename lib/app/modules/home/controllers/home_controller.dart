import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:generative/app/data/models/generating_request_model.dart';
import 'package:generative/app/data/models/pre_tuned_model_model.dart';
import 'package:generative/app/modules/home/repositories/home_repository.dart';
import 'package:generative/app/service/storage_upload.dart';
import 'package:generative/constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final HomeRepository homeRepository;
  bool videoReady = false;
  late VideoPlayerController videoPlayerController;
  List<PreTunedModel> models = [];
  String focus = "";
  int selected = 0;
  XFile? poze;
  TextEditingController requestController = TextEditingController();

  HomeController({required this.homeRepository});

  @override
  void onInit() async {
    super.onInit();
    videoPlayerController = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/enterprenuers.appspot.com/o/ink4.mp4?alt=media&token=b3123f66-efc8-4270-8d0c-4d3738e84114')
      ..initialize().then((_) {
        videoReady = true;
        update();
        videoPlayerController.setVolume(0);
        videoPlayerController.setPlaybackSpeed(0.4);
        videoPlayerController.setLooping(true);
        videoPlayerController.play();
      });
    models = await homeRepository.getPreTunedModels();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }



  @override
  void onClose() {
    super.onClose();
  }

  int selectChange(int index){
    selected = index;
    print(selected);
    update();
    return 0;
  }

  void pickImage()async{
    final ImagePicker _picker = ImagePicker();
    poze =  await _picker.pickImage(source: ImageSource.gallery);
    update();
  }

  void generate()async{
    if(poze !=null && requestController.value.text!=""){
      String pozeLink = await storageUpload(poze!);
      DocumentReference<Object?> ref = await homeRepository.sendRequest(GeneratingRequest(poze: pozeLink,request: requestController.value.text,model: models[selected].id!,finish: false));
      requestController.clear();
      focus = '';

      ref.snapshots().listen((querySnapshot) async{
        print(querySnapshot.data());
        Map<String,dynamic> ret = querySnapshot.data()! as Map<String,dynamic>;
        GeneratingRequest k = GeneratingRequest.fromJson(ret);
        if (k.finish!)
          {focus = await storageDownload(k.id!);
          print(focus);
          print('focus updated');
          }
        update();
      });
    }
  }


}
