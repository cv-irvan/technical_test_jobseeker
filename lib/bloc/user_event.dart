abstract class UserEvent {}

class GetUserList extends UserEvent {}

class CreateUser extends UserEvent {
  final String name;
  final String job;

  CreateUser(this.name, this.job);
}
