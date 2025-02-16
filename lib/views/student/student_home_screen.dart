import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/resources/app_styles.dart';
import 'package:content_manage/views/common/informatio_view.dart';
import 'package:content_manage/views/get_statarted_screen.dart';
import 'package:content_manage/views/student/attendence_screen.dart';
import 'package:content_manage/views/student/student_call_screen.dart';
import 'package:content_manage/views/student/student_course_screen.dart';
import 'package:content_manage/views/student/student_notification_details_screen.dart';
import 'package:content_manage/views/student/student_notification_screen.dart';
import 'package:content_manage/views/student/student_payment_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StudentHomeScreen extends StatefulWidget {
  final String userId;
  const StudentHomeScreen({
    super.key,
    required this.userId,
  });

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

bool mathPresent = false;
bool physicsClass = false;
bool chemistryClass = false;
bool englishClass = false;
bool hindiClass = false;

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  String name = 'User';
  String rollNo = 'XXXX';
  String courseName = 'Course';

  DateTime currentDateAndTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("Students")
          .doc(widget.userId)
          .get();

      if (snapshot.exists) {
        setState(() {
          name = snapshot['name'] ?? "user";
          rollNo = snapshot['Roll No'] ?? 'XXXXX';
          courseName = snapshot['course Name'] ?? 'Course Name';
        });
      }
    } catch (e) {
      print("error while loading the user information");
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You have logged out'),
        backgroundColor: AppColors.redColor,
      ),
    );
  }

  Future<List<Map<String, String>>> printData() async {
    List<Map<String, String>> classDetails = [];

    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("Teachers").get();
    for (var teacherDoc in snapshot.docs) {
      QuerySnapshot newClassSnapshot = await FirebaseFirestore.instance
          .collection("Teachers")
          .doc(teacherDoc.id)
          .collection("New class")
          .get();
      for (var classDoc in newClassSnapshot.docs) {
        classDetails.add({
          "teacherName": classDoc["teacherName"],
          "subjectName": classDoc["subjectName"],
          "startTime": classDoc["startTime"],
          "endTime": classDoc["endTime"],
        });
      }
    }
    return classDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // appBar: AppBar(
      //   backgroundColor: Color(0xff1d2f47),
      // ),
      body: Stack(
        children: [
          // Image.asset('assets/bgimg.png',
          // // height: 400,
          // // width: double.maxFinite,
          // ),
          ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/bgimg.png'),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimension.px_25),
                        child: Column(
                          children: [
                            SizedBox(
                              height: AppDimension.px_10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    // Image.asset(
                                    //   'assets/logo.jpg',
                                    //   height: AppDimension.px_32,
                                    //   width: AppDimension.px_32,
                                    // ),
                                    // Image.asset('assets/bgimg.png'),
                                    Text(
                                      AppStrings.contentManage,
                                      style: TextStyle(
                                        // color: const Color.fromARGB(255, 78, 166, 238),
                                        color: AppColors.whiteColor,
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
                                      // color: AppColors.blueColor,
                                      color: AppColors.whiteColor,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${DateFormat('dd-MM-yyyy').format(currentDateAndTime)}',
                                          style: TextStyle(
                                            color: AppColors.greyColor,
                                            fontSize: AppDimension.px_18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppDimension.px_5.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${DateFormat('hh:mm a').format(currentDateAndTime)}',
                                          style: TextStyle(
                                            color: AppColors.greyColor,
                                            fontSize: AppDimension.px_16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppDimension.px_10.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${name}',
                                          // 'Hii ${name}',
                                          style: TextStyle(
                                            fontSize: AppDimension.px_35,
                                            // color: AppColors.blueColor,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       'Good Morning',
                                    //       style: TextStyle(
                                    //         fontWeight: FontWeight.w500,
                                    //         fontSize: AppDimension.px_25,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    SizedBox(
                                      height: AppDimension.px_32.h,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppDimension.px_500),
                                  child: Image.asset(
                                    'assets/profile_photo.jpg',
                                    fit: BoxFit.cover,
                                    height: AppDimension.px_120,
                                    width: AppDimension.px_120,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimension.px_12.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppDimension.px_22.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.home_work_outlined,
                              size: AppDimension.px_40,
                              color: const Color.fromARGB(255, 10, 91, 156),
                            ),
                            SizedBox(
                              width: AppDimension.px_10,
                            ),
                            Column(
                              children: [
                                Text(
                                  AppStrings.dpsSchool,
                                  style: TextStyle(
                                    fontSize: AppDimension.px_20,
                                    color: AppColors.blueColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  AppStrings.address,
                                  style: TextStyle(
                                    fontSize: AppDimension.px_16,
                                    color: AppColors.blueColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimension.px_15,
                        ),
                        InformatioView(
                            heading: AppStrings.studyProgram,
                            iconName: Icons.engineering,
                            subHeading: '${courseName}                   '),
                        SizedBox(
                          height: AppDimension.px_15,
                        ),
                        InformatioView(
                            heading: AppStrings.rollNumber,
                            iconName: Icons.edit_calendar_sharp,
                            subHeading: '${rollNo}                '),

                        SizedBox(
                          height: AppDimension.px_15,
                        ),
                        // Row(
                        //   children: [
                        // Text("Make Your Today's Attendence",
                        // // overflow: TextOverflow.ellipsis,
                        // style: TextStyle(
                        //   fontSize: AppDimension.px_22,
                        // ),
                        // ),
                        //     // Spacer(),

                        //     Column(
                        //       children: [
                        //         Container(
                        //           width: AppDimension.px_50,
                        //           height: AppDimension.px_50,
                        //           child: MaterialButton(
                        //             color: AppColors.redColor,
                        //             highlightColor: Colors.amber,
                        //             splashColor: const Color.fromARGB(255, 214, 73, 17),
                        //             onPressed: () {},
                        //         child: Center(
                        //           child: Text('A',
                        //           style: TextStyle(
                        //             color: AppColors.whiteColor,
                        //                   fontSize: AppDimension.px_25,
                        //                   fontWeight: FontWeight.w700,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         Text(AppStrings.absent),
                        //       ],
                        //     ),
                        //     SizedBox(width: AppDimension.px_20,),
                        //     Column(
                        //       children: [
                        //         Container(
                        //           width: AppDimension.px_50,
                        //           height: AppDimension.px_50,
                        //           child: MaterialButton(
                        //             color: AppColors.greenColor,
                        //             highlightColor: Colors.amber,
                        //             splashColor: const Color.fromARGB(255, 169, 228, 171),
                        //             onPressed: () {},
                        //             child: Center(
                        //               child: Text('P',
                        //               style: TextStyle(
                        //                 color: AppColors.whiteColor,
                        //                 fontSize: AppDimension.px_25,
                        //                 fontWeight: FontWeight.w700,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //         Text(AppStrings.present),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xff1d2f47),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Student Corner/Notices',
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                StudentNotificationDetailsScreen(
                                              title: 'Gandhi Jayanti',
                                              date: DateTime.now(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 330,
                                        height: 40,

                                        //             decoration: BoxDecoration(
                                        //   color: AppColors.greyColor,
                                        //   borderRadius: BorderRadius.circular(10)
                                        // ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                '  Gandhi Jayanti',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: AppDimension.px_16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: AppColors.whiteColor,
                                ),
                                //  ,SizedBox(height: 10,),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                StudentNotificationDetailsScreen(
                                              title: 'Guru Nanak Jayanti',
                                              date: DateTime.now(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 330,
                                        height: 40,

                                        //             decoration: BoxDecoration(
                                        //   color: AppColors.greyColor,
                                        //   borderRadius: BorderRadius.circular(10)
                                        // ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                '  Guru Nanak Jayanti',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: AppDimension.px_16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: AppColors.whiteColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimension.px_10.h,
                        ),
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

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AttendenceScreen(
                                                  subjectName: 'English',
                                                  teacherName: 'K. P. Thakur',
                                                  newDate: DateTime.now(),
                                                  userId: widget.userId),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.green[300],
                                          borderRadius: BorderRadius.circular(
                                              AppDimension.px_10.r)),
                                      child: Center(
                                          child: Text(
                                        'EN',
                                        style: TextStyle(
                                          fontSize: AppDimension.px_25,
                                        ),
                                      )
                                          // Icon(Icons.menu_book_sharp,
                                          // size: 30,
                                          // ),
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text('English')
                                ],
                              ),
                              SizedBox(
                                width: AppDimension.px_25,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AttendenceScreen(
                                                  subjectName: 'Social Science',
                                                  teacherName:
                                                      'Dr. Harivansh Roy',
                                                  newDate: DateTime.now(),
                                                  userId: widget.userId),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[300],
                                          borderRadius: BorderRadius.circular(
                                              AppDimension.px_10.r)),
                                      child: Center(
                                          child: Text(
                                        'SST',
                                        style: TextStyle(
                                          fontSize: AppDimension.px_25,
                                        ),
                                      )
                                          // Icon(Icons.menu_book_sharp,
                                          // size: 30,
                                          // ),
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text('Social Science')
                                ],
                              ),
                              SizedBox(
                                width: AppDimension.px_25,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AttendenceScreen(
                                                  subjectName: 'Hindi',
                                                  teacherName: 'Ramdhari Singh',
                                                  newDate: DateTime.now(),
                                                  userId: widget.userId),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.orange[300],
                                          borderRadius: BorderRadius.circular(
                                              AppDimension.px_10.r)),
                                      child: Center(
                                          child: Text(
                                        'HND',
                                        style: TextStyle(
                                          fontSize: AppDimension.px_25,
                                        ),
                                      )
                                          // Icon(Icons.menu_book_sharp,
                                          // size: 30,
                                          // ),
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text('Hindi')
                                ],
                              ),
                              SizedBox(
                                width: AppDimension.px_15,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimension.px_15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AttendenceScreen(
                                                  subjectName: 'Science',
                                                  teacherName: 'Ashish Arora',
                                                  newDate: DateTime.now(),
                                                  userId: widget.userId),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 181, 151, 233),
                                          borderRadius: BorderRadius.circular(
                                              AppDimension.px_10.r)),
                                      child: Center(
                                          child: Text(
                                        'SC',
                                        style: TextStyle(
                                          fontSize: AppDimension.px_25,
                                        ),
                                      )
                                          // Icon(Icons.menu_book_sharp,
                                          // size: 30,
                                          // ),
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text('Science')
                                ],
                              ),
                              SizedBox(
                                width: AppDimension.px_25,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AttendenceScreen(
                                                  subjectName: 'MatheMatics',
                                                  teacherName:
                                                      'Amit M. agarwal',
                                                  newDate: DateTime.now(),
                                                  userId: widget.userId),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.red[300],
                                          borderRadius: BorderRadius.circular(
                                              AppDimension.px_10.r)),
                                      child: Center(
                                          child: Text(
                                        'MTH',
                                        style: TextStyle(
                                          fontSize: AppDimension.px_25,
                                        ),
                                      )
                                          // Icon(Icons.menu_book_sharp,
                                          // size: 30,
                                          // ),
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text('MatheMatics')
                                ],
                              ),
                              SizedBox(
                                width: AppDimension.px_25,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimension.px_100.h,
                        ),
                      ],
                    ),
                  ),
                  // new class start
                  // FutureBuilder(
                  //     future: printData(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return Center(child: CircularProgressIndicator());
                  //       } else if (snapshot.hasError) {
                  //         return Center(
                  //             child: Text("Error: ${snapshot.error}"));
                  //       } else if (!snapshot.hasData ||
                  //           snapshot.data!.isEmpty) {
                  //         return Center(
                  //             child: Text("No class details found."));
                  //       }
                  //       return Container(
                  //         // height: 600,
                  //         child: SingleChildScrollView(
                  //           scrollDirection: Axis.vertical,
                  //           child: Container(
                  //             height: AppDimension.px_227.h,
                  //             child: ListView.builder(
                  //                 scrollDirection: Axis.vertical,
                  //                 shrinkWrap: true,
                  //                 itemCount: snapshot.data!.length,
                  //                 itemBuilder: (context, index) {
                  //                   var classInfo = snapshot.data![index];
                  //                   return InkWell(
                  //                     onTap: () {
                  //                       Navigator.push(
                  //                         context,
                  //                         MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               AttendenceScreen(
                  //                             subjectName:
                  //                                 '${classInfo["subjectName"] ?? ''}',
                  //                             teacherName:
                  //                                 '${classInfo["teacherName"] ?? ''}',
                  //                             newDate: DateTime(2025, 02, 15), userId: widget.userId,
                  //                           ),
                  //                         ),
                  //                       );
                  //                     },
                  //                     child: Card(
                  //                       color: AppColors.blueColor,
                  //                       child: Padding(
                  //                         padding: const EdgeInsets.all(10.0),
                  //                         child: Column(
                  //                           children: [
                  //                             Row(
                  //                               mainAxisAlignment:
                  //                                   MainAxisAlignment
                  //                                       .spaceBetween,
                  //                               children: [
                  //                                 Expanded(
                  //                                   child: Text(
                  //                                     '${classInfo["subjectName"] ?? ''}',
                  //                                     style: AppStyles
                  //                                         .subHeading,
                  //                                   ),
                  //                                 ),
                  //                                 Text(
                  //                                   '${classInfo["startTime"] ?? ''} - ${classInfo["endTime"] ?? ''}',
                  //                                   style:
                  //                                       AppStyles.mediumFont,
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             Row(
                  //                               children: [
                  //                                 Text(
                  //                                   '${classInfo["teacherName"] ?? ''}',
                  //                                   style:
                  //                                       AppStyles.smallFont,
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             // Text(''),
                  //                             // Divider(),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   );
                  //                 }),
                  //           ),
                  //         ),
                  //       );
                  //     })

                  //new class end
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => AttendenceScreen(
                  //           subjectName: 'MatheMatics',
                  //           teacherName: 'R. D. Sharma',
                  //           newDate: DateTime.now(),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   child: Container(
                  //     height: AppDimension.px_80,

                  //     decoration: BoxDecoration(
                  //         color: AppColors.blueColor,
                  //         borderRadius:
                  //             BorderRadius.circular(AppDimension.px_10)),
                  //     child: Padding(
                  //       padding: EdgeInsets.all(AppDimension.px_15),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 'MatheMatics',
                  //                 style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: AppDimension.px_18,
                  //                     fontWeight: FontWeight.w500),
                  //               ),
                  //               Text(
                  //                 // '10:00 AM - 11:00 PM',
                  //                 'By: R. D. Sharma',
                  //                 style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: AppDimension.px_16,
                  //                     fontWeight: FontWeight.w500),
                  //               )
                  //             ],
                  //           ),
                  //           Spacer(),
                  //           Column(
                  //             children: [
                  //               Text(
                  //                 '09:00 AM - 10:00 AM',
                  //                 style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: AppDimension.px_18,
                  //                     fontWeight: FontWeight.w500),
                  //               ),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     // SizedBox(
                  //     //   height: AppDimension.px_15,
                  //     // ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: AppDimension.px_15,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => AttendenceScreen(
                  //           subjectName: 'Physics',
                  //           teacherName: 'Dr. H. C. verma',
                  //           newDate: DateTime.now(),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   child: Container(
                  //     height: AppDimension.px_80,

                  //     decoration: BoxDecoration(
                  //         color: AppColors.blueColor,
                  //         borderRadius:
                  //             BorderRadius.circular(AppDimension.px_10)),
                  //     child: Padding(
                  //       padding: EdgeInsets.all(AppDimension.px_15),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 'Physics',
                  //                 style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: AppDimension.px_18,
                  //                     fontWeight: FontWeight.w500),
                  //               ),
                  //               Text(
                  //                 // '10:00 AM - 11:00 PM',
                  //                 'By: H. C. Verma',
                  //                 style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: AppDimension.px_16,
                  //                     fontWeight: FontWeight.w500),
                  //               )
                  //             ],
                  //           ),
                  //           Spacer(),
                  //           Column(
                  //             children: [
                  //               Text(
                  //                 '10:00 AM - 11:00 AM',
                  //                 style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: AppDimension.px_18,
                  //                     fontWeight: FontWeight.w500),
                  //               ),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     // SizedBox(
                  //     //   height: AppDimension.px_15,
                  //     // ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: AppDimension.px_15,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => AttendenceScreen(
                  //           subjectName: 'Chemistry',
                  //           teacherName: 'V. K. Jaiswal',
                  //           newDate: DateTime.now(),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   child: Container(
                  //     height: AppDimension.px_80,
                  //     decoration: BoxDecoration(
                  //         color: AppColors.blueColor,
                  //         borderRadius:
                  //             BorderRadius.circular(AppDimension.px_10)),
                  //     child: Padding(
                  //       padding: EdgeInsets.all(AppDimension.px_15),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 'Chemistry',
                  //                 style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: AppDimension.px_18,
                  //                     fontWeight: FontWeight.w500),
                  //               ),
                  //               Text(
                  //                 // '10:00 AM - 11:00 PM',
                  //                 'By: V. K. Jaiswal',
                  //                 style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: AppDimension.px_16,
                  //                     fontWeight: FontWeight.w500),
                  //               )
                  //             ],
                  //           ),
                  //           Spacer(),
                  //           Column(
                  //             children: [
                  //               Text(
                  //                 '11:00 AM - 12:00 PM',
                  //                 style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: AppDimension.px_18,
                  //                     fontWeight: FontWeight.w500),
                  //               ),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: AppDimension.px_50,
                  // ),
                ],
              ),
            ],
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
                            builder: (context) => StudentPaymentScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.currency_rupee,
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
                                builder: (context) => StudentCallScreen(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.phone,
                            color: AppColors.whiteColor,
                          ))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentCourseScreen(),
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
                            builder: (context) => StudentNotificationDetailsScreen(title: 'Gandhi Jayanti', date: DateTime.now(),),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.notifications_outlined,
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
