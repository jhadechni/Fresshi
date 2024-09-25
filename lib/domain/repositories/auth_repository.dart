import 'package:fresshi/data/models/user.dart';

abstract class AuthenticationRepository {
  Future<User> signInWithPhoneNumber();
  Future<User> signInWithGoogle();
  Future<User> signUp();
  Future<void> signOut();
}
