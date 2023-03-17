import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String firstName,
    required String lastName,
    required String emailId,
    @Default(false) bool isActive,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

List<UserModel> userList = [
  const UserModel(
        firstName: "Jyodesh",
        lastName: "Shakya",
        emailId: "Jyodeshshakya@gmail.com"),
        const UserModel(
        firstName: "asdasd",
        lastName: "asdasd",
        emailId: "asdasd@gmail.com"),
        const UserModel(
        firstName: "dfgdf",
        lastName: "dfgdg",
        emailId: "dfgfdg@gmail.com")
];
