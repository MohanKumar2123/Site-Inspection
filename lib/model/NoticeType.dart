class NoticeTypeModel {
  int status;
  String msg;
  List<NoticeTypeData> noticeTypeData;
  
 
  NoticeTypeModel({this.status, this.msg, this.noticeTypeData});

  NoticeTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      noticeTypeData = new List<NoticeTypeData>();
      json['data'].forEach((v) {
        noticeTypeData.add(new NoticeTypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.noticeTypeData != null) {
      data['data'] = this.noticeTypeData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NoticeTypeData {
  String nottypeId;
  String nottypeName;

  NoticeTypeData({this.nottypeId, this.nottypeName});

  NoticeTypeData.fromJson(Map<String, dynamic> json) {
    nottypeId = json['nottype_id'];
    nottypeName = json['nottype_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nottype_id'] = this.nottypeId;
    data['nottype_name'] = this.nottypeName;
    return data;
  }
}
