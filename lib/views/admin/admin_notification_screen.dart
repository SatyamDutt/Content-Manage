import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class AdminNotificationScreen extends StatefulWidget {
  const AdminNotificationScreen({super.key});

  @override
  State<AdminNotificationScreen> createState() => _AdminNotificationScreenState();
}

class _AdminNotificationScreenState extends State<AdminNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text('Notification Details',
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
            Text(
                    'Previous Notification',
                    style: TextStyle(
                        fontSize: AppDimension.px_20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
            SizedBox(height: AppDimension.px_15,),
            Container(
              height: AppDimension.px_330,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(AppDimension.px_10),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppDimension.px_15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gandhi Jayanti',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${DateFormat('dd MMMM yyyy').format(DateTime(2025, 01, 05))}',
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
                    SizedBox(height: AppDimension.px_5,
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
                          '+91 '+AppStrings.defaultNumber,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_14,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
         
            SizedBox(height: AppDimension.px_40,),
            Text('Upload New Notification',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppDimension.px_20,
              fontWeight: FontWeight.w600,
            ),
            ),
          
            SizedBox(height: AppDimension.px_15,),

              InputLabel(title: 'Enter Notification Title'),
              SizedBox(height: AppDimension.px_6,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Guru Nanak Jayanti',
                  hintStyle: TextStyle(
                    color: AppColors.greyColor,
                  ),
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: AppDimension.px_10,),
            InputLabel(title: 'Enter Holiday message'),
            SizedBox(height: AppDimension.px_6,),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Type here...',
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                ),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: AppDimension.px_25,),
            PrimaryButton(ontTap: () {},
             title: 'Upload',
             )
            
          ],
        ),
      ),
    );
  }
}