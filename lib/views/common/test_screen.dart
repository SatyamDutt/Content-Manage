import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  // To print all the data inside users collections
  // void fetchData() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users").get();
  //
  //   for(var doc in snapshot.docs){
  //     print(doc.data().toString());
  //   }
  // }

  // To print the details of partcular users
  // void fetchData() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc("BNUaeT0l8eUcxZ99I7xI").get();
  //
  //   print(snapshot.data().toString());
  // }

  // To print the particular data from all the users collection
  // void fetchData() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
  //
  //   for(var doc in snapshot.docs){
  //     print(doc['email'].toString());
  //   }
  // }

  // To print all the Teachers personal information
  // void fetchData() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Teachers').get();
  //
  //   for(var doc in snapshot.docs){
  //     print(doc.data().toString());
  //   }
  // }

  // To print the all the Details of a  particular Teachers Data
  // void fetchData() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('Teachers').doc("3j1l0s19isTpbEYbP4wv4NUgWU73").get();
  //
  //   print(snapshot.data().toString());
  // }

  // To print the email of all the Teacher
  // void fetchData() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Teachers').get();
  //   for(var doc in snapshot.docs){
  //     print(doc['email'].toString());
  //   }
  // }

  // void fetchData() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Teachers').doc("H6NNuQzRgNYl4S9lswaqXLzDSqu1").collection("New class").doc("9th").collection("physics").get();
  //
  //   for(var doc in snapshot.docs){
  //     print(doc.data().toString());
  //   }
  // }

  void fetchData() async {
    // DocumentSnapshot snapshot = await FirebaseFirestore.instance
    //     .collection("Teachers")
    //     .doc('xdX7NCCZeec4IdUYBbrPJBsGIVa2')
    //     .collection('9th')
    //     .doc('OMlGSrRmumUgjLcNa5oC')
    //     .collection('physics')
    //     .doc('82ZCDSYua2ehyOgyRQQP')
    //     .get();

    // DocumentReference snapshot2 = await snapshot.

//      if (!snapshot.exists) {
//   print("Document does not exist");
// } else {
//   print("Document data: ${snapshot.data()}");
// }
//     // print('Data' + snapshot.);
//     print("physics" + snapshot.data().toString());

    // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
    //     .collection("Teachers")
    //     .doc('xdX7NCCZeec4IdUYBbrPJBsGIVa2')
    //     .collection('9th')
    //     .doc('OMlGSrRmumUgjLcNa5oC')
    //     .collection('physics')
    //     .get();

    // print("QuerySnapsjot  ${querySnapshot.docs.firstWhere((test) => test.id == "82ZCDSYua2ehyOgyRQQP")}");

    // for (var doc in querySnapshot.docs) {
    //   print("Document ID: ${doc.id}, Data: ${doc.data()}");
    // }

    // DocumentSnapshot snapshot = await FirebaseFirestore.instance
    //     .collection("Teachers")
    //     .doc('xdX7NCCZeec4IdUYBbrPJBsGIVa2')
    //     .collection('9th')
    //     .doc('OMlGSrRmumUgjLcNa5oC').collection('english').doc('0bF6J6qVOOaf7xMzgq08')
    //     .get();

    // var data = snapshot.data();

    // if (data != null && data is Map<String, dynamic>) {
    //   print('data ${data.toString()}');
    //   var physicsData = data['physics'];
    //   print(physicsData);
    // } else {
    //   print("Data is null");
    // }

    try {
      // Reference to the class document
      DocumentReference classRef = FirebaseFirestore.instance
          .collection("Teachers")
          .doc('RloLrpO91uVBP7DjG5RJeW7vvC33')
          .collection('10th')
          .doc(
              'lcVdSehpYHRYhokBfukq'); // Use the classId from your previous code

      // Get the sub-collection (subjectName) under the class document
      QuerySnapshot subjectSnapshot =
          await classRef.collection('Mathematics').get();

      // Loop through all documents in the subjectName sub-collection

      print("subject ${subjectSnapshot.docs.length}");
      for (var doc in subjectSnapshot.docs) {
        // Print the data for each document
        print("Subject Data: ${doc.data()}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Test Screen',
        ),
      ),
    );
  }
}
