import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentPaymentScreen extends StatefulWidget {
  final String rollNo;
  const StudentPaymentScreen({
    super.key,
    required this.rollNo,
  });

  @override
  State<StudentPaymentScreen> createState() => _StudentPaymentScreenState();
}

class _StudentPaymentScreenState extends State<StudentPaymentScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchPaymentDetails();
  // }

  // void fetchPaymentDetails() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('Students')
  //       .doc('4626')
  //       .collection('feeDetails')
  //       .doc('April')
  //       .get();

  //   print(snapshot.data().toString());
  // }


// working code target only for specific month
  //   Map<String, dynamic>? paymentDetails;
  // bool isLoading = true; // To show a loader while data is being fetched

  // @override
  // void initState() {
  //   super.initState();
  //   fetchPaymentDetails();
  // }

  // Future<void> fetchPaymentDetails() async {
  //   try {
  //     DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //         .collection('Students')
  //         .doc('4626')
  //         .collection('feeDetails')
  //         .doc('June')
  //         .get();

  //     if (snapshot.exists) {
  //       setState(() {
  //         paymentDetails = snapshot.data() as Map<String, dynamic>;
  //         isLoading = false;
  //       });
  //     } else {
  //       setState(() {
  //         paymentDetails = null;
  //         isLoading = false;
  //       });
  //     }
  //   } catch (e) {
  //     print("Error fetching payment details: $e");
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

    Map<String, dynamic>? paymentDetails;
  bool isLoading = true; // Show loader while fetching data

  @override
  void initState() {
    super.initState();
    fetchPaymentDetails();
  }

  Future<void> fetchPaymentDetails() async {
    try {
      // Fetch the latest fee details for the specific student by roll number
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Payments')
          .doc(widget.rollNo) // Using the passed roll number
          .collection('feeDetails')
          .orderBy('monthName', descending: true) // Order by latest month
          .limit(1) // Fetch only the most recent record
          .get();

      if (snapshot.docs.isNotEmpty) {
        setState(() {
          paymentDetails = snapshot.docs.first.data() as Map<String, dynamic>;
          isLoading = false;
        });
      } else {
        setState(() {
          paymentDetails = null;
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching payment details: $e");
      setState(() {
        isLoading = false;
      });
    }
  }


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

            //static payment contaner
            // Container(
            //   height: AppDimension.px_170,
            //   width: double.maxFinite,
            //   decoration: BoxDecoration(
            //     // color: const Color.fromARGB(255, 68, 158, 231),
            //     color: Color(0xff1d2f47),
            //     borderRadius: BorderRadius.circular(AppDimension.px_10),
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.all(12.0),
            //     child: Column(
            //       children: [
            //         Text(
            //           'Last Month Fee',
            //           style: TextStyle(
            //             color: AppColors.whiteColor,
            //             fontSize: AppDimension.px_20,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   '${paymentDetails!['monthName']}',
            //                   style: TextStyle(
            //                     color: AppColors.whiteColor,
            //                     fontSize: AppDimension.px_22,
            //                   ),
            //                 ),
            //                 Text(
            //                   '${DateFormat('dd MMMM yyyy').format(DateTime(2025, 03, 10))}',
            //                   style: TextStyle(
            //                       fontSize: AppDimension.px_18,
            //                       color: AppColors.whiteColor,
            //                       fontWeight: FontWeight.w500),
            //                 ),
            //               ],
            //             ),
            //             Column(
            //               children: [
            //                 Text(
            //                   'Amount',
            //                   style: TextStyle(
            //                     color: AppColors.whiteColor,
            //                     fontSize: AppDimension.px_22,
            //                   ),
            //                 ),
            //                 Text(
            //                   '₹ 500',
            //                   style: TextStyle(
            //                     color: AppColors.whiteColor,
            //                     fontSize: AppDimension.px_22,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_5,
            //         ),
            //         MaterialButton(
            //           color: AppColors.whiteColor,
            //           minWidth: double.maxFinite,
            //           onPressed: () {},
            //           child: Text(
            //             'Pay Now!',
            //             // style,
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            
            //target for specific month
            Container(
  height: AppDimension.px_170,
  width: double.maxFinite,
  decoration: BoxDecoration(
    color: Color(0xff1d2f47),
    borderRadius: BorderRadius.circular(AppDimension.px_10),
  ),
  child: Padding(
    padding: EdgeInsets.all(12.0),
    child: paymentDetails != null
        ? Column(
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
                        '${paymentDetails!['monthName']}',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppDimension.px_22,
                        ),
                      ),
                      Text(
                        '${DateFormat('dd MMMM yyyy').format(DateTime.now())}', // Current date
                        style: TextStyle(
                          fontSize: AppDimension.px_18,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
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
                        '₹ ${paymentDetails!['pendingAmount']}',
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
                onPressed: () {
                  // Handle Payment Logic
                },
                child: Text(
                  'Pay Now!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimension.px_18,
                  ),
                ),
              )
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 50),
              SizedBox(height: 10),
              Text(
                "No last month pending fee",
                style: TextStyle(
                  fontSize: AppDimension.px_18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
  ),
),

              //dynamic code
      //         Padding(
      //   padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
      //   child: ListView(
      //     children: [
      //       SizedBox(
      //         height: AppDimension.px_25,
      //       ),
      //       Container(
      //         height: AppDimension.px_170,
      //         width: double.maxFinite,
      //         decoration: BoxDecoration(
      //           color: Color(0xff1d2f47),
      //           borderRadius: BorderRadius.circular(AppDimension.px_10),
      //         ),
      //         child: Padding(
      //           padding: EdgeInsets.all(12.0),
      //           child: isLoading
      //               ? Center(child: CircularProgressIndicator())
      //               : paymentDetails != null
      //                   ? Column(
      //                       children: [
      //                         Text(
      //                           'Last Month Fee',
      //                           style: TextStyle(
      //                             color: AppColors.whiteColor,
      //                             fontSize: AppDimension.px_20,
      //                             fontWeight: FontWeight.w600,
      //                           ),
      //                         ),
      //                         Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   '${paymentDetails!['monthName']}',
      //                                   style: TextStyle(
      //                                     color: AppColors.whiteColor,
      //                                     fontSize: AppDimension.px_22,
      //                                   ),
      //                                 ),
      //                                 Text(
      //                                   '${DateFormat('dd MMMM yyyy').format(DateTime.now())}', // Current date
      //                                   style: TextStyle(
      //                                     fontSize: AppDimension.px_18,
      //                                     color: AppColors.whiteColor,
      //                                     fontWeight: FontWeight.w500,
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                             Column(
      //                               children: [
      //                                 Text(
      //                                   'Amount',
      //                                   style: TextStyle(
      //                                     color: AppColors.whiteColor,
      //                                     fontSize: AppDimension.px_22,
      //                                   ),
      //                                 ),
      //                                 Text(
      //                                   '₹ ${paymentDetails!['pendingAmount']}',
      //                                   style: TextStyle(
      //                                     color: AppColors.whiteColor,
      //                                     fontSize: AppDimension.px_22,
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: AppDimension.px_5,
      //                         ),
      //                         MaterialButton(
      //                           color: AppColors.whiteColor,
      //                           minWidth: double.maxFinite,
      //                           onPressed: () {
      //                             // Handle Payment Logic
      //                           },
      //                           child: Text(
      //                             'Pay Now!',
      //                             style: TextStyle(
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: AppDimension.px_18,
      //                             ),
      //                           ),
      //                         )
      //                       ],
      //                     )
      //                   : Column(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Icon(Icons.check_circle, color: Colors.green, size: 50),
      //                         SizedBox(height: 10),
      //                         Text(
      //                           "No last month pending fee",
      //                           style: TextStyle(
      //                             fontSize: AppDimension.px_18,
      //                             fontWeight: FontWeight.bold,
      //                             color: Colors.green,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
            
            SizedBox(
              height: AppDimension.px_15,
            ),
            SizedBox(
              height: AppDimension.px_10,
            ),
            // Container(
            //   height: AppDimension.px_350,
            //   decoration: BoxDecoration(
            //       // color: const Color.fromARGB(255, 68, 158, 231),
            //       color: Color.fromARGB(255, 45, 53, 65),
            //       borderRadius: BorderRadius.circular(AppDimension.px_10)),
            //   width: double.maxFinite,
            //   child: Padding(
            //     padding: EdgeInsets.all(AppDimension.px_10),
            //     child: Column(
            //       children: [
            //         Text(
            //           'Your Pending Fees',
            //           style: TextStyle(
            //             fontSize: AppDimension.px_25,
            //             fontWeight: FontWeight.w500,
            //             color: AppColors.whiteColor,
            //           ),
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_7,
            //         ),
            //         Divider(
            //           color: AppColors.whiteColor,
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_8,
            //         ),
            //         Row(
            //           children: [
            //             Text(
            //               "September",
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_20,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             Spacer(),
            //             Text(
            //               '₹ 500',
            //               style: TextStyle(
            //                 fontSize: AppDimension.px_20,
            //                 fontWeight: FontWeight.w600,
            //                 color: AppColors.whiteColor,
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_7,
            //         ),
            //         Divider(
            //           color: AppColors.whiteColor,
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_8,
            //         ),
            //         Row(
            //           children: [
            //             Text(
            //               "Octorber",
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_20,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             Spacer(),
            //             Text(
            //               '₹ 500',
            //               style: TextStyle(
            //                 fontSize: AppDimension.px_20,
            //                 fontWeight: FontWeight.w600,
            //                 color: AppColors.whiteColor,
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_7,
            //         ),
            //         Divider(
            //           color: AppColors.whiteColor,
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_8,
            //         ),
            //         Row(
            //           children: [
            //             Text(
            //               "November",
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_20,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             Spacer(),
            //             Text(
            //               '₹ 500',
            //               style: TextStyle(
            //                 fontSize: AppDimension.px_20,
            //                 fontWeight: FontWeight.w600,
            //                 color: AppColors.whiteColor,
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_7,
            //         ),
            //         Divider(
            //           color: AppColors.whiteColor,
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_8,
            //         ),
            //         Row(
            //           children: [
            //             Text(
            //               "Total Dues",
            //               style: TextStyle(
            //                 color: AppColors.whiteColor,
            //                 fontSize: AppDimension.px_20,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             Spacer(),
            //             Text(
            //               '₹ 1500',
            //               style: TextStyle(
            //                 fontSize: AppDimension.px_20,
            //                 fontWeight: FontWeight.w600,
            //                 color: AppColors.whiteColor,
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(
            //           height: AppDimension.px_5,
            //         ),
            //         MaterialButton(
            //           color: AppColors.whiteColor,
            //           minWidth: double.maxFinite,
            //           onPressed: () {},
            //           child: Text(
            //             'Pay Now!',
            //             // style,
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            
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
              
      //         Center(
      //   child: isLoading
      //       ? CircularProgressIndicator() // Show loader while fetching data
      //       : paymentDetails != null
      //           ? Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   "Name: ${paymentDetails!['name']}",
      //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //                 ),
      //                 Text("Roll No: ${paymentDetails!['rollNo']}"),
      //                 Text("Month: ${paymentDetails!['monthName']}"),
      //                 Text("Pending Amount: ₹${paymentDetails!['pendingAmount']}"),
      //                 // Text("Data : ${DateFormat('dd-MM-yyyy').format(paymentDetails!['timestamp'])}"),
      //               ],
      //             )
      //           : Text(
      //               "No data found",
      //               style: TextStyle(fontSize: 18, color: Colors.red),
      //             ),
      // ),

      // Center(
      //   child: isLoading
      //       ? CircularProgressIndicator() // Show loader while fetching data
      //       : paymentDetails != null
      //           ? Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   "Name: ${paymentDetails!['name']}",
      //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //                 ),
      //                 Text("Roll No: ${paymentDetails!['rollNo']}"),
      //                 Text("Month: ${paymentDetails!['monthName']}"),
      //                 Text("Pending Amount: ₹${paymentDetails!['pendingAmount']}"),
      //               ],
      //             )
      //           : Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Icon(Icons.check_circle, color: Colors.green, size: 50),
      //                 SizedBox(height: 10),
      //                 Text(
      //                   "No last month pending fee",
      //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
      //                 ),
      //               ],
      //             ),
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
