import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/admin/admin_course_screen.dart';
import 'package:content_manage/views/admin/admin_notification_screen.dart';
import 'package:content_manage/views/admin/admin_payment_scree.dart';
import 'package:content_manage/views/common/informatio_view.dart';
import 'package:content_manage/views/get_statarted_screen.dart';
import 'package:content_manage/views/teacher/newclass_screen.dart';
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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
            child: Column(
              children: [
                SizedBox(
                  height: AppDimension.px_50,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/logo.jpg',
                          height: AppDimension.px_32,
                          width: AppDimension.px_32,
                        ),
                        Text(
                          AppStrings.contentManage,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 78, 166, 238),
                            fontSize: AppDimension.px_25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    // Spacer(),
                    CupertinoButton(
                        child: Icon(
                          Icons.logout_outlined,
                          size: AppDimension.px_25.r,
                          color: AppColors.blueColor,
                        ),
                        onPressed: () {
                          logOut();
                        }),
                  ],
                ),

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
                              'Good Morning',
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
                SizedBox(
                  height: AppDimension.px_15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimension.px_10),
                    color: AppColors.blueColor,
                  ),
                  height: AppDimension.px_300,
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.all(AppDimension.px_15),
                    child: Column(
                      children: [
                        Text(
                          'Students Information',
                          style: TextStyle(
                              fontSize: AppDimension.px_25,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: AppDimension.px_15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Total Registered Student',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppDimension.px_20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '425',
                              style: TextStyle(
                                fontSize: AppDimension.px_20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimension.px_7,
                        ),
                        Divider(),
                        SizedBox(
                          height: AppDimension.px_8,
                        ),
                        Row(
                          children: [
                            Text(
                              "Today's Present Student",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppDimension.px_20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '347',
                              style: TextStyle(
                                fontSize: AppDimension.px_20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimension.px_7,
                        ),
                        Divider(),
                        SizedBox(
                          height: AppDimension.px_8,
                        ),
                        Row(
                          children: [
                            Text(
                              "Total Course Available",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppDimension.px_20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '54',
                              style: TextStyle(
                                fontSize: AppDimension.px_20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimension.px_7,
                        ),
                        Divider(),
                        SizedBox(
                          height: AppDimension.px_8,
                        ),
                        Row(
                          children: [
                            Text(
                              "Ongoing Courses",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppDimension.px_20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '46',
                              style: TextStyle(
                                fontSize: AppDimension.px_20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimension.px_15.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewclassScreen(
                          userId: widget.userId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: AppDimension.px_50.h,
                    decoration: BoxDecoration(
                        color: AppColors.blueColor,
                        borderRadius:
                            BorderRadius.circular(AppDimension.px_10.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text(
                            'Schedule a new class',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppDimension.px_16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppColors.blueColor,
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
                                builder: (context) => AdminPaymentScree(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.currency_rupee,
                            color: AppColors.whiteColor,
                          ))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            color: AppColors.whiteColor,
                          ))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminCourseScreen(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.menu_book_rounded,
                            color: AppColors.whiteColor,
                          ))),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminNotificationScreen(),
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
