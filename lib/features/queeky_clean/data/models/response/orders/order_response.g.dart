// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as int,
      orderCode: json['order_code'] as String,
      totalPrice: (json['total_price'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      note: json['note'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      customer: User.fromJson(json['customer'] as Map<String, dynamic>),
      discountType: json['discount_type'] as String?,
      pickupDate: json['pickup_date'] as String?,
      deliveryDate: json['delivery_date'] as String?,
      status: json['status'] as String,
      couponCode: json['coupon_code'] as String?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_code': instance.orderCode,
      'total_price': instance.totalPrice,
      'discount': instance.discount,
      'note': instance.note,
      'items': instance.items,
      'customer': instance.customer,
      'discount_type': instance.discountType,
      'pickup_date': instance.pickupDate,
      'delivery_date': instance.deliveryDate,
      'status': instance.status,
      'coupon_code': instance.couponCode,
    };
