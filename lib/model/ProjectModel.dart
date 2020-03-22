class ProjectModel {
  int status;
  String msg;
  List<Data> data;

  ProjectModel({this.status, this.msg, this.data});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String projId;
  String orgId;
  String clientId;
  String projName;
  String projDesc;
  String projBudget;
  String datetimeFrom;
  String datetimeTo;
  String remarks;
  String status;
  String location;
  String createdOn;
  String createdBy;
  String progress;
  String taskcount;
  String taskcomplete;
  String taskpending;
  String leadcount;
  String siteinspcount;
  String projimage;
  List<Projectleads> projectleads;

  Data(
      {this.projId,
      this.orgId,
      this.clientId,
      this.projName,
      this.projDesc,
      this.projBudget,
      this.datetimeFrom,
      this.datetimeTo,
      this.remarks,
      this.status,
      this.location,
      this.createdOn,
      this.createdBy,
      this.progress,
      this.taskcount,
      this.taskcomplete,
      this.taskpending,
      this.leadcount,
      this.siteinspcount,
      this.projimage,
      this.projectleads});

  Data.fromJson(Map<String, dynamic> json) {
    projId = json['proj_id'];
    orgId = json['org_id'];
    clientId = json['client_id'];
    projName = json['proj_name'];
    projDesc = json['proj_desc'];
    projBudget = json['proj_budget'];
    datetimeFrom = json['datetime_from'];
    datetimeTo = json['datetime_to'];
    remarks = json['remarks'];
    status = json['status'];
    location = json['location'];
    createdOn = json['created_on'];
    createdBy = json['created_by'];
    progress = json['progress'];
    taskcount = json['taskcount'];
    taskcomplete = json['taskcomplete'];
    taskpending = json['taskpending'];
    leadcount = json['leadcount'];
    siteinspcount = json['siteinspcount'];
    projimage = json['projimage'];
    if (json['projectleads'] != null) {
      projectleads = new List<Projectleads>();
      json['projectleads'].forEach((v) {
        projectleads.add(new Projectleads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proj_id'] = this.projId;
    data['org_id'] = this.orgId;
    data['client_id'] = this.clientId;
    data['proj_name'] = this.projName;
    data['proj_desc'] = this.projDesc;
    data['proj_budget'] = this.projBudget;
    data['datetime_from'] = this.datetimeFrom;
    data['datetime_to'] = this.datetimeTo;
    data['remarks'] = this.remarks;
    data['status'] = this.status;
    data['location'] = this.location;
    data['created_on'] = this.createdOn;
    data['created_by'] = this.createdBy;
    data['progress'] = this.progress;
    data['taskcount'] = this.taskcount;
    data['taskcomplete'] = this.taskcomplete;
    data['taskpending'] = this.taskpending;
    data['leadcount'] = this.leadcount;
    data['siteinspcount'] = this.siteinspcount;
    data['projimage'] = this.projimage;
    if (this.projectleads != null) {
      data['projectleads'] = this.projectleads.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projectleads {
  String id;
  String name;
  String photo;
  String email;
  String phone;

  Projectleads({this.id, this.name, this.photo, this.email, this.phone});

  Projectleads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
