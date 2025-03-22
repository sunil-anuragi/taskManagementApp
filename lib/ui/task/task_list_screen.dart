import 'package:flutter/material.dart';
import 'package:jewellery/common/helper/date_time_helper.dart';
import 'package:jewellery/common/widgets/no_data_found/no_data_found.dart';
import 'package:jewellery/common/widgets/task_card/task_card.dart';
import 'package:jewellery/common/widgets/text/custom_text.dart';
import 'package:jewellery/common/widgets/textFields/app_text_field.dart';
import 'package:jewellery/consts/app_const.dart';
import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/consts/extensions.dart';
import 'package:get/get.dart';
import 'package:jewellery/consts/route_const.dart';
import 'package:jewellery/controller/task_controller.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColorConsts.appBackgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(RouteConst.addTaskScreen)!.then((value) {
            if (value == true) {
              taskController.getallTask();
            }
          });
        },
        backgroundColor: AppColorConsts.primaryColor,
        label: CustomText(
          AppConst.addTask,
          style: AppTextStyle.semiBold14TextStyle
              .copyWith(color: AppColorConsts.whiteColor),
        ),
        icon: const Icon(
          Icons.add_circle_sharp,
          color: AppColorConsts.whiteColor,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await taskController.getallTask();
        },
        child: CustomScrollView(
          slivers: [
            /// **🔹 Sliver App Bar with Title & Search**
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: screenHeight * 0.2,
              backgroundColor: AppColorConsts.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:const EdgeInsets.only(left: 20, bottom: 15),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      AppConst.appName,
                      style: AppTextStyle.bold18TextStyle.copyWith(
                        color: AppColorConsts.whiteColor,
                      ),
                    ),
                    50.vs,
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppTextField1(
                    isRequired: false,
                    hint: AppConst.search,
                    prefix: const Icon(Icons.search)
                        .paddingSymmetric(horizontal: 15),
                    borderRadius: BorderRadius.circular(10),
                    fillColor: AppColorConsts.whiteColor,
                    fontSize: 16,
                    isshadow: true,
                    onChanged: (value) {
                      taskController.searchtask(value);
                    },
                    borderColor: AppColorConsts.transparentColor,
                    labelTextStyle: AppTextStyle.medium12TextStyle.copyWith(
                      color: AppColorConsts.greyColor1,
                    ),
                  ),
                ),
              ),
            ),

            /// **🔹 Task List (SliverList)**
            Obx(() {
              if (taskController.loadingTaskList.value) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (taskController.searchTasklist.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: NoDataFound(text: "No task Found")),
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final task = taskController.searchTasklist[index];
                      return TaskCard(
                        title: task.taskName,
                        description: task.taskDetails,
                        date: task.createdDate
                            .formatDate(outFormat: 'yyyy-MM-dd hh:mm a')
                            .toString(),
                        isCompleted: task.isFavourite,
                      ).paddingOnly(bottom: 10).onTap(() {
                        Get.delete<TaskController>();
                        Get.toNamed(RouteConst.addTaskScreen, arguments: {
                          "id": task.taskId,
                          "taskName": task.taskName,
                          "taskDetails": task.taskDetails,
                          "isfav": task.isFavourite,
                        })!
                            .then((value) {
                          if (value == true) {
                            taskController.getallTask();
                          }
                        });
                      });
                    },
                    childCount: taskController.searchTasklist.length,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
