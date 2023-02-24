import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:generative/app/data/models/generating_request_model.dart';
import 'package:generative/app/data/models/pre_tuned_model_model.dart';
import 'package:generative/app/data/providers/generating_request_provider.dart';
import 'package:generative/app/data/providers/pre_tuned_model_provider.dart';
import 'package:generative/app/data/providers/translating_result_provider.dart';

class HomeRepository {
  final PreTunedModelProvider preTunedModelProvider;
  final GeneratingRequestProvider generatingRequestProvider;
  final TranslatingResultProvider translatingResultProvider;
  HomeRepository({required this.translatingResultProvider,  required this.generatingRequestProvider, required this.preTunedModelProvider});

  Future<List<PreTunedModel>> getPreTunedModels() => preTunedModelProvider.getPreTunedModels();

  Future<DocumentReference> sendRequest(GeneratingRequest generatingRequest)=> generatingRequestProvider.sendRequest(generatingRequest);

  Future<String> translate(String kor) => translatingResultProvider.translateString(kor);
}
