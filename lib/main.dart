import 'package:affiliaconnect/profileAdd/ProfileAdd.dart';
import 'package:affiliaconnect/profileLister/ProfileLister.dart';
import 'package:affiliaconnect/profileview/ProfileView.dart';
import 'package:flutter/material.dart';
import './profileUpdate/UpdateProfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Updater',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileLister(),
      routes: {
        '/update': (context) => UpdateProfile(),
        '/profile_details':(context) => ProfileView(),
        '/lister':(context) => ProfileLister(),
        '/add':(context) => ProfileAdd(),
      },
    );
  }
}
