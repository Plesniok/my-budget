import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  String? uid;
  String? email;

  UserData({
    required this.uid,
    required this.email,
  });

  // UserData.fromJson(Map json, String? jsonCompanyName) {
  //   id = json["id"];
  //   name = json["name"];
  //   surname = json["surname"];
  //   email = json["email"];
  //   phoneNumber = json["phoneNumber"];
  //   companyId = json["companyId"];
  //   companyName = jsonCompanyName;
  //   position = json["position"];
  //   role = json["role"];
  // }

  @override
  List<Object?> get props => [];
}
