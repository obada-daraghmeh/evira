import 'package:equatable/equatable.dart';

import '../../../../core/utils/helpers/locale_helper.dart';

class Brand extends Equatable {
  final String id;
  final Map<String, dynamic> name;
  final String slug;
  final Map<String, dynamic>? description;
  final bool? isActive;
  final String logoUrl;

  const Brand({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    this.isActive,
    required this.logoUrl,
  });

  @override
  List<Object?> get props => [id, name, slug, description, isActive, logoUrl];

  String getLocalizedName(String locale) =>
      LocaleHelper.localizedValue(name, locale);

  String getLocalizedDescription(String locale) =>
      LocaleHelper.localizedValue(description, locale);
}
