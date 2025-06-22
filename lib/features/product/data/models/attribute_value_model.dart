import '../../domain/entities/attribute_value.dart';

class AttributeValueModel extends AttributeValue {
  const AttributeValueModel({
    required super.id,
    required super.attributeId,
    required super.value,
  });

  factory AttributeValueModel.fromJson(Map<String, dynamic> json) {
    return AttributeValueModel(
      id: json['id'] as String,
      attributeId: json['attribute_id'] as String,
      value: json['value'] as Map<String, dynamic>,
    );
  }
}
