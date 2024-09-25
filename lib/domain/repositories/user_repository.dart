import 'package:fresshi/data/models/user.dart';

abstract class UserRepository {
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(User user);
  Future<User?> getUserById(String userId);
  Future<List<User>> getUsers();
}