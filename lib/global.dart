import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/core/model/board_model.dart';

class Global{
  static RxList<BoardModel> boardList = <BoardModel>[].obs;
}