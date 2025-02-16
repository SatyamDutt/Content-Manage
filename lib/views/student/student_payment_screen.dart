import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentPaymentScreen extends StatefulWidget {
  const StudentPaymentScreen({super.key});

  @override
  State<StudentPaymentScreen> createState() => _StudentPaymentScreenState();
}

class _StudentPaymentScreenState extends State<StudentPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Details',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        leading: BackButton(
          color: AppColors.whiteColor,
        ),
        // backgroundColor: AppColors.blueColor,
        backgroundColor: Color(0xff1d2f47),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
        child: ListView(
          children: [
            SizedBox(
              height: AppDimension.px_25,
            ),
            Container(
              height: AppDimension.px_170,
              width: double.maxFinite,
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 68, 158, 231),
                color: Color(0xff1d2f47),
                borderRadius: BorderRadius.circular(AppDimension.px_10),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Last Month Fee',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppDimension.px_20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'March',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppDimension.px_22,
                              ),
                            ),
                            Text(
                              '${DateFormat('dd MMMM yyyy').format(DateTime(2025, 03, 10))}',
                              style: TextStyle(
                                  fontSize: AppDimension.px_18,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Amount',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppDimension.px_22,
                              ),
                            ),
                            Text(
                              '₹ 500',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppDimension.px_22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimension.px_5,
                    ),
                    MaterialButton(
                      color: AppColors.whiteColor,
                      minWidth: double.maxFinite,
                      onPressed: () {},
                      child: Text(
                        'Pay Now!',
                        // style,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppDimension.px_15,
            ),
            SizedBox(
              height: AppDimension.px_10,
            ),
            Container(
              height: AppDimension.px_350,
              decoration: BoxDecoration(
                  // color: const Color.fromARGB(255, 68, 158, 231),
                  color: Color.fromARGB(255, 45, 53, 65),
                  borderRadius: BorderRadius.circular(AppDimension.px_10)),
              width: double.maxFinite,
              child: Padding( 
                padding: EdgeInsets.all(AppDimension.px_10),
                child: Column(
                  children: [
                    Text(
                      'Your Pending Fees',
                      style: TextStyle(
                        fontSize: AppDimension.px_25,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(
                      height: AppDimension.px_7,
                    ),
                    Divider(
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: AppDimension.px_8,
                    ),
                    Row(
                      children: [
                        Text(
                          "September",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '₹ 500',
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
                    Divider(
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: AppDimension.px_8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Octorber",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '₹ 500',
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
                    Divider(
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: AppDimension.px_8,
                    ),
                    Row(
                      children: [
                        Text(
                          "November",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '₹ 500',
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
                    Divider(
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: AppDimension.px_8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total Dues",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppDimension.px_20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '₹ 1500',
                          style: TextStyle(
                            fontSize: AppDimension.px_20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimension.px_5,
                    ),
                    MaterialButton(
                      color: AppColors.whiteColor,
                      minWidth: double.maxFinite,
                      onPressed: () {},
                      child: Text(
                        'Pay Now!',
                        // style,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppDimension.px_32,
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     'Last payment history',
            //     style: TextStyle(
            //       fontSize: AppDimension.px_20,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: AppDimension.px_10,
            // ),
            // Container(
            //   height: AppDimension.px_100,
            //   width: double.maxFinite,
            //   decoration: BoxDecoration(
            //     // color: const Color.fromARGB(255, 68, 158, 231),
            //     color: Color(0xff1d2f47),
            //     borderRadius: BorderRadius.circular(AppDimension.px_10),
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.all(12.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'January',
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_22,
            //               ),
            //             ),
            //             Text(
            //               '${DateFormat('dd MMMM yyyy').format(DateTime(2025, 01, 10))}',
            //               style: TextStyle(
            //                   fontSize: AppDimension.px_18,
            //                   color: AppColors.whiteColor,
            //                   fontWeight: FontWeight.w500),
            //             ),
            //           ],
            //         ),
            //         Column(
            //           children: [
            //             Text(
            //               'Amount',
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_22,
            //               ),
            //             ),
            //             Text(
            //               '₹ 500',
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_22,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: AppDimension.px_20,
            // ),
            // Container(
            //   height: AppDimension.px_90,
            //   width: double.maxFinite,
            //   decoration: BoxDecoration(
            //     // color: const Color.fromARGB(255, 68, 158, 231),
            //     color: Color(0xff1d2f47),
            //     borderRadius: BorderRadius.circular(AppDimension.px_10),
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.all(12.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'February',
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_22,
            //               ),
            //             ),
            //             Text(
            //               '${DateFormat('dd MMMM yyyy').format(DateTime(2025, 02, 12))}',
            //               style: TextStyle(
            //                   fontSize: AppDimension.px_18,
            //                   color: AppColors.whiteColor,
            //                   fontWeight: FontWeight.w500),
            //             ),
            //           ],
            //         ),
            //         Column(
            //           children: [
            //             Text(
            //               'Amount',
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_22,
            //               ),
            //             ),
            //             Text(
            //               '₹ 500',
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_22,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            
            SizedBox(
              height: AppDimension.px_50,
            ),
          ],
        ),
      ),
    );
  }
}
