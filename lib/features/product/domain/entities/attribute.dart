import 'package:equatable/equatable.dart';

import '../../../../core/utils/helpers/locale_helper.dart';
import 'attribute_value.dart';

class Attribute extends Equatable {
  final String id;
  final Map<String, dynamic> name;
  final List<AttributeValue> values;

  const Attribute({required this.id, required this.name, required this.values});

  @override
  List<Object?> get props => [id, name, values];

  String getLocalizedName(String locale) =>
      LocaleHelper.localizedValue(name, locale);
}
