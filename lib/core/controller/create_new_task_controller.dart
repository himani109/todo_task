import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/core/model/todo_model.dart';
import '../../global.dart';

class CreateNewTaskController extends GetxController {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final RxInt nameLength = 60.obs;
  final RxInt desLength = 500.obs;

  void saveTask() {
    if (taskNameController.text.isNotEmpty && desController.text.isNotEmpty) {
      Global.boardList[0].toDOList?.add(
        TodoModel(
          name: taskNameController.text,
          description: desController.text,
          time: DateTime.now(),
          chatList: RxList([]),
        ),
      );
      Get.back();
    }
  }
}
