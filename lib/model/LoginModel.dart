class LoginModel {
  int status;
  String msg;
  String token;
  Data data;

  LoginModel({this.status, this.msg, this.token, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String token;
  String orgId;
  String empId;
  String fullname;
  String email;
  String phone;
  String status;
  String rolename;
  String photo;

  Data(
      {this.token,
      this.orgId,
      this.empId,
      this.fullname,
      this.email,
      this.phone,
      this.status,
      this.rolename,
      this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    orgId = json['org_id'];
    empId = json['emp_id'];
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    rolename = json['rolename'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['org_id'] = this.orgId;
    data['emp_id'] = this.empId;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['rolename'] = this.rolename;
    data['photo'] = this.photo;
    return data;
  }
}
