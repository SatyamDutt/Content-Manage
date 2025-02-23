import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:content_manage/views/common/tagline.dart';
import 'package:content_manage/views/student/student_home_screen.dart';
import 'package:content_manage/views/student/student_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentRegisterScreen extends StatefulWidget {
  const StudentRegisterScreen({super.key});

  @override
  State<StudentRegisterScreen> createState() => _StudentRegisterScreenState();
}

class _StudentRegisterScreenState extends State<StudentRegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();

  //   void createAccount() async {
  //   String name = nameController.text.toString();
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //   String phone = phoneController.text.trim();
  //   String course = courseNameController.text.toString();
  //   String rollNo = rollNoController.text.trim();

  //   if (email.isEmpty ||
  //       name.isEmpty ||
  //       password.isEmpty ||
  //       phone.isEmpty ||
  //       course.isEmpty ||
  //       rollNo.isEmpty) {
  //     print("Please fill all the Details");

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Please enter valid Details"),
  //         backgroundColor: AppColors.redColor,
  //       ),
  //     );
  //   } else {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: email, password: password);
  //       // log("User created: ${userCredential.user?.uid}");
  //       print("User created: ${userCredential.user?.uid}");

  //       await insertUserData(
  //           userCredential.user!.uid, name, phone, course, rollNo, email);

  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) =>
  //               StudentHomeScreen(userId: userCredential.user!.uid),
  //         ),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Your Accound Created Successfully'),
  //           backgroundColor: AppColors.greenColor,
  //         ),
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('${e.message}'),
  //           backgroundColor: AppColors.redColor,
  //         ),
  //       );
  //     } catch (e) {
  //       print("Error in creating account ${e}");
  //     }
  //   }
  // }

  // Future<void> insertUserData(String uid, String name, String phone,
  //     String courseName, String rollNo, String email) async {
  //   if (uid == null) return print('uid id null');

  //   FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //   Map<String, dynamic> newUserData = {
  //     "name": name,
  //     "email": emailController.text.trim(),
  //     "phone Number": phone,
  //     "course Name": courseName,
  //     "Roll No": rollNo
  //   };

  //   await _firestore.collection("Students").doc(uid).set(newUserData);
  //   print("New user create for uid :${uid}");
  // }

  void createAccount() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String phone = phoneController.text.trim();
    String course = courseNameController.text.trim();
    String rollNo = rollNoController.text.trim();

    if (email.isEmpty ||
        name.isEmpty ||
        password.isEmpty ||
        phone.isEmpty 
        // course.isEmpty ||
        // rollNo.isEmpty
        ) {
      print("Please fill all the Details");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter valid Details"),
          backgroundColor: AppColors.redColor,
        ),
      );
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("User created: ${userCredential.user?.uid}");

      int userId =
          await generateUniqueUserId(); // Generate unique 4-digit userId

      String uid = userCredential.user?.uid ?? '';

      await insertUserData(uid, userId, name, phone, course, rollNo, email);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentHomeScreen(
            // userId: userCredential.user?.uid ?? '',
             uid: userCredential.user?.uid ?? '',
            // className: selectedClass,
          ),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Your Account Created Successfully'),
          backgroundColor: AppColors.greenColor,
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${e.message}'),
          backgroundColor: AppColors.redColor,
        ),
      );
    } catch (e) {
      print("Error in creating account: $e");
    }
  }

  Future<int> generateUniqueUserId() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    Random random = Random();
    int userId;
    DocumentSnapshot doc;

    do {
      userId =
          1000 + random.nextInt(9000); // Generate 4-digit number (1000-9999)
      doc =
          await _firestore.collection("Students").doc(userId.toString()).get();
    } while (doc.exists); // Repeat until a unique ID is found

    return userId;
  }

  Future<void> insertUserData(String uid, int userId, String name, String phone,
      String courseName, String rollNo, String email) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Map<String, dynamic> newUserData = {
      // "userId": userId,
      "name": name,
      "email": email,
      "phone Number": phone,
      // "course Name": courseName,
      "class Name":selectedClass,
      "rollno": userId
    };

    await _firestore
        .collection("All Students")
        .doc('${selectedClass}')
        .collection('rollNo')
        .doc(userId.toString())
        .set(newUserData);
    print("New user created with User ID: $userId");

    await _firestore.collection("Students").doc(uid).set(newUserData);
    print("New user created with User ID: $userId");

    // await _firestore.collection("Students").doc(userId.toString()).set(newUserData);
    // print("New user created with User ID: $userId");
  }

  String? selectedClass;

  List<String> dropdownItems = [
    "1st",
    "2nd",
    "3rd",
    "4th",
    "5th",
    "6th",
    "7th",
    "8th",
    "9th",
    "10th",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: AppDimension.px_20.h,
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
          //           //     builder: (context) => StudentHomeScreen(
          //           //       userId: 'userId',
          //           //       // className: selectedClass,
          //           //     ),
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
          //       ),
          //     ],
          //   ),
          // ),
          
          SizedBox(
            height: AppDimension.px_10.h,
          ),
          Image.asset(
            'assets/student_register_image.png',
            height: 400,
            width: 350,
          ),
          Tagline(title: AppStrings.registeScreenTagLine),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
            child: Column(
              children: [
                InputLabel(title: AppStrings.enterName),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                PrimaryTextfield(
                    inputValue: nameController,
                    inputType: TextInputType.name,
                    hintText: AppStrings.ashishKumar),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                InputLabel(title: AppStrings.enterContactNumber),
                SizedBox(
                  height: AppDimension.px_6,
                ),
                PrimaryTextfield(
                    inputType: TextInputType.phone,
                    inputValue: phoneController,
                    hintText: AppStrings.defaultNumber),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                // InputLabel(title: AppStrings.enterCourseName),
                // SizedBox(
                //   height: AppDimension.px_6,
                // ),
                // PrimaryTextfield(
                //     inputValue: courseNameController,
                //     hintText: AppStrings.btech),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                
                // SizedBox(
                //   height: AppDimension.px_6.h,
                // ),
                Container(
                  height: AppDimension.px_45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimension.px_10.r),
                    border: Border.all(
                      color: AppColors.greyColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputLabel(title: 'Select your class'),
                        DropdownButton<String>(
                          hint: Text("Not Selected"),
                          value: selectedClass,
                          items: dropdownItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedClass = newValue;
                            });
                            print(
                                "Selected Value: $newValue"); // Returns the selected value
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                //2

                SizedBox(
                  height: AppDimension.px_6,
                ),
                // InputLabel(title: AppStrings.enterRollNumber),
                // SizedBox(
                //   height: AppDimension.px_6,
                // ),
                // PrimaryTextfield(
                //     inputType: TextInputType.phone,
                //     inputValue: rollNoController,
                //     hintText: '125451'),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                InputLabel(title: AppStrings.enterEmail),
                SizedBox(
                  height: AppDimension.px_6,
                ),
                PrimaryTextfield(
                  inputValue: emailController,
                  hintText: AppStrings.emailFormat,
                ),
                SizedBox(
                  height: AppDimension.px_10,
                ),
                InputLabel(title: AppStrings.enterPassword),
                SizedBox(
                  height: AppDimension.px_6,
                ),
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
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimension.px_20,
                ),
                Container(
                  width: double.maxFinite,
                  height: 56,
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      createAccount();
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
                SizedBox(
                  height: AppDimension.px_25,
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
                            builder: (context) => StudentLoginScreen(),
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
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
