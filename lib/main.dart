import 'package:flutter/material.dart';
import 'package:hack_app/pages/auth/phone_auth.dart';
import 'package:hack_app/pages/doctor_details.dart';
import 'package:hack_app/pages/group_chat.dart';
import 'package:hack_app/pages/home_page.dart';
import 'package:hack_app/style/styles.dart';
import 'package:hack_app/utils/validators.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dogda',
      theme: ThemeData(
        fontFamily: "GTWalsheimPro",
        primaryColor: primaryColor,
        accentColor: primaryColor,
      ),
      initialRoute: PhoneAuth.routeName,
      routes: {
        PhoneAuth.routeName:(context) => PhoneAuth(),
        HomePage.routeName:(context) => HomePage(),
        GroupChat.routeName:(context) => GroupChat(),
        DoctorDetails.routeName:(context) => DoctorDetails(),
      },
    );
  }
}
