import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/core/controller/create_new_task_controller.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';

import '../../../main.dart';

class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({super.key});

  @override
  State<CreateNewTaskScreen> createState() => _CreateNewTaskScreenState();
}

class _CreateNewTaskScreenState extends State<CreateNewTaskScreen> {
  final controller = Get.put(CreateNewTaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColor.cWhite,
              )),
          backgroundColor: appColor.value,
          title: Text(
            "create_new_task".tr,
            style: pMedium16.copyWith(color: AppColor.cWhite),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'title'.tr,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              Obx(
                () => TextField(
                  maxLength: 60,
                  controller: controller.taskNameController,
                  decoration: InputDecoration(
                    labelStyle: pRegular12,
                    suffixText: '${controller.nameLength.value}',
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    counter: const Text(''),
                  ),
                  onChanged: (value) {
                    controller.nameLength.value = 60 - value.length;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'description'.tr,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              Obx(
                () => TextField(
                  controller: controller.desController,
                  maxLength: 500, // Maximum length for the text field
                  decoration: InputDecoration(
                    counter: const Text(''),
                    labelStyle: pRegular12,
                    suffixText: '${controller.desLength.value}',
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                  ),
                  onChanged: (value) {
                    controller.desLength.value = 500 - value.length;
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Obx(
          () => FloatingActionButton.extended(
            onPressed: () {
              controller.saveTask();
            },
            backgroundColor: (controller.desLength.value != 500 &&
                    controller.nameLength.value != 60)
                ? appColor.value
                : Colors.grey.shade200,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            icon: Icon(
              Icons.add,
              color: (controller.desLength.value != 500 &&
                      controller.nameLength.value != 60)
                  ? Colors.white
                  : Colors.black38,
            ),
            label: Text(
              'create'.tr,
              style: TextStyle(
                color: (controller.desLength.value != 500 &&
                        controller.nameLength.value != 60)
                    ? Colors.white
                    : Colors.black38,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
