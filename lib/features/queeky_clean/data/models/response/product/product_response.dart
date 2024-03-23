// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../category/category.dart';

part 'product_response.freezed.dart';

part 'product_response.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required double price,
    int? quantity,
    Category? category,
    String? description,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.empty() => const Product(
        id: '',
        name: '',
        price: 0,
      );
}
