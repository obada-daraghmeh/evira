import 'package:equatable/equatable.dart';

import '../../../../core/utils/helpers/locale_helper.dart';

class AttributeValue extends Equatable {
  final String id;
  final String attributeId;
  final Map<String, dynamic> value;

  const AttributeValue({
    required this.id,
    required this.attributeId,
    required this.value,
  });

  @override
  List<Object?> get props => [id, attributeId, value];

  String getLocalizedValue(String locale) =>
      LocaleHelper.localizedValue(value, locale);
}
