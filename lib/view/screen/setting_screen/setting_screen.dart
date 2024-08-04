import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/core/controller/setting_controller.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';

import '../../../global.dart';
import '../../../main.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final controller = Get.put(SettingController());

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
            "setting".tr,
            style: pMedium16.copyWith(color: AppColor.cWhite),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'app_language'.tr,
                  style: pRegular13,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: appColor.value.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      hint: const Text("Select Language"),
                      value: controller.selectedLanguage.value,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        controller.selectedLanguage.value = newValue ?? '';
                        if (newValue == "English") {
                          Get.updateLocale(const Locale('en'));
                        } else {
                          Get.updateLocale(const Locale('de'));
                        }
                      },
                      items: controller.languages
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'app_Theme'.tr,
                  style: pRegular13,
                ),
                const SizedBox(height: 15),
                Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        appColor.value = controller.colors[index];
                      },
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          color: controller.colors[
                              index], // Display individual color for each container
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 20.0),
                // ElevatedButton(
                //   onPressed: changeColor(currentColorIndex + 1),
                //   child: Text('Change Color'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void applyConditionBasedOnLanguage(String? language) {
    if (language != null) {
      switch (language) {
        case 'English':
          print('English selected');
          // Add your specific condition or action here
          break;
        case 'Spanish':
          print('Spanish selected');
          // Add your specific condition or action here
          break;
        case 'French':
          print('French selected');
          // Add your specific condition or action here
          break;
        case 'German':
          print('German selected');
          // Add your specific condition or action here
          break;
        case 'Chinese':
          print('Chinese selected');
          // Add your specific condition or action here
          break;
        default:
          print('No language selected');
      }
    }
  }
}
