import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_project/core/model/todo_model.dart';
import 'package:todo_project/global.dart';
import 'package:todo_project/main.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';
import 'package:todo_project/view/screen/create_screen/create_new_task_screen.dart';
import 'package:todo_project/view/screen/task_screen/task_screen.dart';

class KanBanBoardAppScreen extends StatefulWidget {
  final int index;

  const KanBanBoardAppScreen({super.key, required this.index});

  @override
  State<KanBanBoardAppScreen> createState() => _KanBanBoardAppScreenState();
}

class _KanBanBoardAppScreenState extends State<KanBanBoardAppScreen> {
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
            Global.boardList[widget.index].name ?? "",
            style: pMedium16.copyWith(color: AppColor.cWhite),
          ),
        ),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
          scrollDirection: Axis.horizontal, // Allows horizontal scrolling
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 200,
                decoration: BoxDecoration(
                    color: appColor.value.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: appColor.value.withOpacity(0.2),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: AppColor.cWhite,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'to_do'.tr,
                                  style: pRegular13,
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: AppColor.cWhite,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    '${Global.boardList[widget.index].toDOList?.length ?? 0}',
                                    style: pRegular12,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => ListView.builder(
                          itemCount:
                              Global.boardList[widget.index].toDOList!.length,
                          itemBuilder: (context, index) {
                            return Draggable(
                              data:
                                  Global.boardList[widget.index].toDOList![index],
                              feedback: Container(
                                width: 200,
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Global.boardList[widget.index]
                                              .toDOList?[index].name ??
                                          "",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.none),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'Created At',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black38,
                                          decoration: TextDecoration.none),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      '${DateFormat('jm').format(Global.boardList[widget.index].toDOList![index].time)}, ${DateFormat('d-MM-yyyy').format(Global.boardList[widget.index].toDOList![index].time)}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              childWhenDragging: Container(
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Global.boardList[widget.index]
                                              .toDOList?[index].name ??
                                          "",
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'Created At',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black12),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      '${DateFormat('jm').format(Global.boardList[widget.index].toDOList![index].time)}, ${DateFormat('d-MM-yyyy').format(Global.boardList[widget.index].toDOList![index].time)}',
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => TaskScreen(
                                      todoModel: Global.boardList[widget.index]
                                          .toDOList![index]));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Global.boardList[widget.index]
                                                .toDOList?[index].name ??
                                            "",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        'Created At',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black38),
                                        maxLines: 2,
                                      ),
                                      Text(
                                        '${DateFormat('jm').format(Global.boardList[widget.index].toDOList![index].time)}, ${DateFormat('d-MM-yyyy').format(Global.boardList[widget.index].toDOList![index].time)}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const CreateNewTaskScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              size: 20,
                            ),
                            Text(
                              'new'.tr,
                              style: pRegular12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: double.infinity,
                width: 200,
                decoration: BoxDecoration(
                    color: appColor.value.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: appColor.value.withOpacity(0.2),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: AppColor.cWhite,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'in_progress'.tr,
                                  style: pRegular13,
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColor.cWhite, shape: BoxShape.circle),
                              child: Center(
                                child: Obx(
                                  () => Text(
                                    '${Global.boardList[widget.index].progressList?.length ?? 0}',
                                    style: pRegular12,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: DragTarget<TodoModel>(
                        onAcceptWithDetails: (details) {
                          int index = Global.boardList[widget.index].toDOList!
                              .indexWhere(
                                  (element) => element.name == details.data.name);
                          if (index != -1) {
                            Global.boardList[widget.index].progressList!
                                .add(details.data);

                            Global.boardList[widget.index].toDOList!
                                .remove(details.data);
                          }
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Obx(
                            () => ListView.builder(
                              itemCount: Global
                                  .boardList[widget.index].progressList?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => TaskScreen(
                                        todoModel: Global.boardList[widget.index]
                                            .progressList![index]));
                                  },
                                  child: Draggable(
                                    data: Global.boardList[widget.index]
                                        .progressList![index],
                                    feedback: Container(
                                      width: 200,
                                      margin: const EdgeInsets.all(2),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Global.boardList[widget.index]
                                                    .progressList?[index].name ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                decoration: TextDecoration.none),
                                            maxLines: 2,
                                          ),
                                          const SizedBox(height: 12),
                                          const Text(
                                            'Created At',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black38,
                                                decoration: TextDecoration.none),
                                            maxLines: 2,
                                          ),
                                          Text(
                                            '${DateFormat('jm').format(Global.boardList[widget.index].progressList![index].time)}, ${DateFormat('d-MM-yyyy').format(Global.boardList[widget.index].progressList![index].time)}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black87,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    childWhenDragging: Container(
                                      margin: const EdgeInsets.all(2),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white38,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Global.boardList[widget.index]
                                                    .progressList?[index].name ??
                                                "",
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                          ),
                                          const SizedBox(height: 12),
                                          const Text(
                                            'Created At',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black12),
                                            maxLines: 2,
                                          ),
                                          Text(
                                            '${DateFormat('jm').format(Global.boardList[widget.index].progressList![index].time)}, ${DateFormat('d-MM-yyyy').format(Global.boardList[widget.index].progressList![index].time)}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black38),
                                          ),
                                        ],
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => TaskScreen(
                                            todoModel: Global.boardList[widget.index]
                                                .progressList![index]));
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(2),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Global
                                                      .boardList[widget.index]
                                                      .progressList?[index]
                                                      .name ??
                                                  "",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                            const SizedBox(height: 12),
                                            const Text(
                                              'Created At',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black38),
                                              maxLines: 2,
                                            ),
                                            Text(
                                              '${DateFormat('jm').format(Global.boardList[widget.index].progressList![index].time)}, ${DateFormat('d-MM-yyyy').format(Global.boardList[widget.index].progressList![index].time)}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: double.infinity,
                width: 200,
                decoration: BoxDecoration(
                    color: appColor.value.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: appColor.value.withOpacity(0.2),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: AppColor.cWhite,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'done'.tr,
                                  style: pRegular13,
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColor.cWhite, shape: BoxShape.circle),
                              child: Obx(
                                ()=> Center(
                                  child: Text(
                                    '${Global.boardList[widget.index].doneList?.length ?? 0}',
                                    style: pRegular12,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: DragTarget<TodoModel>(
                        onAcceptWithDetails: (details) {
                          int index = Global.boardList[widget.index].progressList!
                              .indexWhere(
                                  (element) => element.name == details.data.name);
                          if (index != -1) {
                            Global.boardList[widget.index].doneList!
                                .add(details.data);

                            Global.boardList[widget.index].progressList!
                                .remove(details.data);
                          }
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Obx(
                            () => ListView.builder(
                              itemCount:
                                  Global.boardList[widget.index].doneList?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => TaskScreen(
                                        todoModel: Global.boardList[widget.index]
                                            .doneList![index]));
                                  },
                                  child: Draggable(
                                    data: Global
                                        .boardList[widget.index].doneList![index],
                                    feedback: Container(
                                      width: 200,
                                      margin: const EdgeInsets.all(2),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Global.boardList[widget.index]
                                                    .doneList?[index].name ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                decoration: TextDecoration.none),
                                            maxLines: 2,
                                          ),
                                          const SizedBox(height: 12),
                                          const Text(
                                            'Created At',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black38,
                                                decoration: TextDecoration.none),
                                            maxLines: 2,
                                          ),
                                          Text(
                                            '${DateFormat('jm').format(Global.boardList[widget.index].doneList![index].time)}, ${DateFormat('d-MM-yyyy').format(Global.boardList[widget.index].doneList![index].time)}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black87,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    childWhenDragging: Container(
                                      margin: const EdgeInsets.all(2),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white38,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Global.boardList[widget.index]
                                                    .doneList?[index].name ??
                                                "",
                                            style: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                          ),
                                          const SizedBox(height: 12),
                                          const Text(
                                            'Created At',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black12),
                                            maxLines: 2,
                                          ),
                                          Text(
                                            '${DateFormat('jm').format(Global.boardList[widget.index].doneList![index].time)}, ${DateFormat('d-MM-yyyy').format(Global.boardList[widget.index].doneList![index].time)}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black38),
                                          ),
                                        ],
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => TaskScreen(
                                            todoModel: Global.boardList[widget.index]
                                                .doneList![index]));
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(2),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Global.boardList[widget.index]
                                                      .doneList?[index].name ??
                                                  "",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 2,
                                            ),
                                            const SizedBox(height: 12),
                                            const Text(
                                              'Created At',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black38),
                                              maxLines: 2,
                                            ),
                                            Text(
                                              '${DateFormat('jm').format(Global.boardList[widget.index].doneList![index].time)}, ${DateFormat('d-MM-yyyy').format(Global.boardList[widget.index].doneList![index].time)}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black87),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
