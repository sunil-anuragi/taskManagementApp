// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
    int code;
    String msg;
    String msgDetail;
    dynamic data;

    ErrorModel({
        required this.code,
        required this.msg,
        required this.msgDetail,
        required this.data,
    });

    factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        code: json["code"],
        msg: json["msg"],
        msgDetail: json["msg_detail"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "msg_detail": msgDetail,
        "data": data,
    };
}
