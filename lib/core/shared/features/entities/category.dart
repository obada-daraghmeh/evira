import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String? parentId;
  final Map<String, dynamic> name;
  final String slug;
  final Map<String, dynamic>? description;
  final int? sortOrder;
  final bool? isActive;
  final bool? isFeatured;
  final String iconUrl;
  final String? imageUrl;

  const Category({
    required this.id,
    this.parentId,
    required this.name,
    required this.slug,
    this.description,
    this.sortOrder,
    this.isActive,
    this.isFeatured,
    required this.iconUrl,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
    id,
    parentId,
    name,
    slug,
    description,
    sortOrder,
    isActive,
    isFeatured,
    iconUrl,
    imageUrl,
  ];

  String localizedName(String locale) => name[locale] ?? name['en'] ?? '';
}
