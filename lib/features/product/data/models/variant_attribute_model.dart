import '../../domain/entities/variant_attribute.dart';

class VariantAttributeModel extends VariantAttribute {
  const VariantAttributeModel({
    required super.attributeId,
    required super.valueId,
    required super.attributeName,
    required super.value,
  });

  factory VariantAttributeModel.fromJson(Map<String, dynamic> json) {
    final attributeValueJson = json['attribute_values'] as Map<String, dynamic>;
    final attribute = attributeValueJson['attribute'] as Map<String, dynamic>;

    return VariantAttributeModel(
      attributeId: attributeValueJson['attribute_id'] as String,
      valueId: attributeValueJson['id'] as String,
      attributeName: Map<String, dynamic>.from(attribute['name']),
      value: Map<String, dynamic>.from(attributeValueJson['value']),
    );
  }
}
