import '../models/user.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService apiService = ApiService();

  Future<List<User>> getUsers() async {
    return apiService.getUsers();
  }

  Future<User> createUser(String name, String job) async {
    return apiService.createUser(name, job);
  }
}
