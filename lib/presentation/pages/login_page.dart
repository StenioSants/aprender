import 'package:aprender/firebase_auth/auth_firebase.dart';
import 'package:aprender/global/toast.dart';
import 'package:aprender/presentation/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget{
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    final FirebaseAuthService _auth = FirebaseAuthService();
    bool _isSigning = true;


    @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }
   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                FormContainerWidget(
                  isPassword: false,
                  controller: _emailController ,
                  icon: const Icon(Icons.people,
                  color: Colors.blue),
                  ),
                FormContainerWidget(isPassword: true,
                controller: _passwordController
                ),
                ElevatedButton(
                  onPressed: _signIn, 
                child: Text('Entrar'),
                )
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "some error occured");
    }
  }

}