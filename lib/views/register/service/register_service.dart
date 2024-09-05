import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/network/dio.dart';

class AuthService {
  static Future registerApiRequest(data) async {
    final dio = DioInstance().dio;

    final response = await dio.post(
      (ApiUrls.signup),
      data: data,
    );

    return response;
  }
}
