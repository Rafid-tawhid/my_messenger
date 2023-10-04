import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_messenger/pages/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_messenger/pages/chat.dart';
import 'package:my_messenger/pages/splash.dart';
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
  runApp(const MyApp());
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const SplashScreen();
          }
          if(snapshot.hasData){
            return const ChatScreen();
          }
          else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}

