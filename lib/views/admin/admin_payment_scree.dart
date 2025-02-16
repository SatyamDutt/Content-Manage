import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:flutter/material.dart';

class AdminPaymentScree extends StatelessWidget {
  const AdminPaymentScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text('Payment Details',
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
            Row(
              children: [
                Text('Last month Revenue Details',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppDimension.px_22,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ],
            ),
            SizedBox(height: AppDimension.px_10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Collected Amount',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppDimension.px_18,
                  fontWeight: FontWeight.w400,
                ),
                ),
                Text('₹ 1,50,000',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppDimension.px_18,
                  fontWeight: FontWeight.w400,
                ),
                )
              ],
            ),
            SizedBox(height: AppDimension.px_10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Pending Amount',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppDimension.px_18,
                  fontWeight: FontWeight.w400,
                ),
                ),
                Text('₹ 10,000',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppDimension.px_18,
                  fontWeight: FontWeight.w400,
                ),
                )
              ],
            ),
             SizedBox(height: AppDimension.px_10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Profit Amount',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppDimension.px_18,
                  fontWeight: FontWeight.w400,
                ),
                ),
                Text('₹ 57,000',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppDimension.px_18,
                  fontWeight: FontWeight.w400,
                ),
                )
              ],
            ),
            SizedBox(height: AppDimension.px_40,),
            Row(
              children: [
                Text('Upload Pending fees',
                style: TextStyle(
                  fontSize: AppDimension.px_20,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: AppDimension.px_15,),
            InputLabel(title: AppStrings.enterName),
            SizedBox(height: AppDimension.px_6,),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.ashishKumar,
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                ),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: AppDimension.px_10,),
            InputLabel(title: AppStrings.enterRollNumber),
            SizedBox(height: AppDimension.px_6,),
            TextFormField(
              decoration: InputDecoration(
                hintText: '427',
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                ),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: AppDimension.px_10,),
            InputLabel(title: AppStrings.enterMonthName),
            SizedBox(height: AppDimension.px_6,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'January',
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                ),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: AppDimension.px_10,),
            InputLabel(title: AppStrings.enterAmount),
            SizedBox(height: AppDimension.px_6,),
            TextFormField(
              decoration: InputDecoration(
                hintText: '500',
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                ),
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: AppDimension.px_25,),
            PrimaryButton(ontTap: () {},
             title: AppStrings.submit),
          ],
        ),
      ),
    );
  }
}