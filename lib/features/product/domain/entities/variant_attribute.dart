import 'package:equatable/equatable.dart';

import '../../../../core/utils/helpers/locale_helper.dart';

/// `Class to combine attribute with its value`

class VariantAttribute extends Equatable {
  final String attributeId;
  final String valueId;
  final Map<String, dynamic> attributeName;
  final Map<String, dynamic> value;

  const VariantAttribute({
    required this.attributeId,
    required this.valueId,
    required this.attributeName,
    required this.value,
  });

  String getLocalizedAttribute(String locale) =>
      LocaleHelper.localizedValue(attributeName, locale);

  String getLocalizedValue(String locale) =>
      LocaleHelper.localizedValue(value, locale);

  @override
  List<Object?> get props => [attributeId, attributeName, valueId, value];
}
