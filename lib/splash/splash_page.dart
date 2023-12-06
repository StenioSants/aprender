import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget{
  final Widget? child;
  const SplashPage({super.key, this.child});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1), (){
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (context) => widget.child!), (route) => false
        );
      }
    );
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "QUIMERA",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

