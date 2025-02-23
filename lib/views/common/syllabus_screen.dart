// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class SyllabusScreen extends StatefulWidget {
//   const SyllabusScreen({super.key});

//   @override
//   State<SyllabusScreen> createState() => _SyllabusScreenState();
// }

// class _SyllabusScreenState extends State<SyllabusScreen> {
//   @override
//   void initState() {
//     // TODO: implement
//     // initState
//     super.initState();
//     fetchSyllabus();
//   }

//   List<String> subjectList = [];

//   var temp;

//   void fetchSyllabus() async {
//     DocumentSnapshot snapshot = await FirebaseFirestore.instance
//         .collection('Syllabus')
//         .doc('className')
//         .collection('1st')
//         .doc('Subjects')
//         .get();

//         temp = snapshot.data().toString();

//     setState(() {
//       temp = List.from(temp['subjectName']);
//     });

//     // temp = snapshot.data().toString();

//     print(temp);

//     // subjectList = snapshot.data().toString();

//     // for (var doc in snapshot.docs) {
//     //   print(doc.data().toString());
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: ListView.builder(
//           itemCount: 3,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Text('${temp}'),
//               ],
//             );
//           }),
//     ));
//   }
// }


import 'package:content_manage/resources/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SyllabusScreen extends StatefulWidget {
  @override
  _SyllabusScreenState createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  List<String> subjects = [];

  @override
  void initState() {
    super.initState();
    fetchSyllabus();
  }

  void fetchSyllabus() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Syllabus')
          .doc('className')
          .collection('1st')
          .doc('Subjects')
          .get();

      if (snapshot.exists) {
        // Extract the array of subjects
        List<dynamic> temp = snapshot['SubjectName'];

        // Convert it to a List<String> and update state
        setState(() {
          subjects = List<String>.from(temp);
        });
      } else {
        print("Document does not exist.");
      }
    } catch (e) {
      print("Error fetching syllabus: $e");
    }
  }

    String? selectedValue;

  List<String> dropdownItems = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Syllabus")),
      body: Column(
        children: [
          Center(
        child: DropdownButton<String>(
          hint: Text("Select an item"),
          value: selectedValue,
          items: dropdownItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            print("Selected Value: $newValue"); // Returns the selected value
          },
        ),
      ),
          SizedBox(height: AppDimension.px_25,),
          subjects.isEmpty
              ? Center(child: CircularProgressIndicator()) // Show a loader while fetching
              : Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 20),
                          Text(subjects[index], style: TextStyle(fontSize: 20)),
                        ],
                      );
                    },
                  ),
              ),
        ],
      ),
    );
  }
}
