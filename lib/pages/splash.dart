import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_messenger/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/rapid_api.dart';
import 'auth.dart';
import 'dashboard.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName='/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: Text('Chat box'),),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          if(snapshot.hasData){
            getUserInfo();
            //get rapid api

            return const Dashboard();
            //return const ChatScreen();
          }
          else {
            return const AuthScreen();
          }
        },
      ),
    );
  }

  Future<void> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    UserModel.name= prefs.getString('username');
    UserModel.email= prefs.getString('email');
    UserModel.image= prefs.getString('image_url');
    var info= await FirebaseFirestore.instance.collection('users').get();
    final loadedMessage=info.docs;
    loadedMessage.forEach((element) {
      if(element['email']==FirebaseAuth.instance.currentUser!.email){
        UserModel.name=element['username'];
        UserModel.email=element['email'];
        UserModel.image=element['image_url'];
      }
    });
    print('info ${info.toString()}');

  }
}
