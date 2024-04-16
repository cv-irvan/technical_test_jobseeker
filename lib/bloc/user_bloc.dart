import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/utils/local_database.dart';
import '../repositories/user_repository.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<GetUserList>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await userRepository.getUsers();
        await saveUsersToHive(users);
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<CreateUser>((event, emit) async {
      try {
        final user = await userRepository.createUser(event.name, event.job);
        emit(UserCreated(user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
