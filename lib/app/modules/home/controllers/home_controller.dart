import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  bool videoReady = false;
  late VideoPlayerController videoPlayerController;
  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.asset(
        'ink4.mp4')
      ..initialize().then((_) {
        videoReady = true;
        update();
        videoPlayerController.setPlaybackSpeed(0.4);
        videoPlayerController.setLooping(true);
        videoPlayerController.play();

      });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
