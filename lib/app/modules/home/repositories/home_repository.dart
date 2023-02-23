import 'package:generative/app/data/models/generating_request_model.dart';
import 'package:generative/app/data/models/pre_tuned_model_model.dart';
import 'package:generative/app/data/providers/generating_request_provider.dart';
import 'package:generative/app/data/providers/pre_tuned_model_provider.dart';

class HomeRepository {
  final PreTunedModelProvider preTunedModelProvider;
  final GeneratingRequestProvider generatingRequestProvider;
  HomeRepository({required this.generatingRequestProvider, required this.preTunedModelProvider});

  Future<List<PreTunedModel>> getPreTunedModels() => preTunedModelProvider.getPreTunedModels();

  void sendRequest(GeneratingRequest generatingRequest)=> generatingRequestProvider.sendRequest(generatingRequest);
}
