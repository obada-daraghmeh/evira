import '../../domain/entities/attribute.dart';
import 'attribute_value_model.dart';

class AttributeModel extends Attribute {
  const AttributeModel({
    required super.id,
    required super.name,
    required super.values,
  });

  factory AttributeModel.fromJson(Map<String, dynamic> json) {
    final values = (json['values'] as List<dynamic>)
        .map((e) => AttributeValueModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return AttributeModel(
      id: json['id'] as String,
      name: json['name'] as Map<String, dynamic>,
      values: values,
    );
  }
}
