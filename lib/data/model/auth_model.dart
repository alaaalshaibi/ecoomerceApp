class AuthModel {
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  String? usersVerifyCode;
  String? usersApprove;
  String? usersCreate;
  String? usersPassword;

  AuthModel(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPhone,
      this.usersVerifyCode,
      this.usersApprove,
      this.usersCreate,
      this.usersPassword});

  AuthModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerifyCode = json['users_verify_code'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    usersPassword = json['users_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['users_verify_code'] = usersVerifyCode;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    data['users_password'] = usersPassword;
    return data;
  }
}
