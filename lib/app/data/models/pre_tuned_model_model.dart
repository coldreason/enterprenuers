class PreTunedModel {
  String? id;
  String? profile;

  PreTunedModel({this.id, this.profile});

  PreTunedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['profile'] = profile;
    return data;
  }
}
