import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/global.dart';

import '../model/board_model.dart';

class CreateBoardController extends GetxController {
  final TextEditingController boardNameController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final RxInt nameLength = 20.obs;
  final RxInt desLength = 50.obs;

  void saveData() {
    if (boardNameController.text.isNotEmpty && desController.text.isNotEmpty) {
      Global.boardList.add(BoardModel(
        name: boardNameController.text,
        description: desController.text,
        doneList: RxList([]),
        progressList: RxList([]),
        toDOList: RxList([]),
      ));
      Get.back();
    }
  }
}
