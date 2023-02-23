
import 'package:generative/app/data/models/pre_tuned_model_model.dart';
import 'package:generative/app/data/providers/pre_tuned_model_provider.dart';

class HomeRepository {
  final PreTunedModelProvider preTunedModelProvider;

  HomeRepository({required this.preTunedModelProvider});

  Future<List<PreTunedModel>> getPreTunedModels() => preTunedModelProvider.getPreTunedModels();
}
