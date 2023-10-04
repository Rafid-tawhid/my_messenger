import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
}
