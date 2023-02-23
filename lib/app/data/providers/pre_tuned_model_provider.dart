import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:generative/constants.dart';

import '../models/pre_tuned_model_model.dart';

class PreTunedModelProvider {
  CollectionReference preTunedRef =
      FirebaseFirestore.instance.collection(FirebaseConstants.preTunedModel);

  @override
  void onInit() {}

  Future<List<PreTunedModel>> getPreTunedModels() async {
    List<PreTunedModel> ret = [];
    QuerySnapshot<Object?> k = await preTunedRef.get();
    k.docs.forEach((element) {
      ret.add(PreTunedModel.fromJson(element.data() as Map<String,dynamic>));
    });
    return ret;
  }
}
