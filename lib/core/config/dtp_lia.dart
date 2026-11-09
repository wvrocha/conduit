/// Configuração de distribuição do app **LIA** (projeto DTP LIA).
///
/// Fork do Conduit mantido pela Dataprev para acesso interno à LIA.
/// Tudo que separa esta distribuição do projeto original fica aqui, para que
/// um rebase no upstream seja previsível: se o conflito aparecer, é porque
/// algum destes pontos mudou.
class DtpLiaConfig {
  const DtpLiaConfig._();

  /// Nome exibido do app (launcher, título das janelas, notificações).
  static const String appName = 'LIA';

  /// Servidor Open WebUI já configurado na primeira execução.
  /// O usuário cai direto no SSO Keycloak da Dataprev, sem digitar endereço.
  static const String defaultServerUrl = 'https://lia.dataprev.gov.br';

  /// Idioma padrão do app.
  static const String defaultLocaleLanguage = 'pt';
  static const String defaultLocaleCountry = 'BR';

  /// Seções de apoio financeiro ao projeto original (doações) e de avaliação
  /// na loja. Desligadas: esta é uma distribuição interna, não publicada.
  static const bool showSupportSection = false;
  static const bool showStoreReviewAction = false;

  /// Crédito institucional exibido no splash e na tela "Sobre".
  static const String institutionalCredit = 'Uma solução Dataprev';
}
