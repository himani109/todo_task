import 'package:get/get.dart';
import 'package:todo_project/core/model/todo_model.dart';

class BoardModel {
  String? name;
  String? description;
  RxList<TodoModel>? toDOList;
  RxList<TodoModel>? progressList;
  RxList<TodoModel>? doneList;

  BoardModel({
     this.name,
     this.description,
    this.doneList,
    this.progressList,
    this.toDOList,
  });
}
