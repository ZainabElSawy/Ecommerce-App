class User {
  int? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  int? usersVerifycode;
  int? usersApprove;
  String? usersCreate;

  User(
      {this.usersId,
      this.usersName,
      this.usersPassword,
      this.usersEmail,
      this.usersPhone,
      this.usersVerifycode,
      this.usersApprove,
      this.usersCreate});

  User.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersPassword = json['users_password'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
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