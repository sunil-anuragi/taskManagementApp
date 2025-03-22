import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/model/task_model/Task_model.dart';
import 'package:jewellery/rest/api_constants.dart';
import 'package:jewellery/rest/api_methods.dart';

class TaskController extends GetxController {
  RxBool loadingTaskList = false.obs;
  TextEditingController taskname = TextEditingController();
  TextEditingController taskDetails = TextEditingController();
  RxList<Taskmodel> tasklist = <Taskmodel>[].obs;
  RxList<Taskmodel> searchTasklist = <Taskmodel>[].obs;
  RxInt taskId = 0.obs;
  var isFav = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      taskId.value = Get.arguments['id'];
      taskname.text = Get.arguments['taskName'];
      taskDetails.text = Get.arguments['taskDetails'];
      isFav.value = Get.arguments['isfav'];
    }
    super.onInit();
    getallTask();
  }

  // Get all task api

  getallTask() async {
    try {
      loadingTaskList.value = true;
      http.Response response = await ApiHandler.get(
          url: ApiConstants.baseUrl + ApiConstants.retrieveTaskApi, token: '');
      loadingTaskList.value = false;

      if (response.statusCode == 200) {
        tasklist.clear();
        searchTasklist.clear();
        tasklist.value = taskmodelFromJson(response.body);
        searchTasklist.value = tasklist;
        loadingTaskList.value = false;
      } else {
        Fluttertoast.showToast(
            msg: jsonDecode(response.body)['msg_detail'].toString(),
            backgroundColor: AppColorConsts.red,
            textColor: AppColorConsts.whiteColor,
            fontSize: 16,
            timeInSecForIosWeb: 3);
        loadingTaskList.value = false;
      }
    } on Exception catch (e) {
      log(e.toString());
      loadingTaskList.value = false;
    }
  }

  RxBool isLoading = false.obs;

  // Add task Api

   addUpdateTask([id, isFav]) async {
    try {
      isLoading.value = true;

      Map<String, dynamic> updateBodyData = {
        "task_id": id,
        "task_name": taskname.text,
        "task_details": taskDetails.text,
        "is_favourite": isFav
      };
      Map<String, dynamic> bodyData = {
        "task_name": taskname.text,
        "task_details": taskDetails.text,
        "is_favourite": isFav
      };

      http.Response response = await ApiHandler.postWithoutToken(
        url: ApiConstants.baseUrl + ApiConstants.addUpdateTaskApi,
        body: id != null ? updateBodyData : bodyData,
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: responseData['message'],
          backgroundColor: AppColorConsts.green,
          textColor: AppColorConsts.whiteColor,
        );
        getallTask();
        clearAlldata();
        Get.back(result: true);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to add task",
          backgroundColor: AppColorConsts.red,
          textColor: AppColorConsts.whiteColor,
        );
      }
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
  }

  clearAlldata() {
    taskname.clear();
    taskDetails.clear();
  }

  searchtask(String query) {
    if (query.isEmpty) {
      searchTasklist.value = tasklist;
    } else {
      searchTasklist.value = tasklist
          .where((item) => (item.taskName
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())))
          .toList();
    }
  }
}
