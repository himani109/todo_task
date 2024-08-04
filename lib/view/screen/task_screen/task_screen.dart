import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_project/core/controller/task_controller.dart';
import 'package:todo_project/core/model/chat_model.dart';
import 'package:todo_project/core/model/todo_model.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';

import '../../../main.dart';

class TaskScreen extends StatefulWidget {
  final TodoModel todoModel;

  const TaskScreen({super.key, required this.todoModel});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
            "Task",
            style: pMedium16.copyWith(color: AppColor.cWhite),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: appColor.value.withOpacity(0.05)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: pRegular12,
                      ),
                      Text(
                        widget.todoModel.name,
                        style: pMedium13,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Create at',
                        style: pRegular12,
                      ),
                      Text(
                        '${DateFormat('jm').format(widget.todoModel.time)}, ${DateFormat('d-MM-yyyy').format(widget.todoModel.time)}',
                        style: pMedium13,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Description',
                        style: pRegular12,
                      ),
                      Text(
                        widget.todoModel.description,
                        style: pMedium13,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: widget.todoModel.chatList.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: appColor.value.withOpacity(0.20),
                                  ),
                                  child: Text(
                                      widget.todoModel.chatList[index].chat),
                                ),
                                Text(
                                  '${DateFormat('jm').format(widget.todoModel.chatList[index].time)}, ${DateFormat('d-MM-yyyy').format(widget.todoModel.chatList[index].time)}',
                                  style: const TextStyle(color: Colors.black38),
                                ),
                                const SizedBox(height: 10)
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: controller.chatController,
                          decoration: InputDecoration(
                            hintText: 'Write here..',
                            hintStyle: pRegular12,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.chatEmpty.value = false;
                            } else {
                              controller.chatEmpty.value = true;
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          widget.todoModel.chatList.add(ChatModel(
                              time: DateTime.now(),
                              chat: controller.chatController.text));
                          controller.chatController.clear();
                          controller.chatEmpty.value = true;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.chatEmpty.value
                              ? Colors.white54
                              : appColor.value, // Button color
                        ),
                        child: Icon(
                          Icons.send,
                          color: controller.chatEmpty.value
                              ? Colors.grey
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
