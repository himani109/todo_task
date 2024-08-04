import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/core/controller/create_board_controller.dart';
import 'package:todo_project/main.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';

class CreateBoardScreen extends StatefulWidget {
  const CreateBoardScreen({super.key});

  @override
  State<CreateBoardScreen> createState() => _CreateBoardScreenState();
}

class _CreateBoardScreenState extends State<CreateBoardScreen> {
  final controller = Get.put(CreateBoardController());

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
            "create_board".tr,
            style: pMedium16.copyWith(color: AppColor.cWhite),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'board_name'.tr,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              Obx(
                () => TextField(
                  maxLength: 20,
                  controller: controller.boardNameController,
                  decoration: InputDecoration(
                    labelStyle: pRegular12,
                    suffixText: '${controller.nameLength.value}',
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    counter: const Text(''),
                  ),
                  onChanged: (value) {
                    controller.nameLength.value = 20 - value.length;
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'description'.tr,
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
              Obx(
                () => TextField(
                  controller: controller.desController,
                  maxLength: 50, // Maximum length for the text field
                  decoration: InputDecoration(
                    counter: const Text(''),
                    labelStyle: pRegular12,
                    suffixText: '${controller.desLength.value}',
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                  ),
                  onChanged: (value) {
                    controller.desLength.value = 50 - value.length;
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Obx(
          ()=> FloatingActionButton.extended(
            onPressed: () {
              controller.saveData();
            },
            backgroundColor: (controller.desLength.value!=50&&controller.nameLength.value!=20)? appColor.value:Colors.grey.shade200,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            icon:  Icon(
              Icons.add,
              color:(controller.desLength.value!=50&&controller.nameLength.value!=20)?Colors.white: Colors.black38,
            ),
            label:  Text(
              'create'.tr,
              style: TextStyle(
                color:(controller.desLength.value!=50&&controller.nameLength.value!=20)?Colors.white: Colors.black38,
              ),
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
