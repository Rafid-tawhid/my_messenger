import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_messenger/pages/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_messenger/pages/chat.dart';
import 'package:my_messenger/pages/translation_screens.dart';
import 'package:my_messenger/pages/dashboard.dart';
import 'package:my_messenger/pages/lessions/chat_gpt_screen.dart';
import 'package:my_messenger/pages/lessions/grammer_guides.dart';
import 'package:my_messenger/pages/progress_tracking.dart';
import 'package:my_messenger/pages/question_page.dart';

import 'package:my_messenger/pages/result_page.dart';
import 'package:my_messenger/pages/splash.dart';
import 'package:my_messenger/pages/translater_page.dart';

final configurations = Configurations();

class Configurations {
  static const _apiKey = "AIzaSyBrRcPqgVi6qhL6SJtQvHCFRd6EHCZKv3Y";
  static const _authDomain = "398749114662-rvc894usfvqbnmufj63t1g2ks5ptds1n.apps.googleusercontent.com";
  static const _projectId = "my-blog-309118";
  static const _storageBucket = "my-blog-309118.appspot.com";
  static const _messagingSenderId ="398749114662";
  static const _appId = "1:398749114662:android:644a074f7362a8b68021e7";

//Make some getter functions
  String get apiKey => _apiKey;
  String get authDomain => _authDomain;
  String get projectId => _projectId;
  String get storageBucket => _storageBucket;
  String get messagingSenderId => _messagingSenderId;
  String get appId => _appId;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: configurations.apiKey,
          appId: configurations.appId,
          messagingSenderId: configurations.messagingSenderId,
          projectId: configurations.projectId,
          storageBucket: 'my-blog-309118.appspot.com'
      )
  );
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context)=>const SplashScreen(),
        Dashboard.routeName:(context)=>const Dashboard(),
        QustionPage.routeName: (context) => QustionPage(),
        ResultPage.routeName: (context) => ResultPage(),
        TranslatorApp.routeName:(context)=>const TranslatorApp(),
        TranslateScreen.routeName:(context)=>const TranslateScreen(),
        ProgressTracking.routeName:(context)=>ProgressTracking(),
        GrammarGuideScreen.routeName:(context)=>GrammarGuideScreen(),
        ChatScreen.routeName:(context)=>ChatScreen(),

      },
    );
  }
}

