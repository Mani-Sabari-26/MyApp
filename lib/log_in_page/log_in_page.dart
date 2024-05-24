import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube/auth_service/auth_service.dart';
import 'package:youtube/common_files/color_constants.dart';
import 'package:youtube/registration_screen/registration_screen.dart';

import '../common_files/image_constants.dart';
import '../home_page/home_page.dart';
import '../password_screen/password_screen.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}
  final auth = AuthService();
  final email = TextEditingController();
  final password = TextEditingController();

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: ColorConstants.secondaryColor,
      body: Padding(padding: const EdgeInsetsDirectional.all(50),
       child: Column(
         children: [
           const SizedBox(height: 50),
           const Text('Log In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
           TextFormField(
             keyboardType: TextInputType.emailAddress,
             decoration: const InputDecoration(
               labelText: 'email ',border: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(10.0),
               ),
             ),
             ),
             controller: email,
           ),
           const SizedBox(height: 10),
           TextFormField(
             decoration: const InputDecoration(

               labelText: 'password ',border: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(10.0),
               ),
             ),
             ),
             controller: password,
           ),
           const SizedBox(height: 20),
           ElevatedButton(onPressed: () {
             signUp();
           },
               child: const Text('login'),
           ),
           const SizedBox(height: 100),
           const Image(image: ImageConstants.image1),
         ],
       ),
      ),
    );
  }
  signOutPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),
    ),
    );
  }
  signUp() async{
    final user = await auth.signInUserWithEmailAndPassword(email.text, password.text);
    if(user != null){
      log("user created");
      signOutPage(context);
    }
  }
}
