import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:flutter/material.dart';

class TeacherCallScreen extends StatefulWidget {
  const TeacherCallScreen({super.key});

  @override
  State<TeacherCallScreen> createState() => _TeacherCallScreenState();
}

class _TeacherCallScreenState extends State<TeacherCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Call Details',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xff1d2f47),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: AppDimension.px_15,
            ),
            Center(
              child: Text(
                'For Any Query contact with us:',
                style: TextStyle(
                  // color: AppColors.blueColor,
                  fontSize: AppDimension.px_18,
                ),
              ),
            ),
            Center(
              child: Text(
                '+91 9853624157',
                style: TextStyle(
                  fontSize: AppDimension.px_18,
                ),
              ),
            ),
            ],
        ),
      ),
    );
  
  }
}