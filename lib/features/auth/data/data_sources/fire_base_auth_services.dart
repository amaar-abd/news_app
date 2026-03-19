import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/errors/custom_exception.dart';

class FireBaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email',
        );
      } else if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'The email address is not valid');
      } else {
        throw CustomException(message: 'check your internet connection');
      }
    } catch (e) {
      throw CustomException(
        message: 'Something went wrong, please try again later.',
      );
    }
  }

  Future<void> deleteUser() async {
    await _auth.currentUser!.delete();
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
       throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
      throw  CustomException(message: 'Wrong password provided for that user.');
      }else{
        throw  CustomException(message: '');
      }
    } catch (e) {
     throw CustomException(message: e.toString());
    }
  }
}
