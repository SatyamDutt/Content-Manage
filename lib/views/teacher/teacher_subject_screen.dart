import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/views/student/attendence_screen.dart';
import 'package:content_manage/views/teacher/teacher_attendence_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherSubjectScreen extends StatefulWidget {
  final String userId;
  final String className;
  const TeacherSubjectScreen(
      {super.key, required this.className, required this.userId});

  @override
  State<TeacherSubjectScreen> createState() => _TeacherSubjectScreenState();
}

class _TeacherSubjectScreenState extends State<TeacherSubjectScreen> {
// void fetchSyllabus() async {

// }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSyllabus();
  }

  List<String> subjects = [];

  void fetchSyllabus() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Syllabus')
          .doc('className')
          .collection('${widget.className}')
          .doc('Subjects')
          .get();

      if (snapshot.exists) {
        // Extract the array of subjects
        List<dynamic> temp = snapshot['SubjectName'];

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1d2f47),
        title: const Text(
          'Subjects Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: BackButton(color: AppColors.whiteColor),
      ),
     
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppDimension.px_25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppDimension.px_50.h,),
              Text('${widget.className}'),
              SizedBox(height: AppDimension.px_50.h,),
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
                                        builder: (context) => TeacherAttendanceScreen(teacherId: widget.userId, subjectName: subject, teacherName: 'Teacher', className: widget.className,)
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: randomColor,
                                      borderRadius: BorderRadius.circular(10),
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
            ],
          ),
        ));
  }
}
