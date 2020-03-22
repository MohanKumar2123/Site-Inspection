class TaskModel {
  int status;
  String msg;
  List<Data> data;

  TaskModel({this.status, this.msg, this.data});

  TaskModel.fromJson(Map<String, dynamic> json) {
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
  int notStatedYet;
  int progress;
  int complete;
  String taskName;

  Data({this.notStatedYet, this.progress, this.complete, this.taskName});

  Data.fromJson(Map<String, dynamic> json) {
    notStatedYet = json['not_stated_yet'];
    progress = json['progress'];
    complete = json['complete'];
    taskName = json['task_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['not_stated_yet'] = this.notStatedYet;
    data['progress'] = this.progress;
    data['complete'] = this.complete;
    data['task_name'] = this.taskName;
    return data;
  }
}
