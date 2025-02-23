import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_textField.dart';
import 'package:content_manage/views/student/student_home_screen.dart';
import 'package:content_manage/views/student/student_register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({super.key});

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Enter valid email and password'),
          backgroundColor: AppColors.redColor,
          // duration: Duration(seconds: 10),
        ),
      );
      print("Please fill the all details");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

            

        if (userCredential.user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  StudentHomeScreen(uid: userCredential.user!.uid),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You have successfully Logined'),
              backgroundColor: AppColors.greenColor,
            ),
          );
        }
      } catch (e) {
        print("Error while logining ${e}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: AppDimension.px_60.r,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       MaterialButton(
            //         color: AppColors.blueColor,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(AppDimension.px_10.r),
            //         ),
            //         onPressed: () {
            //           // Navigator.push(
            //           //   context,
            //           //   MaterialPageRoute(
            //           //     builder: (context) =>
            //           //         StudentHomeScreen(userId: 'userId'),
            //           //   ),
            //           // );
            //         },
            //         child: Text(
            //           "Skip",
            //           style: TextStyle(
            //             color: AppColors.whiteColor,
            //             fontSize: AppDimension.px_14.sp,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            
            SizedBox(
              height: AppDimension.px_10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
              child: Text(
                'Your Gateway to Smarter Learning!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppDimension.px_22.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // SizedBox(height: 100,),
            Center(
              child: Image.asset(
                'assets/student_login_image.png',
                height: AppDimension.px_280.h,
                width: AppDimension.px_350.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  InputLabel(title: 'Enter Email'),
                  SizedBox(
                    height: 6,
                  ),

                  PrimaryTextfield(
                      inputValue: emailController,
                      hintText: 'abcdxx@gmail.com'),
                  SizedBox(
                    height: 20,
                  ),
                  InputLabel(title: 'Enter Password'),
                  SizedBox(
                    height: 6,
                  ),
                  // PrimaryTextfield(hintText: 'abcdXXX1234',)
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'abscdXX123',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                width: double.maxFinite,
                height: 56,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    login();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => StudentHomeScreen(),
                    //   ),
                    // );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Divider(
            //         color: Colors.black,
            //       ),
            //     ),
            //     Text('OR'),
            //     Divider(),
            //   ],
            // ),
            Divider(),
            SizedBox(
              height: AppDimension.px_10.h,
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
                        builder: (context) => StudentRegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Create now',
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
              height: AppDimension.px_32.h,
            ),
          ],
        ),
      ),
    );
  }
}
