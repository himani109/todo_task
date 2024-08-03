import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/core/controller/theme_controller.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  ThemeController themeController=Get.put(ThemeController());
  final List<String> languages = ['English', 'Spanish', 'French', 'German', 'Chinese'];
  final List<Color> colors = [Colors.blueAccent, Colors.black, Colors.deepOrangeAccent, Colors.orange, Colors.green];

  String? selectedLanguage;
  int currentColorIndex = 0;
  List<int> containerColorIndices = List.filled(5, 0); // Five containers, each starting with color at index 0

  // void changeColor(int containerIndex) {
  //   setState(() {
  //     containerColorIndices[containerIndex] = (containerColorIndices[containerIndex] + 1) % colors.length;
  //     Get.changeTheme(ThemeData(primarySwatch: generateMaterialColor(color)));
  //
  //   });
  // }

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
          "Setting",
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
                'App-sprache',
                style: pRegular13,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    hint: Text('Select Language'),
                    value: selectedLanguage,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue;
                      });
                      applyConditionBasedOnLanguage(newValue);
                    },
                    items: languages.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'App Theme',
                style: pRegular13,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      themeController.changeThemeColor(colors[index]);

                    },
                    child: Container(
                      margin: EdgeInsets.all(3),
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colors[index], // Display individual color for each container
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 20.0),
              // ElevatedButton(
              //   onPressed: changeColor(currentColorIndex + 1),
              //   child: Text('Change Color'),
              // ),
            ],
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
