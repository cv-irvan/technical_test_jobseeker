import 'package:hive/hive.dart';

part 'local_database_adapter.g.dart';

@HiveType(typeId: 0)
class UserLocal extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String firstName;

  @HiveField(3)
  final String lastName;

  UserLocal(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName});
}
