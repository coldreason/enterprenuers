import 'package:generative/app/data/providers/pre_tuned_model_provider.dart';
import 'package:generative/app/modules/home/repositories/home_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
          homeRepository:
              HomeRepository(preTunedModelProvider: PreTunedModelProvider())),
    );
  }
}
