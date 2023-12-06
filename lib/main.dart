import 'package:aprender/presentation/pages/home_page.dart';
import 'package:aprender/presentation/pages/login_page.dart';
import 'package:aprender/splash/splash_page.dart';
import 'package:aprender/splash/splash_progress.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
    if(kIsWeb){
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyAsaJMR5NVTM4vXsEoZfO9lEDAa80oYFgA', 
          appId: '1:357156975365:android:4e1b47e0885c0b07c33d6c', 
          messagingSenderId: '357156975365', 
          projectId: 'aprender-ad568',
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  runApp(Aprender());
}

class Aprender extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Flutter Firebase',
      debugShowCheckedModeBanner: true,
      routes: {
        '/':(context) => SplashPage(child: SplashProgress(child: LoginPage(),)),
        '/home':(context) => const HomePage(),
      },
    );
  }
}