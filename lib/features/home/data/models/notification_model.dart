class NotificationsModel {
  int? notificationId;
  String? notificationTitle;
  String? notificationBody;
  int? notificationUserid;
  String? notificationDatetime;

  NotificationsModel({
    this.notificationId,
    this.notificationTitle,
    this.notificationBody,
    this.notificationUserid,
    this.notificationDatetime,
  });

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notificationId = int.parse(json['notification_id'].toString());
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationUserid = json['notification_userid'];
    notificationDatetime = json['notification_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    data['notification_title'] = notificationTitle;
    data['notification_body'] = notificationBody;
    data['notification_userid'] = notificationUserid;
    data['notification_datetime'] = notificationDatetime;
    return data;
  }
}
