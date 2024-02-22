// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:queeky_clean/features/authentication/data/models/response/user/user_response.dart';
import 'package:queeky_clean/features/queeky_clean/data/models/response/product/product_response.dart';

part 'order_response.freezed.dart';

part 'order_response.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    @JsonKey(name: 'order_code') required String orderCode,
    @JsonKey(name: 'total_price') required double totalPrice,
    double? discount,
    String? note,
    required List<Product> items,
    required User customer,
    @JsonKey(name: 'discount_type') String? discountType,
    @JsonKey(name: 'pickup_date') String? pickupDate,
    @JsonKey(name: 'delivery_date') String? deliveryDate,
    required String status,
    @JsonKey(name: 'coupon_code') String? couponCode,
  }) = _Order;

  const Order._();

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  factory Order.empty() =>  Order(
        id: 0,
        customer: User.empty(),
        orderCode: '',
        status: '', totalPrice: 0, items: <Product>[],
      );
}
