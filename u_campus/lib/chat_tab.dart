import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'add_chat_screen.dart';
import 'chat_screen.dart';
import 'chat_screen.dart';

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  List<String> randomUsers = [
    'John Doe',
    'Alice Smith',
    'Bob Johnson',
    'Emily Wilson',
    'Michael Brown',
    'Emma Davis',
    'Daniel Lee',
    'Olivia Miller',
    'James Garcia',
    'Sophia Martinez',
  ];

  void _addNewUser(String userName) {
    setState(() {
      randomUsers.add(userName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Tab'),
      ),
      body: ListView.builder(
        itemCount: randomUsers.length,
        itemBuilder: (context, index) {
          final user = randomUsers[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(user[0]), // Display the first character of the user's name as an initial
            ),
            title: Text(user),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(userName: user),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddChatScreen(addNewUser: _addNewUser),
            ),
          );
        },
        child: Icon(Icons.chat_outlined),
      ),
    );
  }
}
