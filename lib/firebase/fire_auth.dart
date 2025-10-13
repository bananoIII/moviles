import 'package:firebase_auth/firebase_auth.dart';

class Firebase_Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      user!.sendEmailVerification();
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> signInEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result?.user;
      if (user != null && !user.emailVerified) {
        await _auth.signOut();
        throw FirebaseAuthException(
          code: 'not-verified',
          message: 'Pls, coloque su correo electronico.',
        );
      }
      return user;
    } catch (e) {
      print(e);
    }
  }
}
