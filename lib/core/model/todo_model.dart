import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/core/model/chat_model.dart';

class TodoModel {
  String name;
  String description;
  DateTime time;
  RxList<ChatModel> chatList;

  TodoModel({required this.name,required this.description,required this.time,required  this.chatList});
}