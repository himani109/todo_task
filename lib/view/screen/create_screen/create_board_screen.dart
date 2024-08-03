import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/utils/text_style.dart';

class CreateBoardScreen extends StatefulWidget {
  @override
  State<CreateBoardScreen> createState() => _CreateBoardScreenState();
}

class _CreateBoardScreenState extends State<CreateBoardScreen> {
  final TextEditingController boardNameController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final int _maxLength = 50;

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
          "Create Board",
          style: pMedium16.copyWith(color: AppColor.cWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: boardNameController,
              decoration: InputDecoration(
                labelText: 'Board Name',
                labelStyle: pRegular12,
                suffixText: '${boardNameController.text.length}',
                // counterText: '${boardNameController.text.length}', // Character count indicator
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
            TextField(
              controller: desController,
              // maxLength: _maxLength, // Maximum length for the text field
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: pRegular12,
                suffixText: '${desController.text.length}',
                // counterText: '${boardNameController.text.length}', // Character count indicator
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onChanged: (text) {
                setState(() {}); // Updates the character count indicator
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('Add button pressed');
        },
        backgroundColor: Colors.grey.shade200,
        icon: Icon(
          Icons.add,
          color: Colors.black38,
        ),
        label: Text(
          'Create',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
