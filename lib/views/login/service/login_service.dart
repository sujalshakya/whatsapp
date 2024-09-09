import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/network/dio.dart';
import 'package:whatsapp/views/login/models/login_request_model.dart';

class AuthService {
  static Future loginApiRequest(LoginRequestModel loginRequestModel) async {
    final dio = DioInstance().dio;

    final response = await dio.post((ApiUrls.login), data: loginRequestModel);

    return response;
  }
}
