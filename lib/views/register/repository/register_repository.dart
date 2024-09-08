abstract class RegisterRepository {
  Future<bool> register(String email, String fullName, String password);
}
