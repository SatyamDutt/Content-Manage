import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:flutter/material.dart';

class StudentCourseScreen extends StatelessWidget {
  const StudentCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text(
          'Course Details',
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
              height: AppDimension.px_25,
            ),
            Container(
              height: AppDimension.px_300,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  // color: const Color.fromARGB(255, 126, 192, 247),
                  borderRadius: BorderRadius.circular(AppDimension.px_10)),
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimension.px_5,
                  ),
                  Text(
                    'Courses available',
                    style: TextStyle(
                        fontSize: AppDimension.px_25,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor),
                  ),
                  ListTile(
                    // tileColor: AppColors.greenColor,
                    minTileHeight: AppDimension.px_32,
                    title: Text(
                      'Data Science',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_20),
                    ),
                    // subtitle: Text(
                    //   '3 Months',
                    //   style: TextStyle(
                    //       color: AppColors.whiteColor,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: AppDimension.px_14),
                    // ),
                    // trailing: Text(
                    //   "₹ 1999.00",
                    //   style: TextStyle(
                    //       color: AppColors.whiteColor,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: AppDimension.px_18),
                    // ),
                    subtitle: Row(
                      children: [
                        Text(
                      "₹ 1999.00",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_18),
                    ),
                        Text(
                          ' (3 Months)',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimension.px_16),
                        ),
                      ],
                    ),
                    trailing: MaterialButton(
                        color: AppColors.whiteColor,
                        onPressed: () {},
                        child: Text(
                          'Enroll Now',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ),
                  Divider(),
                  ListTile(
                    minTileHeight: AppDimension.px_32,
                    // tileColor: AppColors.greenColor,
                    title: Text(
                      'App Development',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_20),
                    ),
                    // subtitle: Text(
                    //   '2 Months',
                    //   style: TextStyle(
                    //       color: AppColors.whiteColor,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: AppDimension.px_14),
                    // ),
                    // trailing: Text(
                    //   "₹ 1599.00",
                    //   style: TextStyle(
                    //       color: AppColors.whiteColor,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: AppDimension.px_18),
                    // ),
                     subtitle: Row(
                      children: [
                        Text(
                      "₹ 1599.00",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_18),
                    ),
                        Text(
                          ' (2 Months)',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimension.px_16),
                        ),
                      ],
                    ),
                    trailing: MaterialButton(
                        color: AppColors.whiteColor,
                        onPressed: () {},
                        child: Text(
                          'Enroll Now',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ),
                  Divider(),
                  ListTile(
                    // tileColor: AppColors.greenColor,
                    title: Text(
                      'Web Development',
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_20),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                      "₹ 2999.00",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimension.px_18),
                    ),
                        Text(
                          ' (6 Months)',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppDimension.px_16),
                        ),
                      ],
                    ),
                    trailing: MaterialButton(
                        color: AppColors.whiteColor,
                        onPressed: () {},
                        child: Text(
                          'Enroll Now',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                   
                    // trailing: Text(
                    //   "₹ 2999.00",
                    //   style: TextStyle(
                    //       color: AppColors.whiteColor,
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: AppDimension.px_18),
                    // ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: Padding(
                  //     padding: EdgeInsets.only(right: AppDimension.px_15),
                  //     child: MaterialButton(
                  //       color: AppColors.whiteColor,
                  //       onPressed: () {},
                  //       child: Text(
                  //         'Enroll Now',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
