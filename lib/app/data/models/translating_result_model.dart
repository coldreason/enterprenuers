class TranslatingResult {
  Message? message;

  TranslatingResult({this.message});

  TranslatingResult.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? Message?.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message?.toJson();
    }
    return data;
  }
}

class Message {
  Result? result;
  String? type;
  String? service;
  String? version;

  Message({this.result, this.type, this.service, this.version});

  Message.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result?.fromJson(json['result']) : null;
    type = json['@type'];
    service = json['@service'];
    version = json['@version'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.toJson();
    }
    data['@type'] = type;
    data['@service'] = service;
    data['@version'] = version;
    return data;
  }
}

class Result {
  String? srcLangType;
  String? tarLangType;
  String? translatedText;
  String? engineType;
  dynamic pivot;
  dynamic dict;
  dynamic tarDict;
  String? modelVer;

  Result(
      {this.srcLangType,
      this.tarLangType,
      this.translatedText,
      this.engineType,
      this.pivot,
      this.dict,
      this.tarDict,
      this.modelVer});

  Result.fromJson(Map<String, dynamic> json) {
    srcLangType = json['srcLangType'];
    tarLangType = json['tarLangType'];
    translatedText = json['translatedText'];
    engineType = json['engineType'];
    pivot = json['pivot'];
    dict = json['dict'];
    tarDict = json['tarDict'];
    modelVer = json['modelVer'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['srcLangType'] = srcLangType;
    data['tarLangType'] = tarLangType;
    data['translatedText'] = translatedText;
    data['engineType'] = engineType;
    data['pivot'] = pivot;
    data['dict'] = dict;
    data['tarDict'] = tarDict;
    data['modelVer'] = modelVer;
    return data;
  }
}
