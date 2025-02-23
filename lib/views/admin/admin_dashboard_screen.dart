import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/admin/admin_course_screen.dart';
import 'package:content_manage/views/admin/admin_notification_screen.dart';
import 'package:content_manage/views/admin/admin_payment_scree.dart';
import 'package:content_manage/views/common/informatio_view.dart';
import 'package:content_manage/views/common/temp_screen.dart';
import 'package:content_manage/views/get_statarted_screen.dart';
import 'package:content_manage/views/teacher/newclass_screen.dart';
import 'package:content_manage/views/teacher/teacher_attendence_screen.dart';
import 'package:content_manage/views/teacher/teacher_call_screen.dart';
import 'package:content_manage/views/teacher/teacher_notification_screen.dart';
import 'package:content_manage/views/teacher/teacher_payment_screen.dart';
import 'package:content_manage/views/teacher/teacher_subject_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDashboardScreen extends StatefulWidget {
  final String userId;
  const AdminDashboardScreen({
    super.key,
    required this.userId,
  });

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  String name = 'Teacher';

  @override
  void initState() {
    super.initState();
    fetchedUserData();
  }

  void fetchedUserData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("Teachers")
          .doc(widget.userId)
          .get();

      if (snapshot.exists) {
        setState(() {
          name = snapshot['name'] ?? 'Techer';
        });
      }
    } catch (e) {
      print("error while loading techer information");
    }
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => GetStatartedScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 216, 228, 233),
      appBar: AppBar(
        backgroundColor: Color(0xff1d2f47),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.contentManage,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            CupertinoButton(
                child: Icon(
                  Icons.logout_outlined,
                  size: AppDimension.px_25.r,
                  color: AppColors.whiteColor,
                ),
                onPressed: () {
                  logOut();
                }),
          ],
        ),
        // leading: ,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
            child: ListView(
              children: [
                SizedBox(
                  height: AppDimension.px_15,
                ),
                // Row(
                //   children: [
                //     Image.asset(
                //       'assets/logo.jpg',
                //       height: AppDimension.px_32,
                //       width: AppDimension.px_32,
                //     ),
                //     Text(
                //       AppStrings.contentManage,
                //       style: TextStyle(
                //         color: const Color.fromARGB(255, 78, 166, 238),
                //         fontSize: AppDimension.px_25,
                //         fontWeight: FontWeight.w700,
                //       ),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Image.asset(
                //           'assets/logo.jpg',
                //           height: AppDimension.px_32,
                //           width: AppDimension.px_32,
                //         ),
                //         Text(
                //           AppStrings.contentManage,
                //           style: TextStyle(
                //             color: const Color.fromARGB(255, 78, 166, 238),
                //             // color: Color(0xff1d2f47),
                //             fontSize: AppDimension.px_25,
                //             fontWeight: FontWeight.w700,
                //           ),
                //         ),
                //       ],
                //     ),
                //     // Spacer(),
                //     CupertinoButton(
                //         child: Icon(
                //           Icons.logout_outlined,
                //           size: AppDimension.px_25.r,
                //           color: AppColors.blueColor,
                //         ),
                //         onPressed: () {
                //           logOut();
                //         }),
                //   ],
                // ),

                SizedBox(
                  height: AppDimension.px_15,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hii ${name}',
                              style: TextStyle(
                                fontSize: AppDimension.px_32,
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Good Evening',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: AppDimension.px_25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppDimension.px_500),
                      child: Image.asset(
                        'assets/admin_profile.jpg',
                        fit: BoxFit.cover,
                        height: AppDimension.px_120,
                        width: AppDimension.px_120,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimension.px_15.h,),
                InformatioView(
                    heading: AppStrings.dpsSchool,
                    iconName: Icons.home_work_outlined,
                    subHeading: AppStrings.address),
                SizedBox(
                  height: AppDimension.px_15,
                ),
                InformatioView(
                    heading: AppStrings.yourDesignation,
                    iconName: Icons.engineering_outlined,
                    subHeading: AppStrings.director),
                // SizedBox(
                //   height: AppDimension.px_50,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(AppDimension.px_10),
                //       // color: AppColors.blueColor,
                //       color: Color(0xff1d2f47)),
                //   height: AppDimension.px_300,
                //   width: double.maxFinite,
                //   child: Padding(
                //     padding: EdgeInsets.all(AppDimension.px_15),
                //     child: Column(
                //       children: [
                //         Text(
                //           'Students Information',
                //           style: TextStyle(
                //               fontSize: AppDimension.px_25,
                //               color: AppColors.whiteColor,
                //               fontWeight: FontWeight.w600),
                //         ),
                //         SizedBox(
                //           height: AppDimension.px_15,
                //         ),
                //         Row(
                //           children: [
                //             Text(
                //               'Total Registered Student',
                //               style: TextStyle(
                //                 color: AppColors.whiteColor,
                //                 fontSize: AppDimension.px_20,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             Spacer(),
                //             Text(
                //               '425',
                //               style: TextStyle(
                //                 fontSize: AppDimension.px_20,
                //                 fontWeight: FontWeight.w600,
                //                 color: AppColors.whiteColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: AppDimension.px_7,
                //         ),
                //         Divider(),
                //         SizedBox(
                //           height: AppDimension.px_8,
                //         ),
                //         Row(
                //           children: [
                //             Text(
                //               "Today's Present Student",
                //               style: TextStyle(
                //                 color: AppColors.whiteColor,
                //                 fontSize: AppDimension.px_20,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             Spacer(),
                //             Text(
                //               '347',
                //               style: TextStyle(
                //                 fontSize: AppDimension.px_20,
                //                 fontWeight: FontWeight.w600,
                //                 color: AppColors.whiteColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: AppDimension.px_7,
                //         ),
                //         Divider(),
                //         SizedBox(
                //           height: AppDimension.px_8,
                //         ),
                //         Row(
                //           children: [
                //             Text(
                //               "Total Course Available",
                //               style: TextStyle(
                //                 color: AppColors.whiteColor,
                //                 fontSize: AppDimension.px_20,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             Spacer(),
                //             Text(
                //               '54',
                //               style: TextStyle(
                //                 fontSize: AppDimension.px_20,
                //                 fontWeight: FontWeight.w600,
                //                 color: AppColors.whiteColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: AppDimension.px_7,
                //         ),
                //         Divider(),
                //         SizedBox(
                //           height: AppDimension.px_8,
                //         ),
                //         Row(
                //           children: [
                //             Text(
                //               "Ongoing Courses",
                //               style: TextStyle(
                //                 color: AppColors.whiteColor,
                //                 fontSize: AppDimension.px_20,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             Spacer(),
                //             Text(
                //               '46',
                //               style: TextStyle(
                //                 fontSize: AppDimension.px_20,
                //                 fontWeight: FontWeight.w600,
                //                 color: AppColors.whiteColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
SizedBox(height: AppDimension.px_25.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Subjects",
                          // "Make Today's Attendence",
                          // '${fetchAllClass()}',
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: AppDimension.px_22,
                          ),
                        ),
                        // MaterialButton(
                        //   onPressed: () {
                        //     printData();
                        //   },
                        //   child: Icon(Icons.refresh),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: AppDimension.px_15.h,
                    ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '1st', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColors.greenColor,
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '1st',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Text('English')
                          ],
                        ),
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '2nd', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 228, 208, 35),
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '2nd',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Text('English')
                          ],
                        ),
                      ),
                    ),
                 Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '2nd', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 19, 98, 201),
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '3rd',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Text('English')
                          ],
                        ),
                      ),
                    ),
                 
                  ],
                ),
                SizedBox(
                  height: AppDimension.px_15.h,
                ),Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '1st', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 209, 104, 19),
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '4th',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Text('English')
                          ],
                        ),
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 13, 209, 183),
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '5th',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Text('English')
                          ],
                        ),
                      ),
                    ),
                 Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 185, 14, 228),
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '6th',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Text('English')
                          ],
                        ),
                      ),
                    ),
                 
                  ],
                ),
                SizedBox(
                  height: AppDimension.px_15.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 149, 221, 14),
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '7th',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Text('English')
                          ],
                        ),
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColors.greenColor,
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '8th',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Text('English')
                          ],
                        ),
                      ),
                    ),
                 Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 214, 55, 55),
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '9th',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Text('English')
                          ],
                        ),
                      ),
                    ),
                 
                  ],
                ),
                SizedBox(
                  height: AppDimension.px_15.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSubjectScreen(className: '', userId: widget.userId,),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 226, 137, 20),
                                borderRadius:
                                    BorderRadius.circular(AppDimension.px_10.h),
                              ),
                              child: Center(
                                child: Text(
                                  '10th',
                                  style: TextStyle(
                                    fontSize: AppDimension.px_25.sp,
                                  ),
                                ),
                              ),
                            ),
                            Text('English')
                          ],
                        ),
                      ),
                    ),
                 
                  ],
                ),
                // SizedBox(
                //   height: AppDimension.px_15.h,
                // ),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => NewclassScreen(
                //           userId: widget.userId,
                //         ),
                //       ),
                //     );
                //   },
                //   child: Container(
                //     height: AppDimension.px_50.h,
                //     decoration: BoxDecoration(
                //         // color: AppColors.blueColor,
                //         color: Color(0xff1d2f47),
                //         borderRadius:
                //             BorderRadius.circular(AppDimension.px_10.r)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(15.0),
                //       child: Row(
                //         children: [
                //           Text(
                //             'Schedule a new class',
                //             style: TextStyle(
                //               color: AppColors.whiteColor,
                //               fontSize: AppDimension.px_16.sp,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                
                
                SizedBox(
                  height: AppDimension.px_100.h,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // color: AppColors.blueColor,
              color: Color(0xff1d2f47),
              height: AppDimension.px_50,
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home_outlined,
                        size: AppDimension.px_25,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeacherPaymentScreen(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.currency_rupee,
                            color: AppColors.whiteColor,
                          ))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => 
                                TeacherCallScreen(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.phone,
                            color: AppColors.whiteColor,
                          ))),
                  // Expanded(
                  //     child: IconButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => NoticesScreen(),
                  //             ),
                  //           );
                  //         },
                  //         icon: Icon(
                  //           Icons.menu_book_rounded,
                  //           color: AppColors.whiteColor,
                  //         ))),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeacherNotificationScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.notification_add_outlined,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
