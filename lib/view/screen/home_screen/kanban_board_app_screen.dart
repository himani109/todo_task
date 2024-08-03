import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';
import 'package:todo_project/view/screen/create_screen/create_new_task_screen.dart';
import 'package:todo_project/view/screen/task_screen/task_screen.dart';

class KanBanBoardAppScreen extends StatefulWidget {
  const KanBanBoardAppScreen({super.key});

  @override
  State<KanBanBoardAppScreen> createState() => _KanBanBoardAppScreenState();
}

class _KanBanBoardAppScreenState extends State<KanBanBoardAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColor.cWhite,
              )),
          backgroundColor: Colors.blue,
          title: Text(
            "KanBan Board App",
            style: pMedium16.copyWith(color: AppColor.cWhite),
          ),
        ),
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Allows horizontal scrolling
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Get.to(()=>TaskScreen());
                      },

                      child: Container(
                        height: 500,
                        width: 200,
                        decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(color: AppColor.cWhite, borderRadius: BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              'To-Do',
                                              style: pRegular13,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(color: AppColor.cWhite, shape: BoxShape.circle),
                                          child: Center(
                                            child: Text(
                                              '1',
                                              style: pRegular12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: FloatingActionButton.extended(
                                  backgroundColor: AppColor.cBackGround,
                                  onPressed: () {
                                    Get.to(()=>CreateNewTaskScreen());
                                    print('Extended FAB Pressed');
                                  },
                                  icon: Icon(Icons.add,size: 20,),
                                  label: Text('New',style: pRegular12,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 500,
                      width: 200,
                      decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(color: AppColor.cWhite, borderRadius: BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            'In-Progress',
                                            style: pRegular13,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(color: AppColor.cWhite, shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            '1',
                                            style: pRegular12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: FloatingActionButton.extended(
                                backgroundColor: AppColor.cBackGround,
                                onPressed: () {
                                  Get.to(()=>CreateNewTaskScreen());
                                  print('Extended FAB Pressed');
                                },
                                icon: Icon(Icons.add,size: 20,),
                                label: Text('New',style: pRegular12,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 500,
                      width: 200,
                      decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                                height: 50,
                                decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(color: AppColor.cWhite, borderRadius: BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            'Done',
                                            style: pRegular13,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(color: AppColor.cWhite, shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            '1',
                                            style: pRegular12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: FloatingActionButton.extended(
                                backgroundColor: AppColor.cBackGround,
                                onPressed: () {
                                  Get.to(()=>CreateNewTaskScreen());
                                  print('Extended FAB Pressed');
                                },
                                icon: Icon(Icons.add,size: 20,),
                                label: Text('New',style: pRegular12,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
