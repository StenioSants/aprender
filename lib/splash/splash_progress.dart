import 'package:flutter/material.dart';

class SplashProgress extends StatefulWidget{
  final Widget? child;
  const SplashProgress({super.key, this.child});

  @override
  State<SplashProgress> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashProgress> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3), (){
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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            Text(
              "Aguarde...",
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

