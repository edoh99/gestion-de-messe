import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Connexion avec google
  Future<UserCredential> signInWithGoogle() async {
    // Declanchement des flux d'authentification
    final googleUser = await _googleSignIn.signIn();

    // Obtenir les details d'autorisation de la demande
    final googleAuth = await googleUser!.authentication;

    // Creation d'un nouvel identifiant
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Renvoie d'identifiant de l'utilisateur apres connexion
    return await _auth.signInWithCredential(credential);
  }

  // L'etat d'utilisateur en temps reel
  Stream<User?> get user => _auth.authStateChanges();

  // Deconnexion
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
