import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/views/admin/admin_login_screen.dart';
import 'package:content_manage/views/common/syllabus_screen.dart';
import 'package:content_manage/views/common/test_screen.dart';
import 'package:content_manage/views/student/student_login_screen.dart';
import 'package:content_manage/views/student/student_register_screen.dart';
import 'package:content_manage/views/student/student_register_with_phone_screen.dart';
import 'package:content_manage/views/teacher/teacher_login_screen.dart';
import 'package:flutter/material.dart';

class GetStatartedScreen extends StatelessWidget {
  const GetStatartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            child: Image.asset('assets/proceed_screen_image.jpg'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Revolutionizing School Management for a Better Tomorrow.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // S
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentLoginScreen(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'Proceed As Student',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 35,
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: MaterialButton(
                color: const Color.fromARGB(255, 141, 194, 238),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeacherLoginScreen(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Proceed As Teacher',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
