import 'package:flutter/material.dart';
import '../utils/local_database.dart';
import '../utils/local_database_adapter.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  SearchUserScreenState createState() => SearchUserScreenState();
}

class SearchUserScreenState extends State<SearchUserScreen> {
  List<UserLocal> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();

  bool isEmpty = true;

  void _searchUsers(String query) async {
    if (query.isNotEmpty) {
      final results = await searchUsers(query);
      setState(() {
        _searchResults = results;
        isEmpty = false;
      });
    } else {
      setState(() {
        _searchResults = [];
        isEmpty = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari User'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Cari',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _searchUsers('');
                  },
                ),
              ),
              onChanged: _searchUsers,
            ),
          ),
          Expanded(
            child: (isEmpty)
                ? const Text('Tidak ada hasil')
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final user = _searchResults[index];
                      return ListTile(
                        title: Text('${user.firstName} ${user.lastName}'),
                        subtitle: Text(user.email),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
