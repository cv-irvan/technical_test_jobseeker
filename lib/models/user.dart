class User {
  final dynamic id;
  final String? email;
  final String? firstName;
  final String? name;
  final String? lastName;
  final String? avatar;
  final String? job;

  User(
      {this.id,
      this.email,
      this.firstName,
      this.name,
      this.lastName,
      this.avatar,
      this.job});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
      job: json['job'],
    );
  }
}
