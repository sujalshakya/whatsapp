import 'package:whatsapp/views/login/models/login_request_model.dart';
import 'package:whatsapp/views/login/repository/login_repository.dart';
import 'package:whatsapp/views/login/service/login_service.dart';

interface class LoginRepositoryImplementation implements LoginRepository {
  @override
  Future<bool> login(LoginRequestModel loginRequestModel) async {
    try {
      await AuthService.loginApiRequest(loginRequestModel);

      return true;
    } catch (e) {
      return false;
    }
  }
}
