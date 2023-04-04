abstract class ResetPasswordConfirm {
  Future<bool> confirm(
      {required String email, required String code, required String password});
}
