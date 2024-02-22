// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response.freezed.dart';

part 'product_response.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required double price,
    required int quantity,
    String? description,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.empty() => const Product(
        id: 0,
        name: '',
        price: 0,
        quantity: 0,
      );
}
