// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:content_manage/resources/app_colors.dart';
// import 'package:content_manage/resources/app_dimension.dart';
// import 'package:content_manage/resources/app_strings.dart';
// import 'package:content_manage/views/common/input_label.dart';
// import 'package:content_manage/views/common/primary_button.dart';
// import 'package:content_manage/views/common/primary_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TeacherPaymentScreen extends StatefulWidget {
//   const TeacherPaymentScreen({super.key});

//   @override
//   State<TeacherPaymentScreen> createState() => _TeacherPaymentScreenState();
// }

// TextEditingController nameController = TextEditingController();
// TextEditingController rollNoCOntroller = TextEditingController();
// TextEditingController monthNameController = TextEditingController();
// TextEditingController pendingAmountController = TextEditingController();

// class _TeacherPaymentScreenState extends State<TeacherPaymentScreen> {
//   void addPendingFee() async {
//     String name = nameController.text.toString();
//     String rollNo = rollNoCOntroller.text.toString();
//     String monthName = monthNameController.text.toString();
//     String pendingAmount = pendingAmountController.text.toString();

//     await FirebaseFirestore.instance
//         .collection("Students")
//         .doc(rollNo)
//         .collection('feeDetails')
//         .doc(monthName)
//         .set({
//           'name': name,
//           'rollNo': rollNo,
//           'monthName':monthName,
//           'pendingAmount':pendingAmount,
//         });

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Pending Fees added'),
//         backgroundColor: AppColors.greenColor,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.blueColor,
//         title: Text(
//           'Payment Details',
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
//         padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: AppDimension.px_25,
//             ),
//             Row(
//               children: [
//                 Text(
//                   'Last month Revenue Details',
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: AppDimension.px_22,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: AppDimension.px_10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total Collected Amount',
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: AppDimension.px_18,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 Text(
//                   '₹ 1,50,000',
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: AppDimension.px_18,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: AppDimension.px_10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total Pending Amount',
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: AppDimension.px_18,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 Text(
//                   '₹ 10,000',
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: AppDimension.px_18,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: AppDimension.px_10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total Profit Amount',
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: AppDimension.px_18,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 Text(
//                   '₹ 57,000',
//                   style: TextStyle(
//                     color: AppColors.primaryColor,
//                     fontSize: AppDimension.px_18,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: AppDimension.px_40,
//             ),
//             Row(
//               children: [
//                 Text(
//                   'Upload Pending fees',
//                   style: TextStyle(
//                     fontSize: AppDimension.px_20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             Divider(),
//             SizedBox(
//               height: AppDimension.px_15,
//             ),
//             InputLabel(title: AppStrings.enterName),
//             SizedBox(
//               height: AppDimension.px_6.h,
//             ),
//             PrimaryTextfield(
//                 inputValue: nameController, hintText: AppStrings.ashishKumar),
//             SizedBox(
//               height: AppDimension.px_10,
//             ),
//             InputLabel(title: AppStrings.enterRollNumber),
//             SizedBox(
//               height: AppDimension.px_6,
//             ),
//             PrimaryTextfield(
//               inputValue: rollNoCOntroller,
//               inputType: TextInputType.phone,
//               hintText: '427',
//             ),
//             SizedBox(
//               height: AppDimension.px_10,
//             ),
//             InputLabel(title: AppStrings.enterMonthName),
//             SizedBox(
//               height: AppDimension.px_6,
//             ),
//             PrimaryTextfield(
//                 inputValue: monthNameController, hintText: 'January'),
//             SizedBox(
//               height: AppDimension.px_10,
//             ),
//             InputLabel(title: AppStrings.enterAmount),
//             SizedBox(
//               height: AppDimension.px_6,
//             ),
//             PrimaryTextfield(
//                 inputValue: pendingAmountController, hintText: '500'),
//             SizedBox(
//               height: AppDimension.px_25,
//             ),
//             PrimaryButton(
//                 ontTap: () {
//                   addPendingFee();
//                 },
//                 title: AppStrings.submit),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherPaymentScreen extends StatefulWidget {
  const TeacherPaymentScreen({super.key});

  @override
  State<TeacherPaymentScreen> createState() => _TeacherPaymentScreenState();
}

class _TeacherPaymentScreenState extends State<TeacherPaymentScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController monthNameController = TextEditingController();
  final TextEditingController pendingAmountController = TextEditingController();

  Future<void> addPendingFee() async {
    String name = nameController.text.trim();
    String rollNo = rollNoController.text.trim();
    String monthName = monthNameController.text.trim();
    String pendingAmountText = pendingAmountController.text.trim();

    // Validation: Ensure all fields are filled
    if (name.isEmpty || rollNo.isEmpty || monthName.isEmpty || pendingAmountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('All fields are required!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Convert pendingAmount to integer (fallback to 0 if parsing fails)
    int pendingAmount = int.tryParse(pendingAmountText) ?? 0;

    try {
      await FirebaseFirestore.instance
          .collection("Payments")
          .doc(rollNo)
          .collection('feeDetails')
          .doc(monthName)
          .set({
        'name': name,
        'rollNo': rollNo,
        'monthName': monthName,
        'pendingAmount': pendingAmount, // Stored as integer
        'timestamp': FieldValue.serverTimestamp(), // Auto timestamp
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pending Fees added successfully'),
          backgroundColor: AppColors.greenColor,
        ),
      );

      // Clear fields after successful submission
      nameController.clear();
      rollNoController.clear();
      monthNameController.clear();
      pendingAmountController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding fee: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.blueColor,
        backgroundColor: Color(0xff1d2f47),
        title: Text(
          'Payment Details',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        centerTitle: true,
        leading: BackButton(color: AppColors.whiteColor),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
        child: ListView(
          children: [
            SizedBox(height: AppDimension.px_25),
            // Text(
            //   'Last month Revenue Details',
            //   style: TextStyle(
            //     color: AppColors.primaryColor,
            //     fontSize: AppDimension.px_22,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            // SizedBox(height: AppDimension.px_10),
            // _buildSummaryRow('Total Collected Amount', '₹ 1,50,000'),
            // _buildSummaryRow('Total Pending Amount', '₹ 10,000'),
            // _buildSummaryRow('Total Profit Amount', '₹ 57,000'),
            SizedBox(height: AppDimension.px_40),
            Text(
              'Upload Pending Fees',
              style: TextStyle(fontSize: AppDimension.px_20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: AppDimension.px_7.h,),
            Divider(),
            SizedBox(height: AppDimension.px_15),
            _buildInputField(AppStrings.enterName, nameController, AppStrings.ashishKumar),
            _buildInputField(AppStrings.enterRollNumber, rollNoController, '427', inputType: TextInputType.phone),
            _buildInputField(AppStrings.enterMonthName, monthNameController, 'January'),
            _buildInputField(AppStrings.enterAmount, pendingAmountController, '500', inputType: TextInputType.number),
            SizedBox(height: AppDimension.px_25),
            PrimaryButton(ontTap: addPendingFee, title: AppStrings.submit),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimension.px_5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppDimension.px_18,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppDimension.px_18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, String hintText, {TextInputType? inputType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(title: label),
        SizedBox(height: AppDimension.px_6),
        PrimaryTextfield(inputValue: controller, hintText: hintText, inputType: inputType),
        SizedBox(height: AppDimension.px_10),
      ],
    );
  }
}

