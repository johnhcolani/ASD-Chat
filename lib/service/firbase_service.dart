import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<void> signInAnonymously()async{
    try{
      await FirebaseAuth.instance.signInAnonymously();
    }catch (e){
       print("Error signing in : $e");
    }
  }
}