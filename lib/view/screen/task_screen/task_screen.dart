import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
          "Task",
          style: pMedium16.copyWith(color: AppColor.cWhite),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title',style: pRegular12,),
              Text('Splash screen and Onboarding screen',style: pMedium13,),
              SizedBox(height: 20,),
              Text('Create at',style: pRegular12,),
              Text('07:27 PM,23-06-2024',style: pMedium13,),
              SizedBox(height: 20,),
              Text('Description',style: pRegular12,),
              Text('Create a splash screen and onboarding screen from search',style: pMedium13,),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Write here..',hintStyle: pRegular12,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Space between TextField and Button
                  ElevatedButton(
                    onPressed: () {
                      // Action to be performed on button press
                      print('Send button pressed');
                    },
                    child: Icon(Icons.send,color: Colors.grey,),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white54, // Button color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,)


            ],
          ),
        ),
      ),
    );
  }
}
