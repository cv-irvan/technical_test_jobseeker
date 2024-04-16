import 'package:hive_flutter/hive_flutter.dart';
import 'package:technical_test/utils/local_database_adapter.dart';

import '../models/user.dart';

Future<void> saveUsersToHive(List<User> users) async {
  await Hive.openBox<UserLocal>('userBox');
  final box = Hive.box<UserLocal>('userBox');

  await box.clear();

  for (var user in users) {
    await box.add(
      UserLocal(
        id: user.id,
        email: user.email.toString(),
        firstName: user.firstName.toString(),
        lastName: user.lastName.toString(),
      ),
    );
  }
}

Future<List<UserLocal>> getUsersFromHive() async {
  final box = Hive.box<UserLocal>('userBox');
  return box.values.toList();
}

Future<List<UserLocal>> searchUsers(String query) async {
  final box = Hive.box<UserLocal>('userBox');
  final List<UserLocal> users = box.values.toList();

  final List<UserLocal> filteredUsers = users.where((user) {
    final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();
    return fullName.contains(query.toLowerCase());
  }).toList();

  return filteredUsers;
}
