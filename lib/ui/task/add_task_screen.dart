import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery/common/widgets/buttons/app_button.dart';
import 'package:jewellery/common/widgets/switch/custom_switch.dart';
import 'package:jewellery/common/widgets/text/custom_text.dart';
import 'package:jewellery/common/widgets/textFields/app_text_field.dart';
import 'package:jewellery/consts/app_const.dart';
import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/consts/extensions.dart';
import 'package:jewellery/consts/image_constants.dart';
import 'package:jewellery/controller/task_controller.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TaskController taskController = Get.put(TaskController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConsts.appBackgroundColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              60.vs,
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(ImageConstant.createTaks,)),
              10.vs,
              CustomText(
                Get.arguments == null
                    ? AppConst.addNewTask
                    : AppConst.updatehereTask,
                style: AppTextStyle.semiBold20TextStyle,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 40),
              30.vs,
              AppTextField1(
                isRequired: false,
                labelText: AppConst.taskName,
                hint: AppConst.taskName,
                borderRadius: BorderRadius.circular(7),
                fillColor: AppColorConsts.textFieldColor.withOpacity(0.4),
                fontSize: 16,
                controller: taskController.taskname,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppConst.please + AppConst.enter + AppConst.taskName;
                  }
                  return null;
                },
                borderColor: AppColorConsts.borderColor1,
                labelTextStyle: AppTextStyle.medium14TextStyle.copyWith(
                  color: AppColorConsts.primaryColor,
                ),
              ),
              10.vs,
              AppTextField1(
                isRequired: false,
                labelText: AppConst.taskDetail + AppConst.optional,
                hint: AppConst.taskDetail,
                borderRadius: BorderRadius.circular(7),
                fillColor: AppColorConsts.textFieldColor.withOpacity(0.4),
                fontSize: 16,
                maxLines: 4,
                controller: taskController.taskDetails,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return AppConst.please + AppConst.enter + AppConst.taskDetail;
                //   }
                //   return null;
                // },
                borderColor: AppColorConsts.borderColor1,
                labelTextStyle: AppTextStyle.medium14TextStyle.copyWith(
                  color: AppColorConsts.primaryColor,
                ),
              ),
              10.vs,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText("Favourite",style: AppTextStyle.medium15TextStyle,),
                  Obx(
                    () => CustomSwitch(
                        value: taskController.isFav.value,
                        onChanged: (bool value) {
                          setState(() {
                            if (taskController.isFav.value == false) {
                              taskController.isFav.value = true;
                            } else {
                              taskController.isFav.value = false;
                            }
                          });
                        }),
                  ),
                ],
              ),
              10.vs,
              Obx(
                () => AppButton(
                  buttonName: Get.arguments == null
                      ? AppConst.addTask
                      : AppConst.updateTask,
                  loading: taskController.isLoading.value,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      taskController.addUpdateTask(Get.arguments != null
                          ? taskController.taskId.value
                          : null,taskController.isFav.value);
                    }
                  },
                  backgroundColor: AppColorConsts.primaryColor,
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}
