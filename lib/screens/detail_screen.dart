import 'package:flutter/material.dart';
import '../models/user.dart';

class DetailScreen extends StatelessWidget {
  final User? user;

  const DetailScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user == null ? 'Buat Pengguna Baru' : 'Detail Pengguna'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Nama: ${user!.firstName} ${user!.lastName}'),
            Text('Email: ${user!.email}'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
