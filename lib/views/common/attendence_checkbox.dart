// import 'package:content_manage/resources/app_colors.dart';
// import 'package:content_manage/resources/app_dimension.dart';
// import 'package:flutter/material.dart';

// // final String? SubjectName;
// //   final String? SubjectTime;
// //   final bool? AttendenceStatus;

// class AttendenceCheckbox extends StatefulWidget {
//   final String? SubjectName;
//   final String? SubjectTime;
//   final bool? AttendenceStatus;
//   const AttendenceCheckbox({
//     super.key,
//     required this.SubjectName,
//     required this.SubjectTime,
//     this.AttendenceStatus = false,
//   });

//   @override
//   State<AttendenceCheckbox> createState() => _AttendenceCheckboxState();
// }

// class _AttendenceCheckboxState extends State<AttendenceCheckbox> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'MatheMatics',
//               style: TextStyle(
//                   color: AppColors.whiteColor,
//                   fontSize: AppDimension.px_18,
//                   fontWeight: FontWeight.w500),
//             ),
//             Text(
//               '10:00 AM - 11:00 PM',
//               style: TextStyle(
//                   color: AppColors.whiteColor,
//                   fontSize: AppDimension.px_14,
//                   fontWeight: FontWeight.w500),
//             )
//           ],
//         ),
//         Spacer(),
//         Transform.scale(
//           scale: 1.2,
//           child: Checkbox(
//               checkColor: AppColors.whiteColor,
//               activeColor: AppColors.greenColor,
//               side: BorderSide(
//                 color: AppColors.whiteColor,
//                 style: BorderStyle.solid,
//                 width: 1.5,
//               ),
//               value: AttendenceStatus,
//               onChanged: (value) {
//                 setState(() {
//                   AttendenceStatus = value!;
//                 });
//               }),
//         )
//       ],
//     );
//   }
// }
