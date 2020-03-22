class ContactModel {
  int status;
  String msg;
  List<ContactData> contactdata;

  ContactModel({this.status, this.msg, this.contactdata});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      contactdata = new List<ContactData>();
      json['data'].forEach((v) {
        contactdata.add(new ContactData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.contactdata != null) {
      data['data'] = this.contactdata.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactData {
  String empId;
  String orgId;
  String fullname;
  String userName;
  String email;
  String phone;
  String address;
  String idProofName;
  String idProofNum;
  String bloodGroup;
  String role;
  String photo;
  String userSignon;
  String verifyType;
  String country;
  String state;
  String city;
  String remuType;
  String status;
  String ipAddress;
  String password;
  String createdOn;
  String createdBy;

  ContactData(
      {this.empId,
      this.orgId,
      this.fullname,
      this.userName,
      this.email,
      this.phone,
      this.address,
      this.idProofName,
      this.idProofNum,
      this.bloodGroup,
      this.role,
      this.photo,
      this.userSignon,
      this.verifyType,
      this.country,
      this.state,
      this.city,
      this.remuType,
      this.status,
      this.ipAddress,
      this.password,
      this.createdOn,
      this.createdBy});

  ContactData.fromJson(Map<String, dynamic> json) {
    empId = json['emp_id'];
    orgId = json['org_id'];
    fullname = json['fullname'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    idProofName = json['id_proof_name'];
    idProofNum = json['id_proof_num'];
    bloodGroup = json['blood_group'];
    role = json['role'];
    photo = json['photo'];
    userSignon = json['user_signon'];
    verifyType = json['verify_type'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    remuType = json['remu_type'];
    status = json['status'];
    ipAddress = json['ip_address'];
    password = json['password'];
    createdOn = json['created_on'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_id'] = this.empId;
    data['org_id'] = this.orgId;
    data['fullname'] = this.fullname;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['id_proof_name'] = this.idProofName;
    data['id_proof_num'] = this.idProofNum;
    data['blood_group'] = this.bloodGroup;
    data['role'] = this.role;
    data['photo'] = this.photo;
    data['user_signon'] = this.userSignon;
    data['verify_type'] = this.verifyType;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['remu_type'] = this.remuType;
    data['status'] = this.status;
    data['ip_address'] = this.ipAddress;
    data['password'] = this.password;
    data['created_on'] = this.createdOn;
    data['created_by'] = this.createdBy;
    return data;
  }
}
