import 'package:dependencies/dependencies.dart';
import 'package:internationalization/src/interfaces/interfaces.dart';

mixin LearningPtBR implements Learning {
  @override
  String accessUntil(DateTime date) {
    return "Acesso até ${date.brazilianFormattedDate}";
  }

  @override
  String assessmentMinScore(int percentage) {
    return "Aproveitamento mínimo: $percentage%";
  }

  @override
  String assessmentYourScore(int? percentage) {
    final score = percentage == null ? '--' : percentage.toString();
    return "Seu aproveitamento: $score";
  }

  @override
  String attempt(int attempt, int totalAttempts) {
    return "Tentativa $attempt/$totalAttempts";
  }

  @override
  String attemptLeft(int remaining) {
    return "$remaining tentativa restante";
  }

  @override
  String attemptsLeft(int remaining) {
    if (remaining <= 1) {
      return "$remaining tentativa restante";
    }
    return "$remaining tentativas restantes";
  }

  @override
  String attemptOf(int attempt, int totalAttempts) {
    return "Tentativa $attempt de $totalAttempts";
  }

  @override
  String continueAttempt(int number) => "Continuar tentativa $number";

  @override
  String courseWorkTime(int duration) => "Carga horária: ${duration}h";

  @override
  String daysRemaining(DateTime date) {
    if (date.daysRemaining == 0) {
      if (date.secondsRemaining > 0) {
        return "Expira hoje!";
      }
    }
    return "${date.daysRemaining} dias restantes";
  }

  @override
  String get aboutCourse => "Sobre o curso";

  @override
  String get assessment => 'Avaliação';

  @override
  String get assessmentTime => "Tempo para avaliação: 180m";

  @override
  String get attention => "Atenção!";

  @override
  String get backToAssessment => 'Não, voltar para a avaliação';

  @override
  String get backToCourses => 'Voltar para o curso';

  @override
  String get congratsYouHitTheQuestion => 'Parabéns, você acertou!';

  @override
  String get commentedFeedback => 'Gabarito comentado';

  @override
  String get content => "Conteúdo";

  @override
  String get contentUnavailable => "Conteúdo indisponível";

  @override
  String get courseCompleted => "Curso concluído!";

  @override
  String get courseContent => "Conteúdo do curso";

  @override
  String get courseExtraMaterial => "Apostila do curso";

  @override
  String courseLastActivity(DateTime lastActivity) {
    return "Última atividade em <w700>${lastActivity.brazilianFormattedDate}</w700>";
  }

  @override
  String courseLessonProgress(int current, int total) =>
      '<w700>$current de $total</w700> aulas concluídas';

  @override
  String get courseProgress => "Progresso no curso:";

  @override
  String get doLoginButton => "Fazer login";

  @override
  String get doRegisterButton => "Cadastrar";

  @override
  String get downloadCertificate => "Baixar certificado";

  @override
  String get downloadInImage => "Baixar em imagem";

  @override
  String get downloadInPdf => "Baixar em PDF";

  @override
  String get emptyStateSubtitle =>
      "Quando você adquirir um curso, ele aparecerá aqui!";

  @override
  String get emptyStateTitle => "Você ainda não possui cursos";

  @override
  String get expand => "Expandir";

  @override
  String get finalResultMsg =>
      'O resultado final será calculado com base nas\nquestões que você conseguiu responder.';

  @override
  String get findCourses => "Encontrar cursos";

  @override
  String get finishAllLessons => "Concluir todas as aulas do curso";

  @override
  String get howDoYouWantToDownloadYourCetificate =>
      "Como você deseja baixar seu certificado?";

  @override
  String get howToIssueYourCertificate => "Como emitir seu certificado:";

  @override
  String get markAsCompleted => "Marcar como concluída";

  @override
  String get markAsUncompleted => "Desmarcar aula concluída";

  @override
  String get myCourses => "Meus cursos";

  @override
  String get noAuthenticationSubtitle =>
      "Entre na sua conta ou cadastre-se para visualizar os seus cursos";

  @override
  String get noAuthenticationTitle => "Faça login para acessar";

  @override
  String get noConnectionDescription =>
      "Parece que você está sem internet.\nVerifique sua conexão e tente novamente";

  @override
  String get nodeCompleted => "Concluído";

  @override
  String get rateCourse => "Avalie esse curso";

  @override
  String get rateFinishedCourse => "Você concluiu esse curso! Avalie:";

  @override
  String get rateSuccessMessage => "Sua avaliação foi enviada com sucesso!";

  @override
  String get seeCommentedFeedback => "Ver gabarito comentado";

  @override
  String get send => "Enviar";

  @override
  String get sendAssessment => 'Enviar avaliação?';

  @override
  String get sendAssessmentAttentionMsg =>
      'Esse simulado possui questões não respondidas. Você deseja enviar mesmo assim?';

  @override
  String get sendAssessmentMsg =>
      'Ao finalizar a avaliação não será mais possível alterar suas respostas. Deseja continuar?';

  @override
  String get timesUp => 'Seu tempo acabou!';

  @override
  String get tooBadTheAnswerIsIncorrect =>
      'Que pena, a resposta está incorreta';

  @override
  String get touchToAnswerOneAttemptLeft =>
      'Toque para resolver (1 tentativa restantes)';

  @override
  String get verifyConnection => "Verifique sua conexão";

  @override
  String get visualizeAnswer => 'Visualizar respostas';

  @override
  String get visualizeAssessmentAttempt => 'Visualizar tentativa';

  @override
  String get yesSend => 'Sim, enviar';

  @override
  String get youHaveNoMoreAttempts => "Você não possui mais tentativas";

  @override
  String get yourAssessmentAttemptWasSent => 'Sua avaliação foi enviada!';

  @override
  String initAttempt(int number) => "Iniciar tentativa $number";

  @override
  String minutesContraction(int minutes) => "$minutes min";

  @override
  String minimumOfInAllAssessments(int percent) =>
      "Obter um aproveitamento mínimo de $percent% em todas as avaliações";

  @override
  String of(int number) => "de $number";

  @override
  String percentageFinished(int percentage) => "$percentage% concluído";

  @override
  String visualizeAttempt(int number) => "Visualizar tentativa $number";

  @override
  String touchToAnswerAttemptsLeft(int numberOfAttempts) =>
      "Toque para resolver ($numberOfAttempts tentativas restantes)";

  @override
  String whenAssessmentBeginYouWillHave(int min) =>
      "Ao iniciar a avaliação você terá o total de $min minutos para responde-lá.";

  @override
  String get module => 'Módulo';

  @override
  String get retryAssessment => 'Refazer avaliação';

  @override
  String get approved => 'Aprovado';

  @override
  String get failed => 'Reprovado';

  @override
  String get score => 'Aproveitamento: ';

  @override
  String get situation => 'Situação: ';
}
