import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:content_manage/views/student/student_otp_verify_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentRegisterWithPhoneScreen extends StatefulWidget {
  const StudentRegisterWithPhoneScreen({super.key});

  @override
  State<StudentRegisterWithPhoneScreen> createState() =>
      _StudentRegisterWithPhoneScreenState();
}

class _StudentRegisterWithPhoneScreenState
    extends State<StudentRegisterWithPhoneScreen> {
  TextEditingController phoneController = TextEditingController();

  void sendOtp() async {
    String phone = "+91" + phoneController.text.trim();

    if (phoneController.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid 10-digit phone Number'),
          backgroundColor: AppColors.redColor,
        ),
      );
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentOtpVerifyScreen(
              verificationId: verificationId,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OTP sent Successfully'),
            backgroundColor: AppColors.greenColor,
          ),
        );
      },
      verificationCompleted: (credential) {},
      verificationFailed: (ex) {
        print(ex);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print('Time Out');
      },
      timeout: Duration(seconds: 100),
    );
  }

  verifyPhoneNumber() {
    if (phoneController.text.length != 10) {
      return SnackBar(content: Text('Phone Number must of 10 digit'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25.w),
        child: ListView(
          children: [
            SizedBox(
              height: AppDimension.px_100,
            ),
            Image.asset('assets/admin_register_image.jpg'),
            // TextField(
            //   // controller: ,

            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(AppDimension.px_10.r)
            //     )
            //   ),
            // )
            InputLabel(title: AppStrings.enterPhoneNumber),
            SizedBox(
              height: AppDimension.px_6.h,
            ),
            PrimaryTextfield(
              hintText: AppStrings.defaultNumber,
              inputValue: phoneController,
              inputType: TextInputType.phone,
            ),
            SizedBox(
              height: AppDimension.px_40.h,
            ),

            PrimaryButton(
                ontTap: () {
                  verifyPhoneNumber();
                  sendOtp();
                  phoneController.clear();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => StudentOtpVerifyScreen(),
                  //   ),
                  // );
                },
                title: AppStrings.sendOtp),
          ],
        ),
      ),
    );
  }
}
