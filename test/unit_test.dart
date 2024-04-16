import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:technical_test/bloc/user_bloc.dart';
import 'package:technical_test/bloc/user_event.dart';
import 'package:technical_test/bloc/user_state.dart';
import 'package:technical_test/models/user.dart';
import 'package:technical_test/repositories/user_repository.dart';
import 'package:technical_test/utils/local_database.dart';
import 'package:technical_test/utils/local_database_adapter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() async {
  setUpAll(() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserLocalAdapter());
  });

  group('Local Database Tests', () {
    test('Save and Retrieve Users', () async {
      List<User> users = [
        User(
            id: 1,
            firstName: 'one',
            lastName: 'test',
            email: 'onetest@example.com'),
        User(
            id: 2, name: 'two', lastName: 'test', email: 'twotest@example.com'),
      ];

      await saveUsersToHive(users);

      final retrievedUsers = await getUsersFromHive();

      expect(retrievedUsers.length, users.length);
      expect(retrievedUsers[0].firstName, 'one');
      expect(retrievedUsers[1].firstName, 'two');
    });

    test('Search Users', () async {
      await saveUsersToHive([
        User(
            id: 1,
            firstName: 'one',
            lastName: 'test',
            email: 'onetest@example.com'),
        User(
            id: 2, name: 'two', lastName: 'test', email: 'twotest@example.com'),
      ]);

      final searchResults = await searchUsers('one');

      expect(searchResults.length, 1);
      expect(searchResults[0].firstName, contains('one'));
    });

    tearDownAll(() async {
      await Hive.deleteBoxFromDisk('userBox');
    });
  });

  group('UserBloc', () {
    late UserRepository userRepository;
    late UserBloc userBloc;

    setUp(() {
      userRepository = MockUserRepository();
      userBloc = UserBloc(userRepository);
    });

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserLoaded] when GetUserList is added and succeeds',
      build: () => userBloc,
      act: (bloc) {
        when(userRepository.getUsers())
            .thenAnswer((_) async => [User(id: 1, firstName: 'George')]);
        bloc.add(GetUserList());
      },
      expect: () => [
        UserLoading(),
        UserLoaded([User(id: 1, name: 'George')])
      ],
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserCreated] when CreateUser is added and succeeds',
      build: () => userBloc,
      act: (bloc) {
        when(userRepository.createUser('Jane Doe', 'Developer')).thenAnswer(
            (_) async => User(id: 2, name: 'Jane Doe', job: 'Developer'));
        bloc.add(CreateUser('George', 'Developer'));
      },
      expect: () => [
        UserLoading(),
        UserCreated(User(id: 2, name: 'George', job: 'Developer'))
      ],
    );

    tearDown(() {
      userBloc.close();
    });
  });
}
