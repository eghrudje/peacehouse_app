
import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> createAccount({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return 'Account Created';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password'){
       return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exist for that email';
      }
    } catch (e) {
      return 'Error Occurred';
    }
    return'';
  }
  Future<String> signInAccount({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return 'Welcome';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user for that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user';
      }
    }
    return '';
  }

  Future<String> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(
          email: email,
      );
      return 'Email sent';
    } catch (e) {
      return 'Error Occurred';
    }
  }
  void signOut() {
    auth.signOut();
  }

}