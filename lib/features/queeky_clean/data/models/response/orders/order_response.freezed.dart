// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_code')
  String get orderCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  double get totalPrice => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  List<Product> get items => throw _privateConstructorUsedError;
  User get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_type')
  String? get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_date')
  String? get pickupDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date')
  String? get deliveryDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'coupon_code')
  String? get couponCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_code') String orderCode,
      @JsonKey(name: 'total_price') double totalPrice,
      double? discount,
      String? note,
      List<Product> items,
      User customer,
      @JsonKey(name: 'discount_type') String? discountType,
      @JsonKey(name: 'pickup_date') String? pickupDate,
      @JsonKey(name: 'delivery_date') String? deliveryDate,
      String status,
      @JsonKey(name: 'coupon_code') String? couponCode});

  $UserCopyWith<$Res> get customer;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderCode = null,
    Object? totalPrice = null,
    Object? discount = freezed,
    Object? note = freezed,
    Object? items = null,
    Object? customer = null,
    Object? discountType = freezed,
    Object? pickupDate = freezed,
    Object? deliveryDate = freezed,
    Object? status = null,
    Object? couponCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderCode: null == orderCode
          ? _value.orderCode
          : orderCode // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupDate: freezed == pickupDate
          ? _value.pickupDate
          : pickupDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: freezed == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get customer {
    return $UserCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'order_code') String orderCode,
      @JsonKey(name: 'total_price') double totalPrice,
      double? discount,
      String? note,
      List<Product> items,
      User customer,
      @JsonKey(name: 'discount_type') String? discountType,
      @JsonKey(name: 'pickup_date') String? pickupDate,
      @JsonKey(name: 'delivery_date') String? deliveryDate,
      String status,
      @JsonKey(name: 'coupon_code') String? couponCode});

  @override
  $UserCopyWith<$Res> get customer;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderCode = null,
    Object? totalPrice = null,
    Object? discount = freezed,
    Object? note = freezed,
    Object? items = null,
    Object? customer = null,
    Object? discountType = freezed,
    Object? pickupDate = freezed,
    Object? deliveryDate = freezed,
    Object? status = null,
    Object? couponCode = freezed,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderCode: null == orderCode
          ? _value.orderCode
          : orderCode // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupDate: freezed == pickupDate
          ? _value.pickupDate
          : pickupDate // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      couponCode: freezed == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl extends _Order {
  const _$OrderImpl(
      {required this.id,
      @JsonKey(name: 'order_code') required this.orderCode,
      @JsonKey(name: 'total_price') required this.totalPrice,
      this.discount,
      this.note,
      required final List<Product> items,
      required this.customer,
      @JsonKey(name: 'discount_type') this.discountType,
      @JsonKey(name: 'pickup_date') this.pickupDate,
      @JsonKey(name: 'delivery_date') this.deliveryDate,
      required this.status,
      @JsonKey(name: 'coupon_code') this.couponCode})
      : _items = items,
        super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_code')
  final String orderCode;
  @override
  @JsonKey(name: 'total_price')
  final double totalPrice;
  @override
  final double? discount;
  @override
  final String? note;
  final List<Product> _items;
  @override
  List<Product> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final User customer;
  @override
  @JsonKey(name: 'discount_type')
  final String? discountType;
  @override
  @JsonKey(name: 'pickup_date')
  final String? pickupDate;
  @override
  @JsonKey(name: 'delivery_date')
  final String? deliveryDate;
  @override
  final String status;
  @override
  @JsonKey(name: 'coupon_code')
  final String? couponCode;

  @override
  String toString() {
    return 'Order(id: $id, orderCode: $orderCode, totalPrice: $totalPrice, discount: $discount, note: $note, items: $items, customer: $customer, discountType: $discountType, pickupDate: $pickupDate, deliveryDate: $deliveryDate, status: $status, couponCode: $couponCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderCode, orderCode) ||
                other.orderCode == orderCode) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.pickupDate, pickupDate) ||
                other.pickupDate == pickupDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderCode,
      totalPrice,
      discount,
      note,
      const DeepCollectionEquality().hash(_items),
      customer,
      discountType,
      pickupDate,
      deliveryDate,
      status,
      couponCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order extends Order {
  const factory _Order(
      {required final String id,
      @JsonKey(name: 'order_code') required final String orderCode,
      @JsonKey(name: 'total_price') required final double totalPrice,
      final double? discount,
      final String? note,
      required final List<Product> items,
      required final User customer,
      @JsonKey(name: 'discount_type') final String? discountType,
      @JsonKey(name: 'pickup_date') final String? pickupDate,
      @JsonKey(name: 'delivery_date') final String? deliveryDate,
      required final String status,
      @JsonKey(name: 'coupon_code') final String? couponCode}) = _$OrderImpl;
  const _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_code')
  String get orderCode;
  @override
  @JsonKey(name: 'total_price')
  double get totalPrice;
  @override
  double? get discount;
  @override
  String? get note;
  @override
  List<Product> get items;
  @override
  User get customer;
  @override
  @JsonKey(name: 'discount_type')
  String? get discountType;
  @override
  @JsonKey(name: 'pickup_date')
  String? get pickupDate;
  @override
  @JsonKey(name: 'delivery_date')
  String? get deliveryDate;
  @override
  String get status;
  @override
  @JsonKey(name: 'coupon_code')
  String? get couponCode;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
