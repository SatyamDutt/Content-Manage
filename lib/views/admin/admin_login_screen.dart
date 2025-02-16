import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/admin/admin_dashboard_screen.dart';
import 'package:content_manage/views/admin/admin_register_screen.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:content_manage/views/common/tagline.dart';
import 'package:content_manage/views/student/student_home_screen.dart';
import 'package:content_manage/views/student/student_login_screen.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset('assets/admin_login_image.jpg'),
          SizedBox(
            height: AppDimension.px_15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
            child: Column(
              children: [
                Tagline(title: AppStrings.adminLoginTagLine),
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
                  height: AppDimension.px_50,
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
                  height: AppDimension.px_15,
                ),
                Divider(),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminRegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  
  
  }
}
