import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/resources/app_styles.dart';
import 'package:content_manage/views/common/informatio_view.dart';
import 'package:content_manage/views/common/syllabus_screen.dart';
import 'package:content_manage/views/common/temp_screen.dart';
import 'package:content_manage/views/get_statarted_screen.dart';
import 'package:content_manage/views/student/attendence_screen.dart';
import 'package:content_manage/views/student/student_call_screen.dart';
import 'package:content_manage/views/student/student_course_screen.dart';
import 'package:content_manage/views/student/student_notification_details_screen.dart';
import 'package:content_manage/views/student/student_notification_screen.dart';
import 'package:content_manage/views/student/student_payment_screen.dart';
import 'package:content_manage/views/teacher/teacher_payment_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StudentHomeScreen extends StatefulWidget {
  final String uid;
  // final String? className;
  // final String userId;
  const StudentHomeScreen(
      {super.key,
      // required this.userId,
      // this.className,
      required this.uid});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

bool mathPresent = false;
bool physicsClass = false;
bool chemistryClass = false;
bool englishClass = false;
bool hindiClass = false;

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempData();
    fetchSyllabus();
    newNotices();
    // tempSyllabus();
  }

  String name = 'User';
  String rollNo = 'XXXX';
  String courseName = 'Course';
  String className = 'XX';

  DateTime currentDateAndTime = DateTime.now();
  // @override
  // void initState() {
  //   super.initState();
  //   // fetchUserData();
  //   fetchNotices();
  //   fetchSyllabus();
  //   tempData();
  // }

  String tempName = '';
  int temproll = 123;
  String tempClass = '11th';

  void tempData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Students')
          .doc(widget.uid)
          .get();

      setState(() {
        tempName = snapshot['name'];
        print(tempName);
        temproll = snapshot['rollno'];
        print(temproll);
        tempClass = snapshot['class Name'];
        print(tempClass);
        fetchSyllabus();
      });
    } catch (e) {
      print('Error in temp Fucntion');
    }
  }

  // void fetchUserData() async {
  //   try {
  //     // DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //     //     .collection("Students")
  //     //     .doc(widget.className)
  //     //     .collection('rollNo')
  //     //     .doc(widget.userId)
  //     //     .get();

  //     DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //         .collection("Students")
  //         .doc(widget.userId)
  //         .get();

  //     // print(widget.userId);
  //     // print(snapshot.data().toString());
  //     rollNo = snapshot['rollno'] ?? 'XXXXX';
  //     print(rollNo);

  //     if (snapshot.exists) {
  //       print(widget.userId);
  //       print(snapshot.data().toString());
  //       print('Hello');
  //       name = snapshot['name'] ?? "user";
  //       print(name);
  //       rollNo = snapshot['rollno'] ?? 'XXXXX';
  //       print(rollNo);
  //       // rollNo = snapshot['Roll No'] ?? 'XXXXX';
  //       // courseName = snapshot['course Name'] ?? 'Course Name';
  //       className = snapshot['class Name'] ?? 'Class Name';
  //       print(className);
  //       setState(() {
  //         // name = snapshot['name'] ?? "user";
  //         // rollNo = snapshot['Roll No'] ?? 'XXXXX';
  //         // rollNo = snapshot['Roll No'] ?? 'XXXXX';
  //         // courseName = snapshot['course Name'] ?? 'Course Name';
  //         // className = snapshot['class Name'] ?? 'Class Name';
  //         print('hii');
  //       });
  //     }
  //   } catch (e) {
  //     print("error while loading the user information");
  //   }
  // }

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

//start
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

  var notice;

  // void fetchNotices() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('Students')
  //       .doc('4626')
  //       .collection('Notices')
  //       .doc('8YGQpyujtt1wmQjx1Tv2')
  //       .get();

  //   notice = snapshot.data().toString();

  //   print(snapshot.data().toString());
  // }

  List<String> subjects = [];
//end
  void fetchSyllabus() async {
    try {
      // DocumentSnapshot snapshot = await FirebaseFirestore.instance
      //     .collection('Syllabus')
      //     .doc('className')
      //     .collection('1st}')
      //     .doc('Subjects')
      //     .get();

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Syllabus')
          .doc('className')
          .collection('${tempClass}')
          .doc('Subjects')
          .get();

      print(snapshot.data().toString());

      if (snapshot.exists) {
        // Extract the array of subjects
        List<dynamic> temp = snapshot['SubjectName'];

        print(temp);

        // Convert it to a List<String> and update state
        setState(() {
          subjects = List<String>.from(temp);
        });
      } else {
        print("Document does not exist.");
      }
    } catch (e) {
      print("Error fetching syllabus: $e");
    }
  }

//end
  void tempSyllabus() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('Syllabus')
        .doc('className')
        .collection('1st')
        .doc('Subjects')
        .get();

    print(snapshot.data().toString());
  }
// for new noties and correct notices
  // void newNotices() async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection('Notices').get();

  //   for (var doc in snapshot.docs) {
  //     print(doc['Notice Title']);
  //   }
  // }

  // Fetch the notices from Firebase
  void newNotices() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Notices').orderBy('Date', descending: true).limit(2).get();

    setState(() {
      notices = snapshot.docs
          .map((doc) => {'title': doc['Notice Title'], 'date': doc['Date'], 'Notice Detail':doc['Notice Details']})
          .toList();
    });
  }

  List<Map<String, dynamic>> notices = [];

  final random = Random();
  List<Color> availableColors = [
    Colors.green[300]!,
    Colors.blueGrey[300]!,
    Colors.orange[300]!,
    Colors.purple[300]!,
    Colors.red[300]!,
    Colors.cyan[300]!,
    Colors.pink[300]!,
    Colors.teal[300]!,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              Stack(
                children: [
                  Image.asset(
                    'assets/bgimg.png',
                    // width: size.width,
                    // height: size.height,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppDimension.px_25),
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
                                  // fetchUserData();
                                  // fetchSyllabus();
                                  // tempData();
                                  // print('it is class Name'+className);
                                  // tempData();
                                  // tempSyllabus();
                                  
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
                                      // '${name}',
                                      '${tempName}',
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
                              borderRadius:
                                  BorderRadius.circular(AppDimension.px_500),
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
                padding: EdgeInsets.symmetric(horizontal: AppDimension.px_22.w),
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
                      // subHeading: '${className}                   ',
                      subHeading: '${tempClass}                   ',
                    ),
                    SizedBox(
                      height: AppDimension.px_15,
                    ),
                    InformatioView(
                      heading: AppStrings.rollNumber,
                      iconName: Icons.edit_calendar_sharp,
                      // subHeading: '${rollNo}                ',
                      subHeading: '${temproll}                ',
                    ),
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

                    //static notices
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Color(0xff1d2f47),
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(15.0),
                    //     child: Column(
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Text(
                    //               'Student Corner/Notices',
                    //               style: TextStyle(
                    //                 color: AppColors.whiteColor,
                    //                 fontSize: 20,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           height: 10,
                    //         ),
                    //         Row(
                    //           children: [
                    //             InkWell(
                    //               onTap: () {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         StudentNotificationDetailsScreen(
                    //                       title: 'Gandhi Jayanti',
                    //                       date: DateTime.now(),
                    //                     ),
                    //                   ),
                    //                 );
                    //               },
                    //               child: Container(
                    //                 width: 330,
                    //                 height: 40,

                    //                 //             decoration: BoxDecoration(
                    //                 //   color: AppColors.greyColor,
                    //                 //   borderRadius: BorderRadius.circular(10)
                    //                 // ),
                    //                 child: Center(
                    //                   child: Row(
                    //                     children: [
                    //                       Text(
                    //                         '  Gandhi Jayanti',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: AppDimension.px_16,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         Divider(
                    //           color: AppColors.whiteColor,
                    //         ),
                    //         //  ,SizedBox(height: 10,),
                    //         Row(
                    //           children: [
                    //             InkWell(
                    //               onTap: () {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         StudentNotificationDetailsScreen(
                    //                       title: 'Guru Nanak Jayanti',
                    //                       date: DateTime.now(),
                    //                     ),
                    //                   ),
                    //                 );
                    //               },
                    //               child: Container(
                    //                 width: 330,
                    //                 height: 40,

                    //                 //             decoration: BoxDecoration(
                    //                 //   color: AppColors.greyColor,
                    //                 //   borderRadius: BorderRadius.circular(10)
                    //                 // ),
                    //                 child: Center(
                    //                   child: Row(
                    //                     children: [
                    //                       Text(
                    //                         '  Guru Nanak Jayanti',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: AppDimension.px_16,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         Divider(
                    //           color: AppColors.whiteColor,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: AppDimension.px_10.h,
                    // ),
                    //end of static notices
                    // Text('${notice['Notice Title' ?? ''].toString()}'),

                    // dynamic notices
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
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Check if notices are available
                            notices.isEmpty
                                ? Center(
                                    child: Text(
                                      'No notices now',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )
                                : Column(
                                    children: notices.map((notice) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      StudentNotificationDetailsScreen(
                                                    title: notice['title'],
                                                    // date: notice['date'], 
                                                    NoticeDetail: notice['Notice Detail'],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 330,
                                              height: 40,
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '  ${notice['title']}',
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.white,
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    //end of dynamci notices
                    SizedBox(height: AppDimension.px_10.h,),
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

                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 3),
                    //   child: Row(
                    //     children: [
                    //       Column(
                    //         children: [
                    //           InkWell(
                    //             onTap: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AttendenceScreen(
                    //                           subjectName: 'English',
                    //                           teacherName: 'K. P. Thakur',
                    //                           newDate: DateTime.now(),
                    //                           userId: widget.userId),
                    //                 ),
                    //               );
                    //             },
                    //             child: Container(
                    //               height: 100,
                    //               width: 100,
                    //               decoration: BoxDecoration(
                    //                   color: Colors.green[300],
                    //                   borderRadius: BorderRadius.circular(
                    //                       AppDimension.px_10.r)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'EN',
                    //                 style: TextStyle(
                    //                   fontSize: AppDimension.px_25,
                    //                 ),
                    //               )
                    //                   // Icon(Icons.menu_book_sharp,
                    //                   // size: 30,
                    //                   // ),
                    //                   ),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 7,
                    //           ),
                    //           Text('English')
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: AppDimension.px_25,
                    //       ),
                    //       Column(
                    //         children: [
                    //           InkWell(
                    //             onTap: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AttendenceScreen(
                    //                           subjectName: 'Social Science',
                    //                           teacherName:
                    //                               'Dr. Harivansh Roy',
                    //                           newDate: DateTime.now(),
                    //                           userId: widget.userId),
                    //                 ),
                    //               );
                    //             },
                    //             child: Container(
                    //               height: 100,
                    //               width: 100,
                    //               decoration: BoxDecoration(
                    //                   color: Colors.blueGrey[300],
                    //                   borderRadius: BorderRadius.circular(
                    //                       AppDimension.px_10.r)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'SST',
                    //                 style: TextStyle(
                    //                   fontSize: AppDimension.px_25,
                    //                 ),
                    //               )
                    //                   // Icon(Icons.menu_book_sharp,
                    //                   // size: 30,
                    //                   // ),
                    //                   ),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 7,
                    //           ),
                    //           Text('Social Science')
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: AppDimension.px_25,
                    //       ),
                    //       Column(
                    //         children: [
                    //           InkWell(
                    //             onTap: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AttendenceScreen(
                    //                           subjectName: 'Hindi',
                    //                           teacherName: 'Ramdhari Singh',
                    //                           newDate: DateTime.now(),
                    //                           userId: widget.userId),
                    //                 ),
                    //               );
                    //             },
                    //             child: Container(
                    //               height: 100,
                    //               width: 100,
                    //               decoration: BoxDecoration(
                    //                   color: Colors.orange[300],
                    //                   borderRadius: BorderRadius.circular(
                    //                       AppDimension.px_10.r)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'HND',
                    //                 style: TextStyle(
                    //                   fontSize: AppDimension.px_25,
                    //                 ),
                    //               )
                    //                   // Icon(Icons.menu_book_sharp,
                    //                   // size: 30,
                    //                   // ),
                    //                   ),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 7,
                    //           ),
                    //           Text('Hindi')
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: AppDimension.px_15,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: AppDimension.px_15,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 3),
                    //   child: Row(
                    //     children: [
                    //       Column(
                    //         children: [
                    //           InkWell(
                    //             onTap: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AttendenceScreen(
                    //                           subjectName: 'Science',
                    //                           teacherName: 'Ashish Arora',
                    //                           newDate: DateTime.now(),
                    //                           userId: widget.userId),
                    //                 ),
                    //               );
                    //             },
                    //             child: Container(
                    //               height: 100,
                    //               width: 100,
                    //               decoration: BoxDecoration(
                    //                   color: const Color.fromARGB(
                    //                       255, 181, 151, 233),
                    //                   borderRadius: BorderRadius.circular(
                    //                       AppDimension.px_10.r)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'SC',
                    //                 style: TextStyle(
                    //                   fontSize: AppDimension.px_25,
                    //                 ),
                    //               )
                    //                   // Icon(Icons.menu_book_sharp,
                    //                   // size: 30,
                    //                   // ),
                    //                   ),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 7,
                    //           ),
                    //           Text('Science')
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: AppDimension.px_25,
                    //       ),
                    //       Column(
                    //         children: [
                    //           InkWell(
                    //             onTap: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AttendenceScreen(
                    //                           subjectName: 'MatheMatics',
                    //                           teacherName:
                    //                               'Amit M. agarwal',
                    //                           newDate: DateTime.now(),
                    //                           userId: widget.userId),
                    //                 ),
                    //               );
                    //             },
                    //             child: Container(
                    //               height: 100,
                    //               width: 100,
                    //               decoration: BoxDecoration(
                    //                   color: Colors.red[300],
                    //                   borderRadius: BorderRadius.circular(
                    //                       AppDimension.px_10.r)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'MTH',
                    //                 style: TextStyle(
                    //                   fontSize: AppDimension.px_25,
                    //                 ),
                    //               )
                    //                   // Icon(Icons.menu_book_sharp,
                    //                   // size: 30,
                    //                   // ),
                    //                   ),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 7,
                    //           ),
                    //           Text('MatheMatics')
                    //         ],
                    //       ),
                    //       SizedBox(
                    //         width: AppDimension.px_25,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: AppDimension.px_100.h,
                    // ),

                    //new code
                    //                 subjects.isEmpty
                    // ? Center(child: CircularProgressIndicator())
                    // : Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 3),
                    //     child: Column(
                    //       children: [
                    //         Wrap(
                    //           spacing: AppDimension.px_25,
                    //           runSpacing: AppDimension.px_15,
                    //           children: subjects.map((subject) {
                    //             String subjectCode = subject.length >= 2
                    //                 ? subject.substring(0, 2).toUpperCase()
                    //                 : subject.toUpperCase(); // Ensures at least 2 characters

                    //             Map<String, dynamic> subjectDetails = {
                    //               "English": {"teacher": "K. P. Thakur", "color": Colors.green[300]},
                    //               "Social Science": {"teacher": "Dr. Harivansh Roy", "color": Colors.blueGrey[300]},
                    //               "Hindi": {"teacher": "Ramdhari Singh", "color": Colors.orange[300]},
                    //               "Science": {"teacher": "Ashish Arora", "color": Color.fromARGB(255, 181, 151, 233)},
                    //               "Mathematics": {"teacher": "Amit M. Agarwal", "color": Colors.red[300]},
                    //             };

                    //             return Column(
                    //               children: [
                    //                 InkWell(
                    //                   onTap: () {
                    //                     Navigator.push(
                    //                       context,
                    //                       MaterialPageRoute(
                    //                         builder: (context) => AttendenceScreen(
                    //                           subjectName: subject,
                    //                           teacherName: subjectDetails[subject]?["teacher"] ?? "Unknown",
                    //                           newDate: DateTime.now(),
                    //                           userId: widget.userId,
                    //                         ),
                    //                       ),
                    //                     );
                    //                   },
                    //                   child: Container(
                    //                     height: 100,
                    //                     width: 100,
                    //                     decoration: BoxDecoration(
                    //                       color: subjectDetails[subject]?["color"] ?? Colors.grey[300],
                    //                       borderRadius: BorderRadius.circular(AppDimension.px_10.r),
                    //                     ),
                    //                     child: Center(
                    //                       child: Text(
                    //                         subjectCode,
                    //                         style: TextStyle(fontSize: AppDimension.px_25),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(height: 7),
                    //                 Text(subject),
                    //               ],
                    //             );
                    //           }).toList(),
                    //         ),
                    //         SizedBox(height: AppDimension.px_100.h),
                    //       ],
                    //     ),
                    //   ),

                    subjects.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Column(children: [
                              Wrap(
                                spacing: 20,
                                runSpacing: 15,
                                children: subjects.map((subject) {
                                  String subjectCode = subject.length >= 2
                                      ? subject.substring(0, 2).toUpperCase()
                                      : subject.toUpperCase();

                                  Color randomColor = availableColors[
                                      random.nextInt(availableColors.length)];

                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AttendenceScreen(
                                                teacherName: "Unknown",
                                                newDate: DateTime.now(),
                                                userId: widget.uid,
                                                subjectName: subject,
                                                className: tempClass,
                                                rollNo: temproll,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: randomColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              subjectCode,
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(subject),
                                    ],
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 50),
                            ]),
                          ),
                 SizedBox(height: AppDimension.px_50.h,),
                  ],
                ),
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
                            builder: (context) => StudentPaymentScreen(
                              rollNo: temproll.toString(),
                            ),
                            // builder: (context) => TeacherPaymentScreen2(),
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
                  // Expanded(
                  //     child: IconButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => SyllabusScreen(),
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
                            builder: (context) =>
                                StudentNotificationScreen(),
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
