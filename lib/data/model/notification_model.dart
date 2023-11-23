class NotificationModel {
  String? notificationId;
  String? notificationUserId;
  String? notificationTitle;
  String? notificationBody;
  String? notificationDateTime;

  NotificationModel({
    this.notificationId,
    this.notificationUserId,
    this.notificationTitle,
    this.notificationBody,
    this.notificationDateTime,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationUserId = json['notification_user_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationDateTime = json['notification_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    data['notification_user_id'] = notificationUserId;
    data['notification_title'] = notificationTitle;
    data['notification_body'] = notificationBody;
    data['notification_date_time'] = notificationDateTime;
    return data;
  }
}
