import 'package:aprender/global/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthService {


  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try{
        UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
        return credential.user;
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found' || e.code == 'wrong-password'){
        showToast(message: 'Email ou senha inválida.');
    } else {
      showToast(message: 'Ocorreu um erro: ${e.code}');

    }
    }
    return null;
  }
}
