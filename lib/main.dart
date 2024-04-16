import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/user_bloc.dart';
import 'screens/home_screen.dart';
import 'repositories/user_repository.dart';
import 'utils/local_database_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserLocalAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'technical_test',
      home: BlocProvider(
        create: (context) => UserBloc(UserRepository()),
        child: const HomeScreen(),
      ),
    );
  }
}
