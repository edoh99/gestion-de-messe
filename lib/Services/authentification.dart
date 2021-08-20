import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestion_eglise/Pages/User.dart';

class AuthentificationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFormFirebaseUser(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? AppUser(uid: user.uid) : null;
  }
 
  // Stream<AppUser> get user {
  //   return _auth.authStateChanges().map(_userFormFirebaseUser);
  // }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFormFirebaseUser(user!);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      return _userFormFirebaseUser(user!);
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }
}
