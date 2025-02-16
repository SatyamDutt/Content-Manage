import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:flutter/material.dart';

class AdminCourseScreen extends StatelessWidget {
  const AdminCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text('Course Details',
        style: TextStyle(
          color: AppColors.whiteColor,
        ),
        ),
        centerTitle: true,
        leading: BackButton(
          color: AppColors.whiteColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
        child: Column(
          children: [
            SizedBox(height: AppDimension.px_25,),
            // SizedBox(height: AppDimension.px_40,),
            Container(
              height: AppDimension.px_260,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  // color: const Color.fromARGB(255, 126, 192, 247),
                  borderRadius: BorderRadius.circular(AppDimension.px_10)),
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimension.px_5,
                  ),
                  Text(
                    'Ongoing Courses',
                    style: TextStyle(
                        fontSize: AppDimension.px_25,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor),
                  ),
                  ListTile(
                    // tileColor: AppColors.greenColor,
                    minTileHeight: AppDimension.px_32,
                    title: Text(
                      'Data Science',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_20),
                    ),
                    subtitle: Text(
                      '3 Months',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_14),
                    ),
                    trailing: Text(
                      "₹ 1999.00",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_18),
                    ),
                  ),
                  ListTile(
                    minTileHeight: AppDimension.px_32,
                    // tileColor: AppColors.greenColor,
                    title: Text(
                      'App Development',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_20),
                    ),
                    subtitle: Text(
                      '2 Months',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_14),
                    ),
                    trailing: Text(
                      "₹ 1599.00",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_18),
                    ),
                  ),
                  ListTile(
                    // tileColor: AppColors.greenColor,
                    title: Text(
                      'Web Development',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_20),
                    ),
                    subtitle: Text(
                      '6 Months',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_14),
                    ),
                    trailing: Text(
                      "₹ 2999.00",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_18),
                    ),
                  ),
                  ],
              ),
            ),
         SizedBox(height: AppDimension.px_25,),
            Text('Upload New Course',
            style: TextStyle(
              fontSize: AppDimension.px_22,
              fontWeight: FontWeight.w600,
            ),
            ),
            SizedBox(height: AppDimension.px_10,),
            InputLabel(title: AppStrings.enterCourseName),
            SizedBox(height: AppDimension.px_6,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Cyber Security',
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                ),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: AppDimension.px_10,),
            InputLabel(title: AppStrings.enterCourseDuration),
            SizedBox(height: AppDimension.px_6,),
            TextFormField(
              decoration: InputDecoration(
                hintText: '6 month',
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                ),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: AppDimension.px_10,),
            InputLabel(title: AppStrings.enterCourseAmount),
            SizedBox(height: AppDimension.px_6,),
            TextFormField(
              decoration: InputDecoration(
                hintText: '₹ 7999',
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                ),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: AppDimension.px_40,),
            PrimaryButton(ontTap: () {},
             title: 'Upload')
          ],
        ),
      ),
    );
  }
}