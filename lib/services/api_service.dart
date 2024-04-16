import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  final String baseUrl = "https://reqres.in/api";

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users?per_page=12'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['data'];
      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<User> createUser(String name, String job) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: {
        'name': name,
        'job': job,
      },
    );

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }
}
