import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:content_manage/resources/app_strings.dart';
import 'package:content_manage/views/common/primary_button.dart';
import 'package:content_manage/views/common/primary_textfield.dart';
import 'package:content_manage/views/common/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AttendenceScreen extends StatefulWidget {
  final String userId;
  final int rollNo;
  final String subjectName;
  final String className;

  final String teacherName;
  final DateTime newDate;
  const AttendenceScreen(
      {super.key,
      required this.teacherName,
      required this.newDate,
      required this.userId,
      required this.subjectName,
      required this.className,
      required this.rollNo});

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

bool present = false;

enum Attendence { present, absent, leave }

class _AttendenceScreenState extends State<AttendenceScreen> {
  Attendence? _character = null;
  bool _isDisabled = false;

  String className = "10th";

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchAttendance();
  }

    List<Map<String, dynamic>> attendanceList = [];
  bool isLoading = true;
  bool isEmpty = false;

    void fetchAttendance() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Attendence')
        .doc(widget.className)
        .collection('Subjects')
        .doc(widget.subjectName)
        .collection('RollNumbers')
        .doc(widget.rollNo.toString())
        .collection('Dates')
        .get();

    List<Map<String, dynamic>> tempList = [];

    if (snapshot.docs.isEmpty) {
      setState(() {
        isEmpty = true;
        isLoading = false;
      });
      return;
    }

    for (var doc in snapshot.docs) {
      tempList.add({
        'date': doc.id,
        'status': doc['attendance'].toString(),
      });
    }

    setState(() {
      attendanceList = tempList;
      isLoading = false;
      isEmpty = false;
    });
  }

  // List<Map<String, dynamic>> attendanceList = [];

  //   void fetchAttendance() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('Attendence')
  //       .doc(widget.className)
  //       .collection('Subjects')
  //       .doc(widget.subjectName)
  //       .collection('RollNumbers')
  //       .doc(widget.rollNo.toString())
  //       .collection('Dates')
  //       .get();

  //   List<Map<String, dynamic>> tempList = [];

  //   for (var doc in snapshot.docs) {
  //     tempList.add({
  //       'date': doc.id,
  //       'status': doc['attendance'].toString(),
  //     });
  //   }

  //   setState(() {
  //     attendanceList = tempList;
  //   });
  // }


//correct function for attendance
  // void fetchAttendence() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('Attendence')
  //       .doc('${widget.className}')
  //       .collection('Subjects')
  //       .doc('${widget.subjectName}')
  //       .collection('RollNumbers')
  //       .doc('${widget.rollNo}')
  //       .collection('Dates')
  //       .get();

//end of correct fn 
  //   for (var doc in snapshot.docs) {
  //     print(doc['timestamp'].toDate().toString());
  //     print(doc['attendance'].toString());
  //   }

  //   // print('subjectName ${widget.subjectName}');
  // }

  // TextEditingController messaseController = TextEditingController();

  // Future<List<MapString, String>>> fetchClass() async{
  //   List<Map<String, String>> classDetails = [];

  //   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("Teachers").doc("New Class").collection(className).get();

  //   for(var teacherDoc in snapshot.docs) {
  //     QuerySnapshot newClassSnapshot = await FirebaseFirestore.instance.collection(collectionPath)
  //   }
  // }

  void addAttendence() async {
    if (_character == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an Attendence status '),
        ),
      );
    }

    // String message = messaseController.text.toString();
    String AttendenceStatus = _character.toString().split('.').last;
    try {
      await FirebaseFirestore.instance
          .collection('Students')
          .doc(widget.userId)
          .collection("Attendence")
          .doc(className)
          .collection(widget.subjectName)
          .add({
        "subjectName": widget.subjectName,
        "startTime": '10:00 AM',
        "endTime": "11:00 Am",
        "teacherName": widget.teacherName,
        // "date": '${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
        "Attendence Status": AttendenceStatus,
        // "message": message
        // "CreatedAt": '${DateFormat('dd-MM-yyyy hh-mm a').format(DateTime.now())}'
        // "CreatedAt": Timestamp.now(),
      });
      setState(() {
        _isDisabled = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Attendence added'),
          backgroundColor: AppColors.greenColor,
        ),
      );
      // Navigator.pop(context);
    } catch (e) {
      print("error contains");
    }
  }

  // bool isLoading = true;
  List<Map<String, dynamic>> dataList = [];
  Future<void> fetchData() async {
    try {
      DocumentReference classRef = FirebaseFirestore.instance
          .collection("Teachers")
          .doc('RloLrpO91uVBP7DjG5RJeW7vvC33')
          .collection('10th')
          .doc('lcVdSehpYHRYhokBfukq');

      QuerySnapshot snapshot = await classRef.collection('science').get();

      List<Map<String, dynamic>> tempList = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return {
          'startTime': data['startTime'] ?? 'N/A',
          'endTime': data['endTime'] ?? 'N/A',
        };
      }).toList();

      setState(() {
        dataList = tempList;
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
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
          'Attendence Detail',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.blueColor,
        leading: BackButton(
          color: AppColors.whiteColor,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // SizedBox(height: AppDimension.px_100,),

              SizedBox(
                height: AppDimension.px_25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.subjectName,
                          style: TextStyle(
                              // color: AppColors.whiteColor,
                              fontSize: AppDimension.px_25,
                              fontWeight: FontWeight.w500),
                        ),
                        // Text(
                        //   'By: ${widget.teacherName}',
                        //   style: TextStyle(
                        //       // color: AppColors.whiteColor,
                        //       fontSize: AppDimension.px_16,
                        //       fontWeight: FontWeight.w500),
                        // )
                      ],
                    ),
                    // Spacer(),
                    // Column(
                    //   children: [
                    //     Text(
                    //       // '${widget.newDate.day}-${widget.newDate.month}-${widget.newDate.year}',
                    //       '${DateFormat('dd-MM-yyyy').format(DateTime.now())}',
                    //       style: TextStyle(
                    //           fontSize: AppDimension.px_18,
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //     Text(
                    //       '09:00 AM - 10:00 AM',
                    //       style: TextStyle(
                    //         fontSize: AppDimension.px_16,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //     //                    isLoading
                    //     // ? Center(child: CircularProgressIndicator())
                    //     // : dataList.isEmpty
                    //     //     ? Center(child: Text("No data found."))
                    //     //     : SizedBox( // Wrap ListView.builder in SizedBox with a height constraint
                    //     //         height: 200, // Adjust height as needed
                    //     //         child: ListView.builder(
                    //     //           shrinkWrap: true, // Prevents infinite height issue
                    //     //           physics: NeverScrollableScrollPhysics(), // Disable scrolling inside ListView
                    //     //           itemCount: dataList.length,
                    //     //           itemBuilder: (context, index) {
                    //     //             return ListTile(
                    //     //               title: Text("Start Time: ${dataList[index]['startTime']}"),
                    //     //               subtitle: Text("End Time: ${dataList[index]['endTime']}"),
                    //     //             );
                    //     //           },
                    //     //         ),
                    //     //       ),
                    //   ],
                    // )
                  
                  ],
                ),
              ),
              SizedBox(
                height: AppDimension.px_15,
              ),
              // ListTile(
              //   minTileHeight: AppDimension.px_15,
              //   title: Text(AppStrings.absent),
              //   leading: Radio<Attendence>(
              //       value: Attendence.absent,
              //       groupValue: _character,
              //       onChanged: (Attendence? value) {
              //         setState(() {
              //           _character = value;
              //         });
              //       }),
              // ),
              // PrimaryTextfield(
              //     inputValue: messaseController, hintText: 'Add Something'),
              // AbsorbPointer(
              //   absorbing: _isDisabled,
              //   child: Opacity(
              //     opacity: _isDisabled ? 0.5 : 1.0,
              //     child: Container(
              //       child: Column(
              //         children: [
              //           ListTile(
              //             title: Text(AppStrings.present),
              //             leading: Radio<Attendence>(
              //                 value: Attendence.present,
              //                 groupValue: _character,
              //                 onChanged: _isDisabled
              //                     ? null
              //                     : (Attendence? value) {
              //                         setState(() {
              //                           _character = value;
              //                         });
              //                       }),
              //           ),
              //           ListTile(
              //             minTileHeight: AppDimension.px_15,
              //             title: Text(AppStrings.leave),
              //             leading: Radio<Attendence>(
              //                 value: Attendence.leave,
              //                 groupValue: _character,
              //                 onChanged: _isDisabled
              //                     ? null
              //                     : (Attendence? value) {
              //                         setState(() {
              //                           _character = value;
              //                         });
              //                       }),
              //           ),
              //           SizedBox(
              //             height: AppDimension.px_10.h,
              //           ),
              //           Padding(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: AppDimension.px_25.w),
              //             child: Opacity(
              //               opacity: _isDisabled ? 0.5 : 1,
              //               child: PrimaryButton(
              //                   ontTap: () {
              //                     // fetchAttendence();
              //                     // addAttendence();
              //                     // Navigator.push(
              //                     //   context,
              //                     //   MaterialPageRoute(
              //                     //     builder: (context) => TeacherClassesScreen(teacherId: 'xdX7NCCZeec4IdUYBbrPJBsGIVa2',),
              //                     //   ),
              //                     // );
              //                   },
              //                   title: AppStrings.submit),
              //             ),
              //           ),
              //           SizedBox(
              //             height: AppDimension.px_15,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
               

               SizedBox(height: AppDimension.px_25.h,),
              //  DataTable(
              //    columnSpacing: 20.0,
              //    columns: [
              //      DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
              //      DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
              //    ],
              //    rows: attendanceList.map((data) {
              //      return DataRow(cells: [
              //        DataCell(Text(data['date'])),
              //        DataCell(Text(data['status'])),
              //      ]);
              //    }).toList(),
              //  ),

              //good style
          //     Container(
          //   decoration: BoxDecoration(
          //   ),
          //   child: DataTable(
          //     border: TableBorder.all(color: Colors.black, width: 1), // Inner borders
          //     columnSpacing: 20.0,
          //     headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade200), // Header background color
          //     dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white), // Row background color
          //     columns: [
          //       DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
          //       DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
          //     ],
          //     rows: attendanceList.map((data) {
          //       return DataRow(cells: [
          //         DataCell(Text(data['date'], textAlign: TextAlign.center)),
          //         DataCell(Text(data['status'], textAlign: TextAlign.center)),
          //       ]);
          //     }).toList(),
          //   ),
          // ),

          // with validator
          isLoading
              ? Center(child: CircularProgressIndicator()) // Show loader while fetching data
              : isEmpty
                  ? Center(
                      child: Text(
                        "No attendance records found.",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    )
                  : 
                  
                  Container(
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black, width: 2), // Outer border
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: DataTable(
                      border: TableBorder.all(color: Colors.black, width: 1), // Inner borders
                      columnSpacing: 20.0,
                      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade200),
                      dataRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
                      columns: [
                        DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: attendanceList.map((data) {
                        return DataRow(cells: [
                          DataCell(Text(data['date'], textAlign: TextAlign.center)),
                          DataCell(Text(data['status'], textAlign: TextAlign.center)),
                        ]);
                      }).toList(),
                    ),
                  ),
              
              
              // Text(
              //   'Past 7 Days Report',
              //   style: TextStyle(
              //     fontSize: AppDimension.px_20,
              //   ),
              // ),
              // SizedBox(
              //   height: AppDimension.px_10,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
              //   child: Table(
              //     border: TableBorder.all(),
              //     columnWidths: const <int, TableColumnWidth>{
              //       0: IntrinsicColumnWidth(),
              //       1: FlexColumnWidth(),
              //       2: FixedColumnWidth(64),
              //     },
              //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              //     children: <TableRow>[
              //       TableRow(
              //         children: <Widget>[
              //           Container(
              //             height: 32,
              //             width: 170,
              //             child: Center(
              //               child: Text('Date'),
              //             ),
              //           ),
              //           Container(
              //             height: 32,
              //             width: 32,
              //             child: Center(
              //               child: Text('Status'),
              //             ),
              //           ),
              //         ],
              //       ),
              //       TableRow(
              //           decoration: const BoxDecoration(),
              //           children: <Widget>[
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(
              //                 child: Text(
              //                   '${DateFormat('dd-MM-yyyy').format(DateTime(2025, 01, 01))}',
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(child: Text('PRESENT')),
              //             ),
              //           ]),
              //       TableRow(
              //           decoration: const BoxDecoration(),
              //           children: <Widget>[
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(
              //                 child: Text(
              //                   '${DateFormat('dd-MM-yyyy').format(
              //                     DateTime(2025, 01, 02),
              //                   )}',
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(child: Text('PRESENT')),
              //             ),
              //           ]),
              //       TableRow(
              //           decoration: const BoxDecoration(),
              //           children: <Widget>[
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(
              //                   child: Text(
              //                       '${DateFormat('dd-MM-yyyy').format(DateTime(2025, 01, 03))}')),
              //             ),
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(child: Text('ABSENT')),
              //             ),
              //           ]),
              //       TableRow(
              //           decoration: const BoxDecoration(),
              //           children: <Widget>[
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(
              //                 child: Text(
              //                     '${DateFormat('dd-MM-yyyy').format(DateTime(2025, 01, 04))}'),
              //               ),
              //             ),
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(
              //                 child: Text('PRESENT'),
              //               ),
              //             ),
              //           ]),
              //       TableRow(
              //           decoration: const BoxDecoration(),
              //           children: <Widget>[
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(
              //                   child: Text(
              //                       '${DateFormat('dd-MM-yyyy').format(DateTime(2025, 01, 05))}')),
              //             ),
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(child: Text('PRESENT')),
              //             ),
              //           ]),
              //       TableRow(
              //           decoration: const BoxDecoration(),
              //           children: <Widget>[
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(
              //                   child: Text(
              //                       '${DateFormat('dd-MM-yyyy').format(DateTime(2025, 01, 06))}')),
              //             ),
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(child: Text('HOLIDAY')),
              //             ),
              //           ]),
              //       TableRow(
              //           decoration: const BoxDecoration(),
              //           children: <Widget>[
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(
              //                   child: Text(
              //                       '${DateFormat('dd-MM-yyyy').format(DateTime(2025, 01, 07))}')),
              //             ),
              //             Container(
              //               height: 32,
              //               width: 32,
              //               child: Center(child: Text('LEAVE')),
              //             ),
              //           ]),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: AppDimension.px_20,
              // ),
//               Padding(
//   padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
//   child: StreamBuilder(
//     stream: FirebaseFirestore.instance
//         .collection('Students')
//         .doc(widget.userId)
//         .collection("Attendence")
//         .doc(className)
//         .collection(widget.subjectName)
//         .orderBy("CreatedAt", descending: true) // Order by latest
//         .snapshots(),
//     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(child: CircularProgressIndicator());
//       }
//       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//         return Center(child: Text("No Attendance Records"));
//       }

//       return Table(
//         border: TableBorder.all(),
//         columnWidths: const <int, TableColumnWidth>{
//           0: IntrinsicColumnWidth(),
//           1: FlexColumnWidth(),
//         },
//         defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//         children: [
//           TableRow(
//             children: [
//               Center(child: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
//               // SizedBox(width: 30,),
//               Center(child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
//             ],
//           ),
//           ...snapshot.data!.docs.map((doc) {
//             return TableRow(
//               children: [
//                 Center(
//                   child: Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: AppDimension.px_40.w),
//                     child: Text(
//                       DateFormat('dd-MM-yyyy').format(doc["CreatedAt"].toDate()), // Convert Timestamp to Date
//                     //  '${DateFormat('dd-MM-yyyy').format(DateFormat("dd-MM-yyyy hh-mm a").parse(doc["CreatedAt"]))}'
//                         //  "hEllo"
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: Text(doc["Attendence Status"]), // Get status from Firestore
//                 ),
//               ],
//             );
//           }).toList(),
//         ],
//       );
//     },
//   ),
// ),

              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
              //   child: StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection('Students')
              //         .doc(widget.userId)
              //         .collection("Attendence")
              //         .doc(className)
              //         .collection(widget.subjectName)
              //         .orderBy("CreatedAt", descending: true) // Order by latest
              //         .snapshots(),
              //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Center(child: CircularProgressIndicator());
              //       }
              //       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              //         return Center(child: Text("No Attendance Records"));
              //       }

              //       return Table(
              //         border: TableBorder.all(),
              //         columnWidths: const <int, TableColumnWidth>{
              //           0: IntrinsicColumnWidth(),
              //           1: FlexColumnWidth(),
              //         },
              //         defaultVerticalAlignment:
              //             TableCellVerticalAlignment.middle,
              //         children: [
              //           TableRow(
              //             children: [
              //               Center(
              //                   child: Text("Date",
              //                       style: TextStyle(
              //                           fontWeight: FontWeight.bold))),
              //               Center(
              //                   child: Text("Status",
              //                       style: TextStyle(
              //                           fontWeight: FontWeight.bold))),
              //             ],
              //           ),
              //           ...snapshot.data!.docs.map((doc) {
              //             // Check if CreatedAt exists and is a Timestamp
              //             Timestamp? createdAt = doc["CreatedAt"] is Timestamp
              //                 ? doc["CreatedAt"]
              //                 : null;

              //             return TableRow(
              //               children: [
              //                 Center(
              //                   child: Padding(
              //                     padding: EdgeInsets.symmetric(
              //                         horizontal: AppDimension.px_40.w),
              //                     child: Text(
              //                       createdAt != null
              //                           ? DateFormat('dd-MM-yyyy').format(createdAt
              //                               .toDate()) // ✅ Convert Timestamp to Date
              //                           : "N/A", // ✅ Handle missing data
              //                     ),
              //                   ),
              //                 ),
              //                 Center(
              //                   child: Text(doc["Attendence Status"] ??
              //                       "Unknown"), // ✅ Handle missing status
              //                 ),
              //               ],
              //             );
              //           }).toList(),
              //         ],
              //       );
              //     },
              //   ),
              // ),

              SizedBox(
                height: AppDimension.px_20.h,
              ),


               // for last month record
              // Text(
              //   'Last Month update',
              //   style: TextStyle(
              //     fontSize: AppDimension.px_20,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              // // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: AppDimension.px_25),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text(
              //             'Month',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //           Spacer(),
              //           Text(
              //             'january',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: AppDimension.px_10,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             'Total working days',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //           Spacer(),
              //           Text(
              //             '22',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: AppDimension.px_10,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             'Your Attendence',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //           Spacer(),
              //           Text(
              //             '18',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: AppDimension.px_10,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             'Absent Days',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //           Spacer(),
              //           Text(
              //             '4',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: AppDimension.px_10,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             'Present Attendence Status',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //           Spacer(),
              //           Text(
              //             '87%',
              //             style: TextStyle(
              //               fontSize: AppDimension.px_18,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: AppDimension.px_50.h,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
