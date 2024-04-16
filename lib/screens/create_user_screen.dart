import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';

class CreateUserScreen extends StatelessWidget {
  CreateUserScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat User Baru'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserCreated) {
            nameController.clear();
            jobController.clear();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("User Dibuat"),
                  content: Text(
                      "Nama : ${state.user.name.toString()}\nJob : ${state.user.job.toString()}"),
                  actions: <Widget>[
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: jobController,
                decoration: const InputDecoration(labelText: 'Pekerjaan'),
              ),
              ElevatedButton(
                onPressed: () {
                  final String name = nameController.text;
                  final String job = jobController.text;

                  if (name.isNotEmpty && job.isNotEmpty) {
                    BlocProvider.of<UserBloc>(context)
                        .add(CreateUser(name, job));
                  }
                },
                child: const Text('Buat Pengguna'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
