import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  int? usersId;
  @HiveField(1)
  String? usersName;
  @HiveField(2)
  String? usersPassword;
  @HiveField(3)
  String? usersEmail;
  @HiveField(4)
  String? usersPhone;
  @HiveField(5)
  int? usersVerifycode;
  @HiveField(6)
  int? usersApprove;
  @HiveField(7)
  String? usersCreate;

  User({
    this.usersId,
    this.usersName,
    this.usersPassword,
    this.usersEmail,
    this.usersPhone,
    this.usersVerifycode,
    this.usersApprove,
    this.usersCreate,
  });

  User.fromJson(Map<String, dynamic> json) {
    // Convert 'users_id' from String to int
    usersId = int.tryParse(json['users_id'].toString());
    usersName = json['users_name'];
    usersPassword = json['users_password'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    // Convert 'users_verifycode' from String to int
    usersVerifycode = int.tryParse(json['users_verifycode'].toString());
    // Convert 'users_approve' from String to int
    usersApprove = int.tryParse(json['users_approve'].toString());
    usersCreate = json['users_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_password'] = usersPassword;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['users_verifycode'] = usersVerifycode;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    return data;
  }
}
