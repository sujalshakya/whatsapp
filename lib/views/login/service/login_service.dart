import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/network/dio.dart';

class AuthService {
  static Future loginApiRequest(String data) async {
    final dio = DioInstance().dio;

    final response = await dio.post((ApiUrls.login), data: data);
    return response;
  }
}
