import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/student/student_notification_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class StudentNotificationScreen extends StatefulWidget {
  const StudentNotificationScreen({super.key});

  @override
  State<StudentNotificationScreen> createState() =>
      _StudentNotificationScreenState();
}

class _StudentNotificationScreenState extends State<StudentNotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newNotices();
  }

  void newNotices() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Notices').get();

    setState(() {
      notices = snapshot.docs
          .map((doc) => {'title': doc['Notice Title'], 'date': doc['Date'], 'Notice Detail':doc['Notice Details']})
          .toList();
    });
  }

  List<Map<String, dynamic>> notices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications Details',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: Color(0xff1d2f47),
        centerTitle: true,
        leading: BackButton(
          color: AppColors.whiteColor,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: AppDimension.px_25.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
            child: notices.isEmpty
                                    ? Center(
                                        child: Text(
                                          'No notices now',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 16),
                                        ),
                                      )
                                    : Column(
                                        children: notices.map((notice) {
                                          return Column(
                                            children: [
                                              
                                              Center(
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Center(
                                                        child: InkWell(
                                                          onTap: () {
                                                             Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              StudentNotificationDetailsScreen(
                                                            title: notice['title'],
                                                            // date: notice['date'],
                                                            // date: notice['date'], 
                                                            NoticeDetail: notice['Notice Detail'],
                                                          ),
                                                        ),
                                                                                                        );
                                                          },
                                                          child: Center(
                                                            child: Container(
                                                              width: 360,
                                                              height: 50,                                        
                                                              decoration: BoxDecoration(
                                                                color:Color(0xff1d2f47),
                                                                borderRadius: BorderRadius.circular(AppDimension.px_10.r)
                                                              ),
                                                              child: Center(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      '  ${notice['title']}',
                                                                      textAlign: TextAlign.start,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: AppDimension.px_18.sp,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: AppDimension.px_15.h,),
                                              // Divider(
                                              //   color: Color(0xff1d2f47),
                                              // ),
                                            ],
                                          );
                                        }).toList(),
                                      ), ),
        ],
      ),
    );
  }
}
