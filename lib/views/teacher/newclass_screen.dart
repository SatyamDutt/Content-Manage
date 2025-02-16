import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/views/common/input_label.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewclassScreen extends StatefulWidget {
  final String userId;
  const NewclassScreen({
    super.key,
    required this.userId,
  });

  @override
  State<NewclassScreen> createState() => _NewclassScreenState();
}

class _NewclassScreenState extends State<NewclassScreen> {
  TextEditingController classNameController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController subjectNameController = TextEditingController();
  TextEditingController teacherNameController = TextEditingController();

  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context, initialTime: selectedTime ?? TimeOfDay.now());

    if (picked != null || picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // void StartClass() async {
  //   String className = classNameController.text.toString();
  //   String startTime = startTimeController.text.toString();
  //   String endTime = endTimeController.text.toString();
  //   String subjectName = subjectNameController.text.toString();
  //   String teacherName = teacherNameController.text.toString();

  //   if (className.isEmpty ||
  //       startTime.isEmpty ||
  //       endTime.isEmpty ||
  //       subjectName.isEmpty ||
  //       teacherName.isEmpty) {
  //     print('Please fill all the details');
  //   } else {
  //     try {
  //       await FirebaseFirestore.instance
  //           .collection("Teachers")
  //           .doc(widget.userId)
  //           .collection("New class").doc(className).collection(subjectName)
  //           .add({
  //         "className": className,
  //         "startTime": startTime,
  //         "endTime": endTime,
  //         "subjectName": subjectName,
  //         "teacherName": teacherName,
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('New Class Started'),
  //           backgroundColor: AppColors.greenColor,
  //         ),
  //       );
  //       Navigator.pop(context);
  //     } catch (e) {
  //       print('Error to Start new class ${e}');
  //     }
  //   }
  // }

  
  void StartClass() async {
  String startTime = startTimeController.text.toString();
  String endTime = endTimeController.text.toString();
  String className = classNameController.text.toString();
  String subjectName = subjectNameController.text.toString();
  String teacherName = teacherNameController.text.toString();

  if (startTime.isEmpty || endTime.isEmpty || className.isEmpty || subjectName.isEmpty || teacherName.isEmpty) {
    print('Please fill all the details');
    return;
  }

  // try {
  //   // Generate an auto ID for className
  //   DocumentReference classRef = FirebaseFirestore.instance
  //       .collection("Teachers")
  //       .doc(widget.userId)
  //       .collection(className)
  //       .doc(); // Auto-generated class ID

  //   String classId = classRef.id; // Get the generated ID

  //   await classRef.collection(subjectName).add({
  //     "classId": classId, // Store the generated class ID
  //     "className": className, // Use classId instead of manually inputted className
  //     "startTime": startTime,
  //     "endTime": endTime,
  //     "subjectName": subjectName,
  //     "teacherName": teacherName,
  //   });

  

    // ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('New Class Started with ID: $classId'),
  //       backgroundColor: AppColors.greenColor,
  //     ),
  //   );

  //   Navigator.pop(context);
  // } catch (e) {
  //   print('Error to Start new class: $e');
  // }

  try {
    // Generate an auto ID for the class document in Teachers collection
    DocumentReference classRef = FirebaseFirestore.instance
        .collection("Teachers")
        .doc(widget.userId)
        .collection(className)
        .doc();  // Auto-generated class ID

    String classId = classRef.id; // Get the generated ID

    // Create the class document (it wasn't being created before)
    await classRef.set({
      "className": className, // Storing className in the generated document
    });

    // Add a document to the sub-collection (subjectName)
    await classRef.collection(subjectName).add({
      "classId": classId, // Store the generated class ID
      "className": className, // Store the className
    });

    print("Class ID: $classId"); // Now you can print the generated ID

} catch (e) {
    print("Error: $e");
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text(
          'New Class Information',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        leading: BackButton(
          color: AppColors.whiteColor,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25.w),
            child: Column(
              children: [
                SizedBox(
                  height: AppDimension.px_50.h,
                ),
                InputLabel(title: 'Enter class Name'),
                SizedBox(
                  height: AppDimension.px_6.h,
                ),
                PrimaryTextfield(
                  inputValue: classNameController,
                  hintText: '8th',
                ),
                SizedBox(
                  height: AppDimension.px_15.h,
                ),
                InputLabel(title: 'Enter class Start time'),
                SizedBox(
                  height: AppDimension.px_6.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimension.px_10.r),
                    border: Border.all()
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(AppDimension.px_5.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedTime != null
                        ? "Selected Time: ${selectedTime!.format(context)}"
                        : "Not Picked"),
                        MaterialButton(
                          color: AppColors.blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppDimension.px_25.r,
                              )
                          ),
                          onPressed: () {
                            _selectTime(context);
                          },
                          child: Text('Pick Time',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(selectedTime != null
                //     ? "Selected Time: ${selectedTime!.format(context)}"
                //     : "Not Picked"),
                PrimaryTextfield(
                  inputValue: startTimeController,
                  hintText: '10:00 AM',
                ),
                SizedBox(
                  height: AppDimension.px_15.h,
                ),
                InputLabel(title: 'Enter class end time'),
                SizedBox(
                  height: AppDimension.px_6.h,
                ),
                PrimaryTextfield(
                  inputValue: endTimeController,
                  hintText: '11:00 AM',
                ),
                SizedBox(
                  height: AppDimension.px_15.h,
                ),
                InputLabel(title: 'Subject Name'),
                SizedBox(
                  height: AppDimension.px_6.h,
                ),
                PrimaryTextfield(
                  inputValue: subjectNameController,
                  hintText: 'Physics',
                ),
                SizedBox(
                  height: AppDimension.px_15.h,
                ),
                InputLabel(title: 'Enter Teacher Name'),
                SizedBox(
                  height: AppDimension.px_6.h,
                ),
                PrimaryTextfield(
                    inputValue: teacherNameController,
                    hintText: 'Ashish Arora'),
                SizedBox(
                  height: AppDimension.px_32.h,
                ),
                PrimaryButton(
                  ontTap: () {
                    StartClass();
                  },
                  title: 'Start Now',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
