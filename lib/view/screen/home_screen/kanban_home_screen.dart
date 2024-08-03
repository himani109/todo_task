import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';
import 'package:todo_project/view/screen/create_screen/create_board_screen.dart';
import 'package:todo_project/view/screen/home_screen/kanban_board_app_screen.dart';
import 'package:todo_project/view/screen/setting_screen/setting_screen.dart';

class KanbanHomeScreen extends StatefulWidget {
  @override
  State<KanbanHomeScreen> createState() => _KanbanHomeScreenState();
}

class _KanbanHomeScreenState extends State<KanbanHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Kanban Board",
          style: pMedium16.copyWith(color: AppColor.cWhite),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(SettingScreen());
            },
            child: Icon(
              Icons.settings,
              color: AppColor.cWhite,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.00,
                  mainAxisSpacing: 10.00,
                  childAspectRatio: 0.57,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap:() {
                        Get.to(()=>KanBanBoardAppScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueAccent.withOpacity(0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Kanban Board App",
                                style: pSemiBold18,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 70,
                              width: Get.width,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueAccent.withOpacity(0.2)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Create a Kanban Board App",
                                  style: pRegular12,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueAccent.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    "To-Do-0",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueAccent.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    "In-Progress-0",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueAccent.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    "Done-0",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
            // Image.asset('assets/images/surprise.png',),
            // SizedBox(height: 6,),
            // Text("No Board",style: pMedium14.copyWith(color: Colors.deepPurpleAccent),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateBoardScreen());
        },
        backgroundColor: Colors.blue, // Blue color
        shape: CircleBorder(), // Circular shape

        child: Icon(
          Icons.add,
          color: AppColor.cWhite,
        ),
      ),
    );
  }
}
