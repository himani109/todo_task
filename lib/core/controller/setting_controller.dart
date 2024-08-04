import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{
  final List<String> languages = ['English',  'German'];
  final List<Color> colors = [Colors.blue, Colors.black, Colors.deepOrangeAccent, Colors.orange, Colors.green];
  RxString selectedLanguage = 'English'.obs;


}