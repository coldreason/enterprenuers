class GeneratingRequest {
  String? id;
  String? poze;
  String? request;
  String? model;
  bool? finish;

  GeneratingRequest(
      {this.id, this.poze, this.request, this.model, this.finish});

  GeneratingRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    poze = json['poze'];
    request = json['request'];
    model = json['model'];
    finish = json['finish'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['poze'] = poze;
    data['request'] = request;
    data['model'] = model;
    data['finish'] = finish;
    return data;
  }
}
