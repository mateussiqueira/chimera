import 'package:internationalization/src/interfaces/interfaces.dart';

mixin ProfilePtBR implements Profile {
  @override
  String areYouRatingApp(String name) =>
      '$name, você está gostando do aplicativo?';

  @override
  String get accountDeletion => 'Excluir conta';

  @override
  String get accountDeletionCertificateWarning =>
      '<underline>Importante!</underline> Gere e baixe seus certificados de curso finalizado antes de excluir a conta.';

  @override
  String get accountDeletionConfirmationQuestion =>
      'Ainda deseja excluir a conta? Ao clicar no botão abaixo, você concorda com os termos de condição.';

  @override
  String get accountDeletionLosingList =>
      '• Acesso à sua conta;\n• Acesso aos cursos ativos (não expirados);\n• Acesso aos certificados não emitidos/baixados.';

  @override
  String get accountDeletionLosingWarning =>
      'Ao excluir sua conta você não poderá mais reativá-la e irá perder:';

  @override
  String get accountDeletionRefund =>
      'Caso você deseje o reembolso de algum curso, é preciso solicitá-lo <w700>antes da exclusão de conta</w700> através da Central de Ajuda. A solicitação pode ser feita <w700>em até 7 dias após a confirmação da compra</w700> conforme o disposto no art. 49, Seção I, Capítulo VI, da Lei nº 8.078 de 1990 – o Código de Defesa do Consumidor.';

  @override
  String get accountDeletionTitle => 'Não queremos te perder!';

  @override
  String get areYouSureLeaving => 'Você tem certeza que deseja sair?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get certificate => 'Certificado';

  @override
  String get certificateEmptySubtitle =>
      'Conclua um curso para obter certificado';

  @override
  String get certificateEmptyTitle => 'Nenhum curso finalizado';

  @override
  String get deletionConfirmationDescription => 'Iremos sentir sua falta...';

  @override
  String get deletionConfirmationQuestion =>
      'Antes de ir, podemos saber por quê?';

  @override
  String get doLoginOrRegisterProfile =>
      "Entre na sua conta ou cadastre-se para visualizar os seus cursos";

  @override
  String get doLoginProfile => "Faça login para acessar";

  @override
  String get dontRatingNow => "Não quero responder agora";

  @override
  String get gotoMyCourses => 'Ir para meus cursos';

  @override
  String get helpCenter => 'Central de ajuda';

  @override
  String get howCanWeImprove => 'Como podemos melhorar?';

  @override
  String get issuedIn => 'Emitido em:';
  @override
  String get logout => 'Sair da conta';

  @override
  String get myCertificates => 'Meus certificados';

  @override
  String get notifications => 'Notificações';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get profile => 'Perfil';

  @override
  String get rateThisApp => 'Avalie o aplicativo';

  @override
  String get rateWasSent => 'Sua avaliação foi enviada com sucesso!';

  @override
  String get removeMyAccount => 'Excluir minha conta';

  @override
  String get userTerms => 'Termos de uso';

  @override
  String get version => 'Versão';

  @override
  String get writeYourAnswerHere => 'Escreva sua resposta aqui';
}
