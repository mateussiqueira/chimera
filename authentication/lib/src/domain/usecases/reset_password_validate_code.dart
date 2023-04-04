abstract class ResetPasswordValidateCode {
  Future<bool> validateCode({required String email, required String code});
}
