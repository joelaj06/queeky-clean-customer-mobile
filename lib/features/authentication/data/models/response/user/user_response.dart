// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_response.freezed.dart';

part 'user_response.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    String? image,
    String? phone,
    String? email,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  factory User.empty() => const User(id: 0, name: '', );

}
