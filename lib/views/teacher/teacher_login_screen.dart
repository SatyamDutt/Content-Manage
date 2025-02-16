import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/admin/admin_dashboard_screen.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:content_manage/views/common/tagline.dart';
import 'package:content_manage/views/teacher/teacher_register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TeacherLoginScreen extends StatefulWidget {
  const TeacherLoginScreen({super.key});

  @override
  State<TeacherLoginScreen> createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      print('Please fill al the details');
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminDashboardScreen(
                userId: userCredential.user!.uid,
              ),
            ),
          );
        }
      } catch (e) {
        print("error ${e}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: AppDimension.px_40.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: AppColors.blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimension.px_10.r),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AdminDashboardScreen(userId: 'userId'),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppDimension.px_14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppDimension.px_10.h,
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
                PrimaryTextfield(
                    inputValue: emailController,
                    hintText: AppStrings.emailFormat),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                InputLabel(title: AppStrings.enterPassword),
                SizedBox(
                  height: AppDimension.px_6,
                ),
                PrimaryTextfield(
                    inputValue: passwordController,
                    hintText: AppStrings.passwordFormat),
                SizedBox(
                  height: AppDimension.px_50,
                ),
                PrimaryButton(
                    ontTap: () {
                      login();
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
                            builder: (context) => TeacherRegisterScreen(),
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
                SizedBox(
                  height: AppDimension.px_40.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
