import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:content_manage/views/student/student_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentOtpVerifyScreen extends StatefulWidget {
  final String verificationId;
  const StudentOtpVerifyScreen({
    super.key,
    required this.verificationId,
  });

  @override
  State<StudentOtpVerifyScreen> createState() => _StudentOtpVerifyScreenState();
}

class _StudentOtpVerifyScreenState extends State<StudentOtpVerifyScreen> {
  TextEditingController otpController = TextEditingController();

  void otpVerify() async {
    String otp = otpController.text.trim();

    if (otpController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter valid 6 digit Otp'),
          backgroundColor: AppColors.redColor,
        ),
      );
    }

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otp);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user != null) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => StudentHomeScreen(userId: '',),
        //   ),
        // );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('SuccessFully Logined'),
            backgroundColor: AppColors.greenColor,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        children: [
          SizedBox(
            height: AppDimension.px_100.h,
          ),
          Image.asset('assets/admin_login_image.jpg'),
          SizedBox(
            height: AppDimension.px_32.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25.w),
            child: Column(
              children: [
                PrimaryTextfield(
                  inputValue: otpController,
                  hintText: AppStrings.otpFormat,
                  inputType: TextInputType.phone,
                ),
                SizedBox(
                  height: AppDimension.px_40.h,
                ),
                PrimaryButton(
                    ontTap: () {
                      otpVerify();
                    },
                    title: AppStrings.verify)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
