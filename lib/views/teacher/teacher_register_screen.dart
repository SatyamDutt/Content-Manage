import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/admin/admin_dashboard_screen.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:content_manage/views/common/tagline.dart';
import 'package:content_manage/views/teacher/teacher_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherRegisterScreen extends StatefulWidget {
  const TeacherRegisterScreen({super.key});

  @override
  State<TeacherRegisterScreen> createState() => _TeacherRegisterScreenState();
}

class _TeacherRegisterScreenState extends State<TeacherRegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController organizationNameController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void createAccountAndStore() async {
    String name = nameController.text.toString();
    String phone = phoneController.text.toString();
    String organizationName = organizationNameController.text.toString();
    String subject = subjectController.text.toString();
    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        phone.isEmpty 
        // organizationName.isEmpty 
        // ||
        // subject.isEmpty
        ) {
      print('Please fill all the details');
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        print('User Created: ${userCredential.user?.uid}');

        await insertUserData(userCredential.user!.uid, name, phone,
            organizationName, subject, email);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminDashboardScreen(userId: userCredential.user!.uid,),
          ),
        );
      } catch (e) {
        print("Error in creating account:${e}");
      }
    }
  }

  Future<void> insertUserData(String uid, String name, String phone,
      String organizationName, String subject, String email) async {
    if (uid == null) print('uid is null');

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Map<String, dynamic> newUserData = {
      "name": name,
      "phone": phone,
      // "organization Name": organizationName,
      // "subject": subject,
      "email": email,
    };

    await _firestore.collection("Teachers").doc(uid).set(newUserData);
    print("New user created for uid : ${uid}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: AppDimension.px_20.h,
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
                PrimaryTextfield(
                  inputValue: nameController,
                  hintText: AppStrings.abhishekTripathi),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                InputLabel(title: AppStrings.enterContactNumber),
                SizedBox(
                  height: AppDimension.px_6,
                ),
                PrimaryTextfield(
                  inputValue: phoneController,
                  hintText: AppStrings.defaultNumber),
                // SizedBox(
                //   height: AppDimension.px_10,
                // ),
                // InputLabel(title: AppStrings.organizationName),
                // SizedBox(
                //   height: AppDimension.px_6,
                // ),
                // PrimaryTextfield(
                //   inputValue: organizationNameController,
                //   hintText: AppStrings.dpsSchool),
                // SizedBox(
                //   height: AppDimension.px_10,
                // ),
                // InputLabel(title: AppStrings.subjectName),
                // SizedBox(
                //   height: AppDimension.px_6,
                // ),
                // PrimaryTextfield(
                //   inputValue: subjectController,
                //   hintText: AppStrings.physics),
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
                  height: AppDimension.px_25,
                ),
                PrimaryButton(
                    ontTap: () {
                      createAccountAndStore();
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
                            builder: (context) => TeacherLoginScreen(),
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
