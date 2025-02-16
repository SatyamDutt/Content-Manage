import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:content_manage/views/admin/admin_dashboard_screen.dart';
import 'package:content_manage/views/get_statarted_screen.dart';
import 'package:content_manage/views/student/student_home_screen.dart';
import 'package:content_manage/views/student/student_login_screen.dart';
import 'package:content_manage/views/student/student_register_screen.dart';
import 'package:content_manage/views/student/student_register_with_phone_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    DevicePreview(
      enabled: false, // Set to false in production
      builder: (context) => MyApp(), // Your app goes here
    ),
    // MyApp()
  );

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("Teachers")
        .doc('xdX7NCCZeec4IdUYBbrPJBsGIVa2')
        .collection('9th')
        .doc('OMlGSrRmumUgjLcNa5oC').collection('physics').doc('82ZCDSYua2ehyOgyRQQP')
        .get();

    print(snapshot.data().toString());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          // home: GetStatartedScreen(),
          home: (FirebaseAuth.instance.currentUser !=null) ? AdminDashboardScreen(userId: FirebaseAuth.instance.currentUser!.uid,) : GetStatartedScreen(),
        );
      },
    );
  }
}
