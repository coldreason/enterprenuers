import 'package:dio/dio.dart';

import '../models/translating_result_model.dart';

class TranslatingResultProvider {
  @override
  void onInit() {;
  }


  Future<String> translateString(String kor)async{
    Dio dio = Dio();
    dio.options.baseUrl = 'https://openapi.naver.com/v1/papago';
    dio.options.headers = {
      "X-Naver-Client-Id":"HmQvCeham9IMLg_i8v5G",
      "X-Naver-Client-Secret" : "WvcdS8QYwB"
    };
    final Response response = await dio.request(
      '/n2mt',
      data: ("source=ko&target=en&text=" + "안녕하세요"),
      options: Options(method:'GET'),
    );
    print(response.data!);
    return response.data!.toString();
  }
}
