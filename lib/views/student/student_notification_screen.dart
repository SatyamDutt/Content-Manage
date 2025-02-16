import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/student/student_notification_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentNotificationScreen extends StatefulWidget {
  
  const StudentNotificationScreen({super.key});

  @override
  State<StudentNotificationScreen> createState() =>
      _StudentNotificationScreenState();
}

class _StudentNotificationScreenState extends State<StudentNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications Details',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: AppColors.blueColor,
        centerTitle: true,
        leading: BackButton(
          color: AppColors.whiteColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
        child: Column(
          children: [
            SizedBox(
              height: AppDimension.px_25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentNotificationDetailsScreen(title: 'Gandhi Jayanti', date: DateTime(2025,10,02),),
                  ),
                );
              },
              child: Container(
                height: AppDimension.px_50,
                decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(AppDimension.px_10)),
                child: Padding(
                  padding: EdgeInsets.all(AppDimension.px_10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gandhi Jayanti',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppDimension.px_20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${DateFormat('dd MMMM yyyyy').format(DateTime(2025, 10, 02))}',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppDimension.px_18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimension.px_15,),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentNotificationDetailsScreen(title: 'Guru Nanak Jayanti', date: DateTime(2025,11,05),),
                  ),
                );
              },
              child: Container(
                height: AppDimension.px_50,
                decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(AppDimension.px_10)),
                child: Padding(
                  padding: EdgeInsets.all(AppDimension.px_10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Guru Nanak Jayanti',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppDimension.px_20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${DateFormat('dd MMMM yyyyy').format(DateTime(2025, 11, 05))}',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppDimension.px_18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimension.px_15,),
          ],
        ),
      ),
    );
  }
}
