import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube/auth_service/auth_service.dart';
import 'package:youtube/common_files/color_constants.dart';
import 'package:youtube/password_screen/password_screen.dart';
import 'package:youtube/registration_screen/registration_screen.dart';

import '../common_files/image_constants.dart';
import '../log_in_page/log_in_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final auth = AuthService();

  @override
    void dispose(){
      email.dispose();
      password.dispose();

  }

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.primaryColor,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Welcome',style: TextStyle(color: Colors.green,
            fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body:   Padding(padding: const EdgeInsetsDirectional.all(50),
       child:
        Column(
        children: [

          const Text('Sign up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          const SizedBox(height: 30.0),
          //const Icon(Icons.ac_unit_sharp),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name ',border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0),
              ),
            ),
            ),
            controller: name,
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'E-mail ',border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0),
              ),
            ),
            ),
            controller: email,
          ),
          const SizedBox(height: 5.0),
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
            child: const Text('Sign-up'),

          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account',style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold),),
              ElevatedButton(onPressed: () {
                logInPage(context);
              },
                  child:const Text('login',style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20
              ),
                  ),
              ),

            ],
          ),
          const SizedBox(height: 20),
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
    logInPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInPage(),
    ),);
    }
    signUp() async{
    final user = await auth.createUserWithEmailAndPassword(email.text, password.text);
    if(user != null){
      log("user created");
      signOutPage(context);
    }
    }
}

