import 'package:dio/dio.dart';
import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/service/interceptor.dart';

class FetchService {
  static fetchUsersApiCall() async {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());

    return await dio.get((ApiUrls.fetch));
  }
}
