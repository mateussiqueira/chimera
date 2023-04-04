import 'package:internationalization/src/interfaces/interfaces.dart';

mixin AuthenticationPtBR implements Authentication {
  @override
  String get alreadyExistsAccount => "E-mail já cadastrado";

  @override
  String get backToInitialScreenAndDoLogin =>
      "Volte para a tela inicial e faça login";

  @override
  String get backToLogin => "Voltar para o login";

  @override
  String get cancelledAuthentication => "Autorização cancelada";

  @override
  String get comeToThisCommunity => "Venha fazer parte da nossa comunidade!";

  @override
  String get confirm => "Confirmar";

  @override
  String get confirmPassword => "Confirme a senha";

  @override
  String get dintReceivedTheCode => "Não recebeu o código?";

  @override
  String get doLogin => "Fazer login";

  @override
  String get doRegister => "Cadastre-se";

  @override
  String get doYouHaveAnAccountAlready => "Já possui uma conta?";

  @override
  String get doesntHaveAnAccount => "Não possui uma conta? ";

  @override
  String get email => "E-mail";

  @override
  String get enter => "Entrar";

  @override
  String get enterTitle => "Entre na sua conta";

  @override
  String get enterNow => "Entre agora";

  @override
  String get enterSubtitle => "Que bom que você chegou! Faça seu login";

  @override
  String get fillTheCode =>
      "Preencha com o código que você recebeu para cadastrar uma nova senha";

  @override
  String get firstName => "Primeiro nome";

  @override
  String get firstNameError =>
      "Primeiro nome precisa conter pelo menos 2 caracteres";

  @override
  String get forgotPassword => "Esqueceu sua senha?";

  @override
  String get fullNameIssuedInCertificate =>
      "Será emitido seu nome completo no certificado";

  @override
  String get genericErrorMessage => "Ocorreu um erro, tente novamente";

  @override
  String get invalidCode => "Código inválido";

  @override
  String get invalidCredentials => "E-mail e/ou senha inválidos.";

  @override
  String get invalidEmail => "E-mail inválido";

  @override
  String get newPasswordMin8characters =>
      "Nova senha (pelo menos 8 caracteres)";

  @override
  String get noInternetMessage => "Verifique sua internet e tente novamente";

  @override
  String get orEnterWith => "Ou acesse com:";

  @override
  String get orRegisterWith => "Ou cadastre-se com:";

  @override
  String get password => "Senha";

  @override
  String get passwordAreDifferent => "As senhas não correspondem";

  @override
  String get passwordMin8characters => "Senha (pelo menos 8 caracteres)";

  @override
  String get passwordMustHave8characters =>
      "Sua senha precisa conter pelo menos 8 caracteres";

  @override
  String get passwordReset => "Sua senha foi redefinida!";

  @override
  String get redefinePassword => "Redefinir senha";

  @override
  String get register => "Cadastrar";

  @override
  String get registerNew8characterPassword =>
      "Cadastre uma nova senha, lembrando que ela precisa conter pelo menos 8 caracteres";

  @override
  String get resetInvalidCode => "Código inválido";

  @override
  String get resetNonRegisteredEmail => "E-mail inválido";

  @override
  String get resendEmail => "Reenviar e-mail";

  @override
  String get secondsToResend => "segundos para reenviar";

  @override
  String get sendEmail => "Enviar e-mail";

  @override
  String get signInWithApple => "Sign in with Apple";

  @override
  String get signInWithFacebook => "Sign in with Facebook";

  @override
  String get signInWithGoogle => "Sign in with Google";

  @override
  String get sixDigitsCode => "Código de 6 dígitos";

  @override
  String get surname => "Sobrenome";

  @override
  String get surnameError => "Sobrenome precisa conter pelo menos 2 caracteres";

  @override
  String get weWillSendTheCodeToEmail =>
      "Sem problemas! Enviaremos um código de acesso para redefinição no seu e-mail";
}
