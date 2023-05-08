import 'package:chat_app/models/server_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> login(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      late String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }else{
        message = e.message ?? "Error when login";
      }
      throw ServerException(
        explaint: "Error al iniciar sesión",
        message:  message,
      );
    } catch (e) {
      throw ServerException(explaint: "Error al iniciar sesión");
    }
  }

  Future<void> logout() => _auth.signOut();

  Future<void> register(String email, String password) {
    try {
      return _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException(
        explaint: "Error al registrar usuario",
        message: e.message,
      );
    } catch (e) {
      throw ServerException(explaint: "Error al registrar usuario");
    }
  }
}
