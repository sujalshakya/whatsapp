import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/network/dio.dart';
import 'package:whatsapp/views/register/models/register_request_model.dart';

class AuthService {
  static Future registerApiRequest(RegisterRequest registerRequest) async {
    final dio = DioInstance().dio;

    final response = await dio.post(
      (ApiUrls.signup),
      data: registerRequest,
    );

    return response;
  }
}
