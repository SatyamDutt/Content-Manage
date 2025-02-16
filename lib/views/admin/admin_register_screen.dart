import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/admin/admin_dashboard_screen.dart';
import 'package:content_manage/views/admin/admin_login_screen.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:content_manage/views/common/tagline.dart';
import 'package:flutter/material.dart';

class AdminRegisterScreen extends StatelessWidget {
  const AdminRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: AppDimension.px_100,
          ),
          Image.asset('assets/admin_register_image.jpg'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
            child: Column(
              children: [
                Tagline(title: AppStrings.adminRegisterTagLine),
                SizedBox(
                  height: AppDimension.px_15,
                ),
                InputLabel(title: AppStrings.enterName),
                SizedBox(
                  height: AppDimension.px_6,
                ),
                PrimaryTextfield(hintText: AppStrings.abhishekTripathi),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                InputLabel(title: AppStrings.enterContactNumber),
                SizedBox(
                  height: AppDimension.px_6,
                ),
                PrimaryTextfield(hintText: AppStrings.defaultNumber),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                InputLabel(title: AppStrings.organizationName),
                SizedBox(
                  height: AppDimension.px_6,
                ),
                PrimaryTextfield(hintText: AppStrings.dpsSchool),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                InputLabel(title: AppStrings.enterEmail),
                SizedBox(
                  height: AppDimension.px_6,
                ),
                PrimaryTextfield(hintText: AppStrings.emailFormat),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                InputLabel(title: AppStrings.enterPassword),
                SizedBox(
                  height: AppDimension.px_6,
                ),
                PrimaryTextfield(hintText: AppStrings.passwordFormat),
                SizedBox(
                  height: AppDimension.px_25,
                ),
                PrimaryButton(
                    ontTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AdminDashboardScreen(),
                      //   ),
                      // );
                    },
                    title: AppStrings.submit),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account? ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminLoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppDimension.px_40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
 
 
  }
}
