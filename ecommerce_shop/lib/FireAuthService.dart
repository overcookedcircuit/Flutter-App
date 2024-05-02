import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {

  FirebaseAuth _authentication = FirebaseAuth.instance;

  Future<User?> signUp(String email, String pass) async {

    try{
      UserCredential credential = await _authentication.createUserWithEmailAndPassword(email: email, password: pass);
      return credential.user;
    }
    catch (e){
      print("Some error occured");
    }
    return null;
  }

  Future<User?> signIn(String email, String pass) async {

    try{
      UserCredential credential = await _authentication.signInWithEmailAndPassword(email: email, password: pass);
      return credential.user;
    }
    catch (e){
      print("Some error occured");
    }
    return null;
  }

}