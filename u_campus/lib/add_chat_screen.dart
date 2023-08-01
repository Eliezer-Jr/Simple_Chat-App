import 'package:flutter/material.dart';

class AddChatScreen extends StatefulWidget {
  final Function(String) addNewUser;

  AddChatScreen({required this.addNewUser});

  @override
  _AddChatScreenState createState() => _AddChatScreenState();
}

class _AddChatScreenState extends State<AddChatScreen> {
  List<String> chatContacts = [
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

  List<String> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    chatContacts.sort(); // Sort the chat contacts in alphabetical order
    filteredContacts = chatContacts;
  }

  void _filterContacts(String query) {
    setState(() {
      filteredContacts = chatContacts.where((contact) => contact.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Chat Contact'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? selected = await showSearch<String>(
                context: context,
                delegate: CustomSearchDelegate(filteredContacts),
              );

              if (selected != null && !chatContacts.contains(selected)) {
                widget.addNewUser(selected); // Add the selected contact to the ChatTab
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                chatContacts.sort(); // Sort the chat contacts in alphabetical order
                filteredContacts = chatContacts;
              });
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: filteredContacts.length,
        separatorBuilder: (context, index) => Divider(), // Add a line separator between items
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(filteredContacts[index][0]), // Display the first character of the contact's name as an initial
            ),
            title: Text(filteredContacts[index]),
            onTap: () {
              widget.addNewUser(filteredContacts[index]); // Add the selected contact to the ChatTab
              Navigator.pop(context); // Navigate back to the ChatTab
            },
          );
        },
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> contacts;

  CustomSearchDelegate(this.contacts);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Build the search results based on the query
    final List<String> searchResults = contacts.where((contact) => contact.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions as the user types in the search bar
    final List<String> searchSuggestions = contacts.where((contact) => contact.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: searchSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchSuggestions[index]),
          onTap: () {
            query = searchSuggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
