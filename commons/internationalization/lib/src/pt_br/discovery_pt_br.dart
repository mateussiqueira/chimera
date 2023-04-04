import 'package:dependencies/dependencies.dart';
import 'package:internationalization/src/interfaces/interfaces.dart';

mixin DiscoveryPtBR implements Discovery {
  @override
  String installmentsPrice(int maxInstallments, int value, String iso) {
    final currencyFormatter = NumberFormat.simpleCurrency(name: iso);
    final installmentValue = value / 100 / maxInstallments;
    final installments = currencyFormatter.format(installmentValue);

    return "${maxInstallments}x de $installments";
  }

  @override
  String cashPrice(int value, String iso) {
    final currencyFormatter = NumberFormat.simpleCurrency(name: iso);
    final price = value / 100;
    final cashPrice = currencyFormatter.format(price);

    return "ou $cashPrice à vista";
  }

  @override
  String price(int value, String iso) {
    final currencyFormatter = NumberFormat.simpleCurrency(name: iso);
    final price = value / 100;

    return currencyFormatter.format(price);
  }

  @override
  String get discovery => 'Explorar';

  @override
  String get likedCourses => "Cursos favoritados";

  @override
  String get mostSearched => "Cursos mais procurados";

  @override
  String get navigateByCategory => "Navegue por categoria";

  @override
  String get recentViewed => "Recém visualizados por você";

  @override
  String get seeAll => "Ver todos";

  @override
  String seeAllCategory(String categoryName) {
    return "Ver todos os cursos de $categoryName";
  }

  @override
  String get seeAllLiked => "Ver todos os cursos favoritados";

  @override
  String get seeAllMostSearched => "Ver todos os cursos mais procurados";

  @override
  String get seeAllRecentViewed =>
      "Ver todos os cursos visualizados recentemente";

  @override
  String get categories => 'Categorias';

  @override
  String get mostPurchased => 'Mais comprados';

  @override
  String get search => "Buscar";

  @override
  String get searchACourse => "Pesquise um curso";

  @override
  String get suggestionsForYou => "Sugestões para você";

  @override
  String get topSearches => "Principais buscas";

  @override
  String get recentSearches => "Buscas recentes";

  @override
  String get online => "Online";

  @override
  String get institutionalCertificate => "Certificado institucional";

  @override
  String get mostSearchedCourses => "Cursos mais buscados";

  @override
  String get searchEmptyStateSubtitle => 'Edite sua pesquisa e tente novamente';

  @override
  String get searchEmptyStateTitle => 'Nenhum curso encontrado';

  @override
  String get seeLess => 'Ver menos';

  @override
  String get seeMore => 'Ver mais';

  @override
  String get addToCart => "Adicionar ao carrinho";

  @override
  String get buyCourse => "Comprar curso";

  @override
  String get courseExpectationsTitle => "O que você pode esperar desse curso:";

  @override
  String get goalsTitle => "Após concluir o curso você conseguirá:";

  @override
  String get seeCourseContent => "Veja o conteúdo desse curso";

  @override
  String contentExpectationDescription(int hours) => "$hours horas de conteúdo";

  @override
  String get courseCertificateSign =>
      "Certificado assinado pela instituição após aprovação nas avaliações do curso";

  @override
  String get courseDeviceCompatibility =>
      "Compatibilidade com dispositivos móveis e computadores";

  @override
  String get oneYearAccess => "1 ano de acesso";

  @override
  String get whoBoughtAlsoView => "Quem comprou também viu";

  @override
  String get buyCourseAdvantages => "Vantagens de comprar o curso";

  @override
  String get buyAdvantageDescription01 =>
      "Conecte-se com os melhores profissionais do mercado.";

  @override
  String get buyAdvantageDescription02 =>
      'Reconhecimento de uma das maiores universidades da área.';

  @override
  String get buyAdvantageDescription03 =>
      "Abordagem rápida e prática, com acesso onde e quando quiser.";

  @override
  String get buyAdvantageDescription04 =>
      'Professores qualificados com formação acadêmica robusta.';

  @override
  String get buyAdvantageTitle01 => 'Networking Nacional';

  @override
  String get buyAdvantageTitle02 => 'Certificação Institucional';

  @override
  String get buyAdvantageTitle03 => 'Curso 100% online';

  @override
  String get buyAdvantageTitle04 => 'Corpo Docente Qualificado';
}
