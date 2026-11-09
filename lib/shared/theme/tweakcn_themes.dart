import 'package:conduit_theme/conduit_theme.dart' as core;
import 'package:conduit/l10n/app_localizations.dart';
import 'package:material_ui/material_ui.dart';

/// Flutter-side adapter over `package:conduit_theme`.
///
/// The palette numbers live in `conduit_theme` as plain ARGB integers so the
/// desktop UI can generate CSS from the same source. This file exists
/// only to wrap them in `Color` and to attach the localization closures that a
/// pure-Dart package cannot hold. Adding or tweaking a palette means editing
/// `packages/conduit_theme/lib/src/registry.dart`, not this file.

/// Represents a single tweakcn theme variant (light or dark) and exposes the
/// standard set of color tokens defined by the registry.
@immutable
class TweakcnThemeVariant {
  const TweakcnThemeVariant({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.popover,
    required this.popoverForeground,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.sidebarBackground,
    required this.sidebarForeground,
    required this.sidebarPrimary,
    required this.sidebarPrimaryForeground,
    required this.sidebarAccent,
    required this.sidebarAccentForeground,
    required this.sidebarBorder,
    required this.sidebarRing,
    required this.success,
    required this.successForeground,
    required this.warning,
    required this.warningForeground,
    required this.info,
    required this.infoForeground,
    this.radius = 16,
  });

  /// Wraps a pure-Dart variant's ARGB integers in [Color].
  TweakcnThemeVariant.fromCore(core.ThemeVariant variant)
    : background = Color(variant.background),
      foreground = Color(variant.foreground),
      card = Color(variant.card),
      cardForeground = Color(variant.cardForeground),
      popover = Color(variant.popover),
      popoverForeground = Color(variant.popoverForeground),
      primary = Color(variant.primary),
      primaryForeground = Color(variant.primaryForeground),
      secondary = Color(variant.secondary),
      secondaryForeground = Color(variant.secondaryForeground),
      muted = Color(variant.muted),
      mutedForeground = Color(variant.mutedForeground),
      accent = Color(variant.accent),
      accentForeground = Color(variant.accentForeground),
      destructive = Color(variant.destructive),
      destructiveForeground = Color(variant.destructiveForeground),
      border = Color(variant.border),
      input = Color(variant.input),
      ring = Color(variant.ring),
      sidebarBackground = Color(variant.sidebarBackground),
      sidebarForeground = Color(variant.sidebarForeground),
      sidebarPrimary = Color(variant.sidebarPrimary),
      sidebarPrimaryForeground = Color(variant.sidebarPrimaryForeground),
      sidebarAccent = Color(variant.sidebarAccent),
      sidebarAccentForeground = Color(variant.sidebarAccentForeground),
      sidebarBorder = Color(variant.sidebarBorder),
      sidebarRing = Color(variant.sidebarRing),
      success = Color(variant.success),
      successForeground = Color(variant.successForeground),
      warning = Color(variant.warning),
      warningForeground = Color(variant.warningForeground),
      info = Color(variant.info),
      infoForeground = Color(variant.infoForeground),
      radius = variant.radius;

  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color popover;
  final Color popoverForeground;
  final Color primary;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;
  final Color muted;
  final Color mutedForeground;
  final Color accent;
  final Color accentForeground;
  final Color destructive;
  final Color destructiveForeground;
  final Color border;
  final Color input;
  final Color ring;
  final Color sidebarBackground;
  final Color sidebarForeground;
  final Color sidebarPrimary;
  final Color sidebarPrimaryForeground;
  final Color sidebarAccent;
  final Color sidebarAccentForeground;
  final Color sidebarBorder;
  final Color sidebarRing;
  final Color success;
  final Color successForeground;
  final Color warning;
  final Color warningForeground;
  final Color info;
  final Color infoForeground;
  final double radius;
}

/// Definition of a tweakcn theme that provides both light and dark variants.
@immutable
class TweakcnThemeDefinition {
  const TweakcnThemeDefinition({
    required this.id,
    required this.labelBuilder,
    required this.descriptionBuilder,
    required this.light,
    required this.dark,
    required this.preview,
  });

  /// Adapts a registry palette, resolving its ARB keys to typed accessors.
  TweakcnThemeDefinition.fromCore(core.ThemePalette palette)
    : id = palette.id,
      labelBuilder = _labelFor(palette.labelKey),
      descriptionBuilder = _labelFor(palette.descriptionKey),
      light = TweakcnThemeVariant.fromCore(palette.light),
      dark = TweakcnThemeVariant.fromCore(palette.dark),
      preview = List<Color>.unmodifiable(palette.preview.map(Color.new));

  final String id;
  final String Function(AppLocalizations) labelBuilder;
  final String Function(AppLocalizations) descriptionBuilder;
  final TweakcnThemeVariant light;
  final TweakcnThemeVariant dark;
  final List<Color> preview;

  TweakcnThemeVariant variantFor(Brightness brightness) {
    return brightness == Brightness.dark ? dark : light;
  }

  String label(AppLocalizations l10n) => labelBuilder(l10n);

  String description(AppLocalizations l10n) => descriptionBuilder(l10n);
}

/// Maps a registry ARB key to its generated accessor.
///
/// `AppLocalizations` has no dynamic lookup, so the switch is the price of
/// keeping the keys in a Flutter-free package. A palette added to the registry
/// without a matching case fails here rather than rendering a raw key.
String Function(AppLocalizations) _labelFor(String key) {
  return switch (key) {
    'themePaletteConduitLabel' => (l10n) => l10n.themePaletteConduitLabel,
    'themePaletteConduitDescription' => (l10n) =>
      l10n.themePaletteConduitDescription,
    'themePaletteClaudeLabel' => (l10n) => l10n.themePaletteClaudeLabel,
    'themePaletteClaudeDescription' => (l10n) =>
      l10n.themePaletteClaudeDescription,
    'themePaletteT3ChatLabel' => (l10n) => l10n.themePaletteT3ChatLabel,
    'themePaletteT3ChatDescription' => (l10n) =>
      l10n.themePaletteT3ChatDescription,
    'themePaletteCatppuccinLabel' => (l10n) => l10n.themePaletteCatppuccinLabel,
    'themePaletteCatppuccinDescription' => (l10n) =>
      l10n.themePaletteCatppuccinDescription,
    'themePaletteTangerineLabel' => (l10n) => l10n.themePaletteTangerineLabel,
    'themePaletteTangerineDescription' => (l10n) =>
      l10n.themePaletteTangerineDescription,
    _ => throw ArgumentError.value(
      key,
      'key',
      'no AppLocalizations accessor; add a case when adding a palette to '
          'packages/conduit_theme',
    ),
  };
}

Color mix(Color a, Color b, double amount) {
  // No-op for testing so downstream derivations stay at the source color.
  return a;
}

/// Paleta institucional Dataprev — manual de identidade visual 2025.
///
/// Vive aqui, e não em `packages/conduit_theme`, porque é exclusiva desta
/// distribuição: o registro do pacote amarra rótulo e descrição a chaves ARB de
/// 15 idiomas, e uma paleta de fork não deve impor tradução a todos eles.
/// Cores do manual: azul institucional `#0066b3`, texto em `#262626` (o manual
/// não admite preto puro), superfícies brancas e bordas neutras.
const _dataprevLight = core.ThemeVariant(
  background: 0xFFFFFFFF,
  foreground: 0xFF262626,
  card: 0xFFFFFFFF,
  cardForeground: 0xFF262626,
  popover: 0xFFFFFFFF,
  popoverForeground: 0xFF262626,
  primary: 0xFF0066B3,
  primaryForeground: 0xFFFFFFFF,
  secondary: 0xFFE9F2F9,
  secondaryForeground: 0xFF00527F,
  muted: 0xFFF4F6F8,
  mutedForeground: 0xFF666666,
  accent: 0xFFE9F2F9,
  accentForeground: 0xFF00527F,
  destructive: 0xFFB3261E,
  destructiveForeground: 0xFFFFFFFF,
  border: 0xFFDDE4EA,
  input: 0xFFDDE4EA,
  ring: 0xFF0066B3,
  sidebarBackground: 0xFFF7F9FB,
  sidebarForeground: 0xFF262626,
  sidebarPrimary: 0xFF0066B3,
  sidebarPrimaryForeground: 0xFFFFFFFF,
  sidebarAccent: 0xFFE9F2F9,
  sidebarAccentForeground: 0xFF00527F,
  sidebarBorder: 0xFFDDE4EA,
  sidebarRing: 0xFF0066B3,
  success: 0xFF1B7A4B,
  successForeground: 0xFFFFFFFF,
  warning: 0xFF8A5A00,
  warningForeground: 0xFFFFFFFF,
  info: 0xFF0066B3,
  infoForeground: 0xFFFFFFFF,
  radius: 12,
);

const _dataprevDark = core.ThemeVariant(
  background: 0xFF1C1C1C,
  foreground: 0xFFF2F2F2,
  card: 0xFF242424,
  cardForeground: 0xFFF2F2F2,
  popover: 0xFF242424,
  popoverForeground: 0xFFF2F2F2,
  primary: 0xFF4FA8E0,
  primaryForeground: 0xFF0C2434,
  secondary: 0xFF2B3944,
  secondaryForeground: 0xFFDCE9F2,
  muted: 0xFF262626,
  mutedForeground: 0xFFB0B0B0,
  accent: 0xFF2B3944,
  accentForeground: 0xFFDCE9F2,
  destructive: 0xFFE4695E,
  destructiveForeground: 0xFF3A0E0A,
  border: 0xFF343434,
  input: 0xFF343434,
  ring: 0xFF4FA8E0,
  sidebarBackground: 0xFF171717,
  sidebarForeground: 0xFFF2F2F2,
  sidebarPrimary: 0xFF4FA8E0,
  sidebarPrimaryForeground: 0xFF0C2434,
  sidebarAccent: 0xFF2B3944,
  sidebarAccentForeground: 0xFFDCE9F2,
  sidebarBorder: 0xFF343434,
  sidebarRing: 0xFF4FA8E0,
  success: 0xFF5FBF8F,
  successForeground: 0xFF08251A,
  warning: 0xFFE0A94B,
  warningForeground: 0xFF2B1E00,
  info: 0xFF4FA8E0,
  infoForeground: 0xFF0C2434,
  radius: 12,
);

class TweakcnThemes {
  /// Paleta institucional, padrão desta distribuição.
  static final TweakcnThemeDefinition dataprev = TweakcnThemeDefinition(
    id: 'dataprev',
    labelBuilder: (_) => 'Dataprev',
    descriptionBuilder: (_) => 'Azul institucional sobre superfícies claras.',
    light: TweakcnThemeVariant.fromCore(_dataprevLight),
    dark: TweakcnThemeVariant.fromCore(_dataprevDark),
    preview: const <Color>[
      Color(0xFF0066B3),
      Color(0xFFFFFFFF),
      Color(0xFF262626),
    ],
  );

  static final TweakcnThemeDefinition conduit = _byId('conduit');
  static final TweakcnThemeDefinition claude = _byId('claude');
  static final TweakcnThemeDefinition t3Chat = _byId('t3_chat');
  static final TweakcnThemeDefinition catppuccin = _byId('catppuccin');
  static final TweakcnThemeDefinition tangerine = _byId('tangerine');

  static List<TweakcnThemeDefinition> all = [
    dataprev,
    conduit,
    claude,
    t3Chat,
    catppuccin,
    tangerine,
  ];

  static TweakcnThemeDefinition byId(String? id) {
    return all.firstWhere((theme) => theme.id == id, orElse: () => dataprev);
  }

  static TweakcnThemeDefinition _byId(String id) {
    final palette = core.paletteById(id);
    assert(
      palette.id == id,
      'packages/conduit_theme no longer defines the "$id" palette',
    );
    return TweakcnThemeDefinition.fromCore(palette);
  }
}

@immutable
class AppPaletteThemeExtension
    extends ThemeExtension<AppPaletteThemeExtension> {
  const AppPaletteThemeExtension({required this.palette});

  final TweakcnThemeDefinition palette;

  @override
  AppPaletteThemeExtension copyWith({TweakcnThemeDefinition? palette}) {
    return AppPaletteThemeExtension(palette: palette ?? this.palette);
  }

  @override
  AppPaletteThemeExtension lerp(
    covariant ThemeExtension<AppPaletteThemeExtension>? other,
    double t,
  ) {
    if (other is! AppPaletteThemeExtension) return this;
    return t < 0.5 ? this : other;
  }
}
