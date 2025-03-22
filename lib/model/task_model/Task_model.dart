import 'dart:convert';

List<Taskmodel> taskmodelFromJson(String str) =>
    List<Taskmodel>.from(json.decode(str).map((x) => Taskmodel.fromJson(x)));

String taskmodelToJson(List<Taskmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Taskmodel {
  int taskId;
  String taskName;
  DateTime createdDate;
  DateTime updatedDate;
  String taskDetails;
  bool isFavourite;

  Taskmodel({
    required this.taskId,
    required this.taskName,
    required this.createdDate,
    required this.updatedDate,
    required this.taskDetails,
    required this.isFavourite,
  });

  factory Taskmodel.fromJson(Map<String, dynamic> json) => Taskmodel(
        taskId: json["task_id"],
        taskName: json["task_name"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        taskDetails: json["task_details"],
        isFavourite: json["is_favourite"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "task_name": taskName,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "task_details": taskDetails,
        "is_favourite": isFavourite,
      };
}
