// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class TeacherPaymentScreen2 extends StatefulWidget {
//   const TeacherPaymentScreen2({super.key});

//   @override
//   State<TeacherPaymentScreen2> createState() => _TeacherPaymentScreen2State();
// }

// class _TeacherPaymentScreen2State extends State<TeacherPaymentScreen2> {
//   Map<String, dynamic>? paymentDetails;
//   bool isLoading = true; // To show a loader while data is being fetched

//   @override
//   void initState() {
//     super.initState();
//     fetchPaymentDetails();
//   }

//   Future<void> fetchPaymentDetails() async {
//     try {
//       DocumentSnapshot snapshot = await FirebaseFirestore.instance
//           .collection('Students')
//           .doc('4626')
//           .collection('feeDetails')
//           .doc('April')
//           .get();

//       if (snapshot.exists) {
//         setState(() {
//           paymentDetails = snapshot.data() as Map<String, dynamic>;
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           paymentDetails = null;
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print("Error fetching payment details: $e");
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Payment Details")),
//       body: Center(
//         child: isLoading
//             ? CircularProgressIndicator() // Show loader while fetching data
//             : paymentDetails != null
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Name: ${paymentDetails!['name']}",
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       Text("Roll No: ${paymentDetails!['rollNo']}"),
//                       Text("Month: ${paymentDetails!['monthName']}"),
//                       Text("Pending Amount: ₹${paymentDetails!['pendingAmount']}"),
//                     ],
//                   )
//                 : Text(
//                     "No data found",
//                     style: TextStyle(fontSize: 18, color: Colors.red),
//                   ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  String? notice;
  String? noticeDetails;
  bool isLoading = true; // Show loader while fetching data

  @override
  void initState() {
    super.initState();
    fetchNotices();
  }

  Future<void> fetchNotices() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Students')
          .doc('4626') // Student ID
          .collection('Notices')
          .doc('8YGQpyujtt1wmQjx1Tv2') // Notice document ID
          .get();

      setState(() {
        notice =
            snapshot.exists ? snapshot.data().toString() : "No notice found";
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching notice: $e");
      setState(() {
        notice = "Error fetching notice";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice Details'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: isLoading
              ? CircularProgressIndicator() // Show loading while fetching data
              : Text(
                  notice!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
        ),
      ),
    );
  }
}
