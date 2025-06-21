class LocaleHelper {
  static String localizedValue(
    Map<String, dynamic>? json,
    String locale, {
    String fallback = 'en',
  }) {
    if (json == null) return '';
    return json[locale] ?? json[fallback] ?? json.values.firstOrNull ?? '';
  }
}
