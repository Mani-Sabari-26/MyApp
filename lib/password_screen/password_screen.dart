import 'package:flutter/material.dart';
import 'package:youtube/auth_service/auth_service.dart';
import 'package:youtube/common_files/color_constants.dart';
import 'package:youtube/common_files/image_constants.dart';
import 'package:youtube/home_page/home_page.dart';
import 'package:youtube/log_in_page/log_in_page.dart';

class PassWordScreen extends StatefulWidget {
  const PassWordScreen({super.key});

  @override
  State<PassWordScreen> createState() => _PassWordScreenState();
}

class _PassWordScreenState extends State<PassWordScreen> {

  final auth = AuthService();
  List<String> allStudentName = ['uday','mani','chandu','srinu','john','durgasai','sudheer'];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstants.thirdColor,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          const Text('Welcome',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

          ElevatedButton(onPressed: () async {
             await auth.signOut();
             signInPage(context);
          },
            child: const Text(
              'Sign Out', style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 100),
          const Image(image: ImageConstants.image1),
        ],

      ),
    );
  }

  signInPage(BuildContext context) {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const LogInPage(),
    ),
    );
  }
}