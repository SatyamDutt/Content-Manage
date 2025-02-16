import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:flutter/material.dart';

class StudentCallScreen extends StatefulWidget {
  const StudentCallScreen({super.key});

  @override
  State<StudentCallScreen> createState() => _StudentCallScreenState();
}

class _StudentCallScreenState extends State<StudentCallScreen> {
  var teacherName;
  Future<List<Map<String, String>>> printData() async {
   
    List<Map<String, String>> classDetails = [];

    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("Teachers").get();
    for (var teacherDoc in snapshot.docs) {
      QuerySnapshot newClassSnapshot = await FirebaseFirestore.instance
          .collection("Teachers")
          .doc(teacherDoc.id)
          .collection("New class")
          .get();
      for (var classDoc in newClassSnapshot.docs) {
        classDetails.add({
          "teacherName": classDoc["teacherName"],
          "subjectName": classDoc["subjectName"],
          "startTime": classDoc["startTime"],
          "endTime": classDoc["endTime"],
        });
      }
    }
    return classDetails;
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // printData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Call Details',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.blueColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: AppDimension.px_15,
            ),
            Center(
              child: Text(
                'For Any Query contact with us:',
                style: TextStyle(
                  // color: AppColors.blueColor,
                  fontSize: AppDimension.px_18,
                ),
              ),
            ),
            Center(
              child: Text(
                '+91 9853624157',
                style: TextStyle(
                  // color: AppColors.blueColor,
                  fontSize: AppDimension.px_18,
                ),
              ),
            ),
            // Text('${printData()}')
            FutureBuilder(
                future: printData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());  
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));  
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No class details found."));  
                }
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var classInfo = snapshot.data![index];
                        return Column(
                          children: [
                            Text('${classInfo["teacherName"] ?? ''}'),
                            Text('${classInfo["subjectName"] ?? ''}'),
                            Text('${classInfo["startTime"] ?? ''}'),
                            Text('${classInfo["endTime"] ?? ''}'),
                            Divider(),
                          ],
                        );
                      });
                })
          ],
        ),
      ),
    );
  }
}

//future builder
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AllClassesScreen extends StatefulWidget {
//   @override
//   _AllClassesScreenState createState() => _AllClassesScreenState();
// }

// class _AllClassesScreenState extends State<AllClassesScreen> {
//   Future<List<Map<String, dynamic>>> fetchAllClasses() async {
//     List<Map<String, dynamic>> allClasses = [];

//     // Get all teacher documents
//     QuerySnapshot teachersSnapshot =
//         await FirebaseFirestore.instance.collection("Teachers").get();

//     for (var teacherDoc in teachersSnapshot.docs) {
//       // Get each teacher's classes subcollection
//       QuerySnapshot classSnapshot = await FirebaseFirestore.instance
//           .collection("Teachers")
//           .doc(teacherDoc.id)
//           .collection("New class")
//           .get();

//       for (var classDoc in classSnapshot.docs) {
//         Map<String, dynamic> classData = classDoc.data() as Map<String, dynamic>;
//         classData["teacherId"] = teacherDoc.id; // Add teacher ID for reference
//         allClasses.add(classData);
//       }
//     }

//     return allClasses;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('All Classes')),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: fetchAllClasses(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No classes found."));
//           }

//           var classes = snapshot.data!;

//           return ListView.builder(
//             itemCount: classes.length,
//             itemBuilder: (context, index) {
//               var classData = classes[index];

//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: ListTile(
//                   title: Text(classData["className"] ?? "No Name"),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Subject: ${classData["subjectName"] ?? "N/A"}"),
//                       Text("Teacher: ${classData["teacherName"] ?? "N/A"}"),
//                       Text("Time: ${classData["startTime"]} - ${classData["endTime"]}"),
//                     ],
//                   ),
//                   trailing: Icon(Icons.class_),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// fetch all the teachers clas
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AllClassesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('All Classes')),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("Teachers").snapshots(),
//         builder: (context, teacherSnapshot) {
//           if (teacherSnapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (!teacherSnapshot.hasData || teacherSnapshot.data!.docs.isEmpty) {
//             return Center(child: Text("No classes found."));
//           }

//           List<Widget> classWidgets = [];

//           for (var teacherDoc in teacherSnapshot.data!.docs) {
//             var teacherId = teacherDoc.id;

//             classWidgets.add(
//               StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("Teachers")
//                     .doc(teacherId)
//                     .collection("New class")
//                     .snapshots(),
//                 builder: (context, classSnapshot) {
//                   if (!classSnapshot.hasData || classSnapshot.data!.docs.isEmpty) {
//                     return SizedBox(); // Don't show empty teachers
//                   }

//                   List<Widget> teacherClasses = classSnapshot.data!.docs.map((classDoc) {
//                     var classData = classDoc.data() as Map<String, dynamic>;

//                     return Card(
//                       margin: EdgeInsets.all(10),
//                       child: ListTile(
//                         title: Text(classData["className"] ?? "No Name"),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Subject: ${classData["subjectName"] ?? "N/A"}"),
//                             Text("Teacher: ${classData["teacherName"] ?? "N/A"}"),
//                             Text("Time: ${classData["startTime"]} - ${classData["endTime"]}"),
//                           ],
//                         ),
//                         trailing: Icon(Icons.class_),
//                       ),
//                     );
//                   }).toList();

//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           "Teacher ID: $teacherId",
//                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                         ),
//                       ),
//                       ...teacherClasses,
//                     ],
//                   );
//                 },
//               ),
//             );
//           }

//           return ListView(children: classWidgets);
//         },
//       ),
//     );
//   }
// }
