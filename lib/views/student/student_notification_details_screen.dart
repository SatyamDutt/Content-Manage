import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentNotificationDetailsScreen extends StatefulWidget {
  final String title;
  final String NoticeDetail;
  // final DateTime date;
  const StudentNotificationDetailsScreen({
    super.key,
    required this.title,
    // required this.date,
    required this.NoticeDetail,
  });

  @override
  State<StudentNotificationDetailsScreen> createState() =>
      _StudentNotificationDetailsScreenState();
}

class _StudentNotificationDetailsScreenState
    extends State<StudentNotificationDetailsScreen> {
  String noticeTitle = "";
  String noticeDetails = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNotices();
  }

  void fetchNotices() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('Students')
        .doc('4626')
        .collection('Notices')
        .doc('8YGQpyujtt1wmQjx1Tv2')
        .get();

    print(snapshot.data().toString());

    setState(() {
      noticeTitle = snapshot['Notice Title'] ?? '';
      noticeDetails = snapshot['Notice Details'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.blueColor,
        backgroundColor: Color(0xff1d2f47),
        title: Text(
          'Notification Details',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        leading: BackButton(
          color: AppColors.whiteColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
        child: Column(
          children: [
            SizedBox(
              height: AppDimension.px_50,
            ),
            Container(
              height: AppDimension.px_330,
              width: double.maxFinite,
              decoration: BoxDecoration(
                // color: AppColors.blueColor,
                color: Color(0xff1d2f47),
                borderRadius: BorderRadius.circular(AppDimension.px_15),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppDimension.px_15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.title}',
                          // widget.title,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
                          // '${DateFormat('dd MMMM yyyy').format(DateTime(2025, 01, 05))}',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimension.px_5,
                    ),
                    Divider(),
                    SizedBox(
                      height: AppDimension.px_5,
                    ),
                    Text(
                      '${widget.NoticeDetail}',
                      // AppStrings.NoticeDetails,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 7,
                      // textWidthBasis: TextWidthBasis.longestLine,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppDimension.px_16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: AppDimension.px_15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Regards',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.dpsSchool,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '+91 ' + AppStrings.defaultNumber,
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppDimension.px_14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
