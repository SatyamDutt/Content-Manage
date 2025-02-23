// import 'package:content_manage/resources/app_colors.dart';
// import 'package:content_manage/resources/app_dimension.dart';
// import 'package:content_manage/resources/app_strings.dart';
// import 'package:content_manage/resources/app_styles.dart';
// import 'package:content_manage/views/common/primary_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';

// class TeacherAttendenceScreen extends StatefulWidget {
//   const TeacherAttendenceScreen({super.key});

//   @override
//   State<TeacherAttendenceScreen> createState() =>
//       _TeacherAttendenceScreenState();
// }

// bool abhishekPresent = false;
// bool abhishekAbsent = false;

// bool chandanPresent = false;
// bool chandanAbsent = false;

// bool AmitPresent = false;
// bool AmitAbsent = false;

// bool shivamPresent = false;
// bool shivamAbsent = false;

// bool akshayPresent = false;
// bool akshayAbsent = false;

// void markAttendence() {

// }

// class _TeacherAttendenceScreenState extends State<TeacherAttendenceScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff1d2f47),
//         title: Text(
//           'Attendence Details',
//           style: TextStyle(
//             color: AppColors.whiteColor,
//           ),
//         ),
//         centerTitle: true,
//         leading: BackButton(
//           color: AppColors.whiteColor,
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25.w),
//         child: Column(
//           children: [
//             SizedBox(
//               height: AppDimension.px_20.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "Physics",
//                       style: TextStyle(
//                         color: Color(0xff1d2f47),
//                         fontSize: AppDimension.px_20.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     Text(
//                       "10th",
//                       style: TextStyle(
//                         color: Color(0xff1d2f47),
//                         fontSize: AppDimension.px_20.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "${DateFormat('dd MMMM yyyy').format(DateTime.now())}",
//                       style: TextStyle(
//                         color: Color(0xff1d2f47),
//                         fontSize: AppDimension.px_16.sp,
//                       ),
//                     ),
//                     Text(
//                       "${DateFormat('hh:mm a').format(DateTime.now())}",
//                       style: TextStyle(
//                         color: Color(0xff1d2f47),
//                         fontSize: AppDimension.px_16.sp,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: AppDimension.px_7,
//             ),
//             Divider(),
//             SizedBox(
//               height: AppDimension.px_7,
//             ),
//             Row(
//               children: [
//                 Text(
//                   "Take today's class attendance.",
//                   style: TextStyle(
//                     color: Color(0xff1d2f47),
//                     fontSize: AppDimension.px_22.sp,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: AppDimension.px_15,
//             ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Student's Name",
//                   style: TextStyle(
//                     fontSize: AppDimension.px_18.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text('Status(P/A)',
//                 style: TextStyle(
//                     fontSize: AppDimension.px_18.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: AppDimension.px_5.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Abhishek Kumar',
//                   style: AppStyles.smallFontBlueColor,
//                 ),
//                 Row(
//                   children: [
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           activeColor: AppColors.redColor,
//                           value: abhishekAbsent,
//                           onChanged: (value) {
//                             setState(() {
//                               if(abhishekPresent == false){
//                                 abhishekAbsent = !abhishekAbsent;
//                               }
//                             });
//                           }),
//                     ),
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           value: abhishekPresent,
//                           checkColor: AppColors.whiteColor,
//                           activeColor: AppColors.greenColor,
//                           onChanged: (value) {
//                             setState(() {
//                               if(abhishekAbsent == false){
//                                 abhishekPresent = !abhishekPresent;
//                               }
//                             });
//                           }),
//                     ),
//                   ],
//                 )
//               ],
//             ),

//             SizedBox(
//               height: AppDimension.px_5.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Chandan Kumar',
//                   style: AppStyles.smallFontBlueColor,
//                 ),
//                 Row(
//                   children: [
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           activeColor: AppColors.redColor,
//                           value: chandanAbsent,
//                           onChanged: (value) {
//                             setState(() {
//                               if(chandanPresent == false){
//                                 chandanAbsent = !chandanAbsent;
//                               }
//                             });
//                           }),
//                     ),
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           value: chandanPresent,
//                           checkColor: AppColors.whiteColor,
//                           activeColor: AppColors.greenColor,
//                           onChanged: (value) {
//                             setState(() {
//                               if(chandanAbsent == false){
//                                 chandanPresent = !chandanPresent;
//                               }
//                             });
//                           }),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//          //3
//          SizedBox(
//               height: AppDimension.px_5.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Amit Kumar',
//                   style: AppStyles.smallFontBlueColor,
//                 ),
//                 Row(
//                   children: [
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           activeColor: AppColors.redColor,
//                           value: AmitAbsent,
//                           onChanged: (value) {
//                             setState(() {
//                               if(AmitPresent == false){
//                                 AmitAbsent = !AmitAbsent;
//                               }
//                             });
//                           }),
//                     ),
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           value: AmitPresent,
//                           checkColor: AppColors.whiteColor,
//                           activeColor: AppColors.greenColor,
//                           onChanged: (value) {
//                             setState(() {
//                               if(AmitAbsent == false){
//                                 AmitPresent = !AmitPresent;
//                               }
//                             });
//                           }),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//          //4
//          SizedBox(
//               height: AppDimension.px_5.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Shivam Kumar',
//                   style: AppStyles.smallFontBlueColor,
//                 ),
//                 Row(
//                   children: [
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           activeColor: AppColors.redColor,
//                           value: shivamAbsent,
//                           onChanged: (value) {
//                             setState(() {
//                               if(shivamPresent == false){
//                                 shivamAbsent = !shivamAbsent;
//                               }
//                             });
//                           }),
//                     ),
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           value: shivamPresent,
//                           checkColor: AppColors.whiteColor,
//                           activeColor: AppColors.greenColor,
//                           onChanged: (value) {
//                             setState(() {
//                               if(shivamAbsent == false){
//                                 shivamPresent = !shivamPresent;
//                               }
//                             });
//                           }),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//          //5
//          SizedBox(
//               height: AppDimension.px_5.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Akshay Kumar',
//                   style: AppStyles.smallFontBlueColor,
//                 ),
//                 Row(
//                   children: [
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           activeColor: AppColors.redColor,
//                           value: akshayAbsent,
//                           onChanged: (value) {
//                             setState(() {
//                               if(akshayPresent == false){
//                                 akshayAbsent = !akshayAbsent;
//                               }
//                             });
//                           }),
//                     ),
//                     Transform.scale(
//                       scale: 1.2,
//                       child: Checkbox(
//                           value: akshayPresent,
//                           checkColor: AppColors.whiteColor,
//                           activeColor: AppColors.greenColor,
//                           onChanged: (value) {
//                             setState(() {
//                               if(akshayAbsent == false){
//                                 akshayPresent = !akshayPresent;
//                               }
//                             });
//                           }),
//                     ),
//                   ],
//                 )
//               ],
//             ),

//          SizedBox(height: AppDimension.px_100.h,),
//            PrimaryButton(ontTap: () {}, title: AppStrings.submit)
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:content_manage/resources/app_colors.dart';
// import 'package:content_manage/resources/app_dimension.dart';
// import 'package:content_manage/resources/app_strings.dart';
// import 'package:content_manage/resources/app_styles.dart';
// import 'package:content_manage/views/common/primary_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';

// class TeacherAttendanceScreen extends StatefulWidget {
//   final String teacherId;
//   const TeacherAttendanceScreen({
//     super.key,
//     required this.teacherId,
//   });

//   @override
//   State<TeacherAttendanceScreen> createState() =>
//       _TeacherAttendanceScreenState();
// }

// class _TeacherAttendanceScreenState extends State<TeacherAttendanceScreen> {
//   // Map to store student attendance (values: 'Present' or 'Absent')
//   Map<String, String> studentAttendance = {
//     'Abhishek Kumar': '',
//     'Chandan Kumar': '',
//     'Amit Kumar': '',
//     'Shivam Kumar': '',
//     'Akshay Kumar': '',
//   };

//   // Function to mark attendance
//   void markAttendance(String studentName, String status) {
//     setState(() {
//       studentAttendance[studentName] = status;
//     });
//   }

//   void addFinalAttendance() async {
//     await FirebaseFirestore.instance
//         .collection('Teachers')
//         .doc(widget.teacherId)
//         .collection('Students Attendance')
//         .add(studentAttendance);

//     setState(() {
//       Map<String, String> studentAttendance = {
//         'Abhishek Kumar': '',
//     'Chandan Kumar': '',
//     'Amit Kumar': '',
//     'Shivam Kumar': '',
//     'Akshay Kumar': '',
//       };
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff1d2f47),
//         title: const Text(
//           'Attendance Details',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         leading: BackButton(color: AppColors.whiteColor),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25.w),
//         child: Column(
//           children: [
//             SizedBox(height: AppDimension.px_20.h),

//             // Class and Date Details
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "Physics",
//                       style: TextStyle(
//                         color: Color(0xff1d2f47),
//                         fontSize: AppDimension.px_20.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     Text(
//                       "10th",
//                       style: TextStyle(
//                         color: Color(0xff1d2f47),
//                         fontSize: AppDimension.px_20.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       DateFormat('dd MMMM yyyy').format(DateTime.now()),
//                       style: TextStyle(
//                         color: Color(0xff1d2f47),
//                         fontSize: AppDimension.px_16.sp,
//                       ),
//                     ),
//                     Text(
//                       DateFormat('hh:mm a').format(DateTime.now()),
//                       style: TextStyle(
//                         color: Color(0xff1d2f47),
//                         fontSize: AppDimension.px_16.sp,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: AppDimension.px_7),
//             const Divider(),
//             SizedBox(height: AppDimension.px_7),

//             // Tagline
//             Row(
//               children: [
//                 Text(
//                   "Take today's class attendance.",
//                   style: TextStyle(
//                     color: Color(0xff1d2f47),
//                     fontSize: AppDimension.px_22.sp,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: AppDimension.px_15),

//             // Attendance Header
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Student's Name",
//                   style: TextStyle(
//                     fontSize: AppDimension.px_18.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   'Status (P/A)',
//                   style: TextStyle(
//                     fontSize: AppDimension.px_18.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: AppDimension.px_5.h),

//             // Student List with Attendance
//             Column(
//               children: studentAttendance.keys.map((student) {
//                 return Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           student,
//                           style: AppStyles.smallFontBlueColor,
//                         ),
//                         Row(
//                           children: [
//                             // Absent Checkbox
//                             Transform.scale(
//                               scale: 1.2,
//                               child: Checkbox(
//                                 activeColor: AppColors.redColor,
//                                 value: studentAttendance[student] == 'Absent',
//                                 onChanged: (value) {
//                                   markAttendance(
//                                       student, value! ? 'Absent' : '');
//                                 },
//                               ),
//                             ),
//                             const Text("A"),

//                             // Present Checkbox
//                             Transform.scale(
//                               scale: 1.2,
//                               child: Checkbox(
//                                 activeColor: AppColors.greenColor,
//                                 checkColor: AppColors.whiteColor,
//                                 value: studentAttendance[student] == 'Present',
//                                 onChanged: (value) {
//                                   markAttendance(
//                                       student, value! ? 'Present' : '');
//                                 },
//                               ),
//                             ),
//                             const Text("P"),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: AppDimension.px_5.h),
//                   ],
//                 );
//               }).toList(),
//             ),

//             // Submit Button
//             SizedBox(height: AppDimension.px_100.h),
//             PrimaryButton(
//               ontTap: () {
//                 addFinalAttendance();
//                 print("Attendance Submitted: $studentAttendance");
//               },
//               title: AppStrings.submit,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/resources/app_styles.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherAttendanceScreen extends StatefulWidget {
  const TeacherAttendanceScreen(
      {super.key,
      required this.teacherId,
      required this.subjectName,
      required this.teacherName,
      required this.className});

  final String teacherId; // Pass teacherId from the parent widget
  final String subjectName;
  final String teacherName;
  final String className;

  @override
  State<TeacherAttendanceScreen> createState() =>
      _TeacherAttendanceScreenState();
}

class _TeacherAttendanceScreenState extends State<TeacherAttendanceScreen> {
  // Map to store student attendance (values: 'Present' or 'Absent')
  // Map<String, String> studentAttendance = {
  //   'Abhishek Kumar': '',
  //   'Chandan Kumar': '',
  //   'Amit Kumar': '',
  //   'Shivam Kumar': '',
  //   'Akshay Kumar': '',
  // };
  Map<String, String> studentAttendance = {};

  void fetchStudent() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('All Students')
        .doc(widget.className)
        .collection('rollNo')
        .get();

    Map<String, String> tempMap = {};

    for (var doc in snapshot.docs) {
      String name = doc['name']; // Assuming 'name' is the field in Firestore
      tempMap[name] = ''; // Initializing attendance as an empty string
    }

    setState(() {
      studentAttendance = tempMap;
    });
  }

  // Function to mark attendance
  void markAttendance(String studentName, String status) {
    setState(() {
      studentAttendance[studentName] = status;
    });
  }

  // Function to add final attendance to Firebase and reset checkboxes
  void addFinalAttendance() async {
    if (startTime == null || endTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select both  start and end Time'),
          backgroundColor: AppColors.redColor,
        ),
      );
    }
    // Set default attendance to 'Absent' for any student with no attendance marked
    studentAttendance.forEach((student, status) {
      if (status.isEmpty) {
        studentAttendance[student] = 'Absent';
      }
    });

    // Convert TimeOfDay to DateTime
    DateTime classStartDateTime =
        DateTime(2023, 1, 1, startTime!.hour, startTime!.minute);
    DateTime classEndTime =
        DateTime(2023, 1, 1, endTime!.hour, endTime!.minute);

    try {
      // Add the attendance data to Firebase

      //  await FirebaseFirestore.instance.collection('Attendence').doc(widget.className).collection('Subjects').doc(widget.subjectName)....

      await FirebaseFirestore.instance
          .collection('Teachers')
          .doc(widget.teacherId)
          .collection('Students Attendance')
          .add({
        'Attendence Status': studentAttendance,
        'CreatedAt': DateTime.now(),
        'Class Name': widget.className,
        'Subject Name': widget.subjectName,
        'Class Start Time': DateFormat('hh:mm a').format(classStartDateTime),
        'Class End Time': DateFormat('hh:mm a').format(classEndTime),
      });

      // Reset student attendance after submission
      setState(() {
        studentAttendance = {
          // 'Abhishek Kumar': '',
          // 'Chandan Kumar': '',
          // 'Amit Kumar': '',
          // 'Shivam Kumar': '',
          // 'Akshay Kumar': '',
        };
        startTime = null;
        endTime = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Attendence Marked Successfully'),
          backgroundColor: AppColors.greenColor,
        ),
      );
    } catch (e) {
      print("Error adding attendance: $e");
    }
  }

  TimeOfDay? startTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context, initialTime: startTime ?? TimeOfDay.now());

    if (picked != null || picked != startTime) {
      setState(() {
        startTime = picked;
      });
    }
  }

  TimeOfDay? endTime;

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context, initialTime: endTime ?? TimeOfDay.now());

    if (picked != null || picked != endTime) {
      setState(() {
        endTime = picked;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStudent();
  }

  // void fetchStudent() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('All Students')
  //       .doc('${widget.className}')
  //       .collection('rollNo')
  //       .get();

  //   print('hellow');

  //   for (var doc in snapshot.docs) {
  //     print(doc.data().toString());
  //   }
  // }

  // void AddAttendanceOfStudent() async {
  //   await FirebaseFirestore.instance.collection('All Students').doc('${widget.className}').collection('rollNo')
  // }

  // void AddAttendanceOfStudent() async {
  //   if (studentAttendance.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('No student data available to update.'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return;
  //   }

  //   try {
  //     for (var entry in studentAttendance.entries) {
  //       String studentName = entry.key;
  //       String status = entry.value.isEmpty ? 'Absent' : entry.value;

  //       // Query to find student document
  //       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //           .collection('All Students')
  //           .doc(widget.className)
  //           .collection('rollNo')
  //           .where('name', isEqualTo: studentName)
  //           .get();

  //       if (querySnapshot.docs.isNotEmpty) {
  //         String docId = querySnapshot.docs.first.id; // Get the document ID

  //         // Update attendance status in Firestore
  //         await FirebaseFirestore.instance
  //             .collection('All Students')
  //             .doc(widget.className)
  //             .collection('rollNo')
  //             .doc(docId)
  //             .update({'attendance': status});
  //       }
  //     }

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Attendance Updated Successfully'),
  //         backgroundColor: Colors.green,
  //       ),
  //     );
  //   } catch (e) {
  //     print("Error updating attendance: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to update attendance'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }

  //new code
  Future<void> addAttendanceData() async {
    if (studentAttendance.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No student data available to update.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Convert TimeOfDay to DateTime
      DateTime classStartDateTime =
          DateTime(2023, 1, 1, startTime!.hour, startTime!.minute);
      DateTime classEndTime =
          DateTime(2023, 1, 1, endTime!.hour, endTime!.minute);

      for (var entry in studentAttendance.entries) {
        String studentName = entry.key;
        String status = entry.value.isEmpty ? 'Absent' : entry.value;

        // Fetch student document by name (assuming rollNo is stored as document ID)
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('All Students')
            .doc(widget.className)
            .collection('rollNo')
            .where('name', isEqualTo: studentName)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          String rollNo =
              querySnapshot.docs.first.id; // Use roll number as document ID

          // String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
          String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

          // Store attendance roll number-wise in the Attendence collection
          await FirebaseFirestore.instance
              .collection('Attendence')
              .doc(widget.className).collection('Subjects').doc(widget.subjectName)
              .collection('RollNumbers')
              .doc(rollNo) // Using roll number as document ID
              .collection('Dates').doc(formattedDate).set(
                  {
                'name': studentName,
                'rollNo': rollNo,
                'attendance': status,
                'timestamp': FieldValue.serverTimestamp(),
                'Subject Name': widget.subjectName,
                'Teacher ID': widget.teacherId,
                'Teacher Name': widget.teacherName,
                'Class Start Time':
                    DateFormat('hh:mm a').format(classStartDateTime),
                'Class End Time': DateFormat('hh:mm a').format(classEndTime),
              },
                  SetOptions(
                      merge:
                          true)); // Merge to prevent overwriting previous data
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Attendance Stored Roll Number-wise Successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print("Error storing attendance: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to store attendance'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


//total attendence
// Future<void> addAttendanceData() async {
//   if (studentAttendance.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('No student data available to update.'),
//         backgroundColor: Colors.red,
//       ),
//     );
//     return;
//   }

//   try {
//     for (var entry in studentAttendance.entries) {
//       String studentName = entry.key;
//       String status = entry.value.isEmpty ? 'Absent' : entry.value;

//       // Fetch student roll number
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('All Students')
//           .doc(widget.className)
//           .collection('rollNo')
//           .where('name', isEqualTo: studentName)
//           .get();

//       if (querySnapshot.docs.isNotEmpty) {
//         String rollNo = querySnapshot.docs.first.id; // Assuming roll number is document ID

//         // Reference to the student's attendance document
//         DocumentReference attendanceRef = FirebaseFirestore.instance
//             .collection('Attendence')
//             .doc(widget.className)
//             .collection('RollNumbers')
//             .doc(rollNo);

//         // Fetch the current attendance record for this student
//         DocumentSnapshot attendanceSnapshot = await attendanceRef.get();

//         int totalPresent = 0;
//         int totalAbsent = 0;

//         if (attendanceSnapshot.exists) {
//           // If the document exists, get the current counts
//           Map<String, dynamic> data = attendanceSnapshot.data() as Map<String, dynamic>;
//           totalPresent = (data['totalPresent'] ?? 0);
//           totalAbsent = (data['totalAbsent'] ?? 0);
//         }

//         // Increment based on the new status
//         if (status == 'Present') {
//           totalPresent++;
//         } else {
//           totalAbsent++;
//         }

//         // Store attendance roll number-wise with updated total count
//         await attendanceRef.set({
//           'name': studentName,
//           'rollNo': rollNo,
//           'lastAttendance': status, // Last recorded attendance
//           'totalPresent': totalPresent,
//           'totalAbsent': totalAbsent,
//           'lastUpdated': FieldValue.serverTimestamp(),
//           'Subject Name': widget.subjectName,
//           'Teacher ID': widget.teacherId,
//           'Teacher Name': widget.teacherName,
//         }, SetOptions(merge: true)); // Merge to avoid overwriting previous data
//       }
//     }

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Attendance Stored Successfully with Total Count'),
//         backgroundColor: Colors.green,
//       ),
//     );
//   } catch (e) {
//     print("Error storing attendance: $e");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Failed to store attendance'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1d2f47),
        title: const Text(
          'Attendance Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: BackButton(color: AppColors.whiteColor),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25.w),
        child: ListView(
          children: [
            SizedBox(height: AppDimension.px_20.h),

            // Class and Date Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '${widget.subjectName}',
                      // "Physics",
                      style: TextStyle(
                        color: Color(0xff1d2f47),
                        fontSize: AppDimension.px_20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${widget.className}',
                      // "10th",
                      style: TextStyle(
                        color: Color(0xff1d2f47),
                        fontSize: AppDimension.px_20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      DateFormat('dd MMMM yyyy').format(DateTime.now()),
                      style: TextStyle(
                        color: Color(0xff1d2f47),
                        fontSize: AppDimension.px_16.sp,
                      ),
                    ),
                    Text(
                      DateFormat('hh:mm a').format(DateTime.now()),
                      style: TextStyle(
                        color: Color(0xff1d2f47),
                        fontSize: AppDimension.px_16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppDimension.px_7),
            const Divider(),
            SizedBox(height: AppDimension.px_7),

            // Tagline
            Row(
              children: [
                Text(
                  "Take today's class attendance.",
                  style: TextStyle(
                    color: Color(0xff1d2f47),
                    fontSize: AppDimension.px_22.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimension.px_15),

            // Attendance Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Student's Name",
                  style: TextStyle(
                    fontSize: AppDimension.px_18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Status (P/A)',
                  style: TextStyle(
                    fontSize: AppDimension.px_18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimension.px_5.h),

            // Student List with Attendance
            Column(
              children: studentAttendance.keys.map((student) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          student,
                          style: AppStyles.smallFontBlueColor,
                        ),
                        Row(
                          children: [
                            // Absent Checkbox
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                activeColor: AppColors.redColor,
                                value: studentAttendance[student] == 'Absent',
                                onChanged: (value) {
                                  markAttendance(
                                      student, value! ? 'Absent' : '');
                                },
                              ),
                            ),
                            const Text("A"),

                            // Present Checkbox
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                activeColor: AppColors.greenColor,
                                checkColor: AppColors.whiteColor,
                                value: studentAttendance[student] == 'Present',
                                onChanged: (value) {
                                  markAttendance(
                                      student, value! ? 'Present' : '');
                                },
                              ),
                            ),
                            const Text("P"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimension.px_5.h),
                  ],
                );
              }).toList(),
            ),

            SizedBox(
              height: AppDimension.px_32.h,
            ),
            InputLabel(title: 'Select start time'),
            SizedBox(
              height: AppDimension.px_6.h,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimension.px_10.r),
                  border: Border.all()),
              child: Padding(
                padding: EdgeInsets.all(AppDimension.px_5.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(startTime != null
                        ? "Selected Time: ${startTime!.format(context)}"
                        : "Not Picked"),
                    // MaterialButton(
                    //   color: Color(0xff1d2f47),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(
                    //     AppDimension.px_25.r,
                    //   )),
                    //   onPressed: () {
                    //     _selectTime(context);
                    //   },
                    //   child:
                    //   Text(
                    //     'Pick Time',
                    //     style: TextStyle(
                    //       color: AppColors.whiteColor,
                    //     ),
                    //   ),
                    // ),

                    IconButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        icon: Icon(
                          Icons.access_time,
                          size: AppDimension.px_32.r,
                          color: Color(0xff1d2f47),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppDimension.px_10.h,
            ),
            //2
            InputLabel(title: 'Select end Time'),
            SizedBox(
              height: AppDimension.px_6.h,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimension.px_10.r),
                  border: Border.all()),
              child: Padding(
                padding: EdgeInsets.all(AppDimension.px_5.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(endTime != null
                        ? "Selected Time: ${endTime!.format(context)}"
                        : "Not Picked"),
                    // MaterialButton(
                    //   color: Color(0xff1d2f47),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(
                    //     AppDimension.px_25.r,
                    //   )),
                    //   onPressed: () {
                    //     _selectEndTime(context);
                    //   },
                    //   child: Text(
                    //     'Pick Time',
                    //     style: TextStyle(
                    //       color: AppColors.whiteColor,
                    //     ),
                    //   ),
                    // ),
                    IconButton(
                        onPressed: () {
                          _selectEndTime(context);
                        },
                        icon: Icon(
                          Icons.access_time,
                          size: AppDimension.px_32.r,
                          color: Color(0xff1d2f47),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // Submit Button
            SizedBox(height: AppDimension.px_32.h),
            PrimaryButton(
              ontTap: () {
                addFinalAttendance(); // Save attendance and clear checkboxes
                // fetchStudent();
                // AddAttendanceOfStudent();
                addAttendanceData();
              },
              title: AppStrings.submit,
            ),
            SizedBox(height: AppDimension.px_50.h,),
          ],
        ),
      ),
    );
  }
}
