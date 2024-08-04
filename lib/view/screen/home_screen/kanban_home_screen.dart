import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/global.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';
import 'package:todo_project/view/screen/create_screen/create_board_screen.dart';
import 'package:todo_project/view/screen/home_screen/kanban_board_app_screen.dart';
import 'package:todo_project/view/screen/setting_screen/setting_screen.dart';

import '../../../main.dart';

class KanbanHomeScreen extends StatefulWidget {
  const KanbanHomeScreen({super.key});

  @override
  State<KanbanHomeScreen> createState() => _KanbanHomeScreenState();
}

class _KanbanHomeScreenState extends State<KanbanHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: appColor.value,
          title: Text(
            "Kanban Board",
            style: pMedium16.copyWith(color: AppColor.cWhite),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(const SettingScreen());
              },
              child: Icon(
                Icons.settings,
                color: AppColor.cWhite,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: Obx(
          () => Global.boardList.isNotEmpty
              ? GridView.builder(
                  itemCount: Global.boardList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.00,
                    mainAxisSpacing: 10.00,
                    childAspectRatio: 0.55,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => KanBanBoardAppScreen(index: index));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: appColor.value.withOpacity(0.2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  Global.boardList[index].name ?? '',
                                  style: pSemiBold18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 70,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: appColor.value.withOpacity(0.2)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    Global.boardList[index].description ?? '',
                                    style: pRegular12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: appColor.value.withOpacity(0.2),
                                  ),
                                  child: Text(
                                    "To-Do-${Global.boardList[index].toDOList?.length}",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: appColor.value.withOpacity(0.2),
                                  ),
                                  child: Text(
                                    "In-Progress-${Global.boardList[index].progressList?.length}",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: appColor.value.withOpacity(0.2),
                                  ),
                                  child: Text(
                                    "Done-${Global.boardList[index].doneList?.length}",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                child: Text('no_data_found'.tr),
              ),

        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'fbt1',
          onPressed: () {
            Get.to(() => const CreateBoardScreen());
          },
          backgroundColor: appColor.value, // Blue color
          shape: const CircleBorder(), // Circular shape
          child: Icon(
            Icons.add,
            color: AppColor.cWhite,
          ),
        ),
      ),
    );
  }
}
