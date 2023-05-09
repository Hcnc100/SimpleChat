import 'package:chat_app/models/api/credentials_dto.dart';
import 'package:chat_app/models/server_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> login(CredentialsDTO credentialsDTO) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
        email: credentialsDTO.email,
        password: credentialsDTO.password,
      );
      return credentials.user!.uid;
    } on FirebaseAuthException catch (e) {
      late String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message ?? "Error when login";
      }
      throw ServerException(
        explaint: "Error al iniciar sesión",
        message: message,
      );
    } catch (e) {
      throw ServerException(explaint: "Error al iniciar sesión");
    }
  }

  Future<void> logout() => _auth.signOut();

  Future<void> register(
    CredentialsDTO credentialsDTO,
  ) {
    try {
      return _auth.createUserWithEmailAndPassword(
        email: credentialsDTO.email,
        password: credentialsDTO.password,
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
