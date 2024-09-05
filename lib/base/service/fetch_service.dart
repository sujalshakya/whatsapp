import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/network/dio.dart';

class FetchService {
  static fetchUsersApiCall() async {
    final dio = DioInstance().dio;

    return await dio.get((ApiUrls.fetch));
  }
}
