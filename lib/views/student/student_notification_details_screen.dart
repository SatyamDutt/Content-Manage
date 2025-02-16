import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentNotificationDetailsScreen extends StatelessWidget {
  final String title;
  final DateTime date;

   StudentNotificationDetailsScreen({super.key,
   required this.title,
   required this.date,
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.blueColor,
        backgroundColor: Color(0xff1d2f47),
        title: Text(
          'Notification Details',
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
            SizedBox(
              height: AppDimension.px_50,
            ),
            Container(
              height: AppDimension.px_330,
              width: double.maxFinite,
              decoration: BoxDecoration(
                // color: AppColors.blueColor,
                color: Color(0xff1d2f47),
                borderRadius: BorderRadius.circular(AppDimension.px_15),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppDimension.px_15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${DateFormat('dd-MM-yyyy').format(date)}',
                          // '${DateFormat('dd MMMM yyyy').format(DateTime(2025, 01, 05))}',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimension.px_5,
                    ),
                    Divider(),
                    SizedBox(
                      height: AppDimension.px_5,
                    ),
                    Text(
                      AppStrings.NoticeDetails,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.clip,
                      textWidthBasis: TextWidthBasis.longestLine,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppDimension.px_16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: AppDimension.px_15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Regards',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.dpsSchool,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '+91 ' + AppStrings.defaultNumber,
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppDimension.px_14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
