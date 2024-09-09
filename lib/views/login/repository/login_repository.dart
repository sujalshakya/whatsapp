import 'package:whatsapp/views/login/models/login_request_model.dart';

abstract class LoginRepository {
  Future<bool> login(LoginRequestModel loginRequestModel);
}
