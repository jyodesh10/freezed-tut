// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      emailId: json['emailId'] as String,
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'emailId': instance.emailId,
      'isActive': instance.isActive,
    };
