import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:youtube/home_page/home_page.dart';
import 'package:youtube/registration_screen/registration_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyDxs4LYzye8UKVXHLe3p0VFVsIGigTaP3A",
      authDomain: "fir-project-33e8f.firebaseapp.com",
      projectId: "fir-project-33e8f",
      storageBucket: "fir-project-33e8f.appspot.com",
      messagingSenderId: "2615400785",
      appId: "1:2615400785:web:73114673eae0c50f0b1b70"
  ));
  runApp(const YouTube());
}

class YouTube extends StatefulWidget {
  const YouTube({super.key});

  @override
  State<YouTube> createState() => _YouTubeState();
}

class _YouTubeState extends State<YouTube> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
