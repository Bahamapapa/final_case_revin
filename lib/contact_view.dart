import 'package:flutter/material.dart';
import 'contact_data.dart';
import 'contact_details.dart';
import 'package:http/http.dart';
import 'dart:convert';

late List<Post> users = [];

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);


  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  final url = "https://jsonplaceholder.typicode.com/posts/";

  Future<void> fetchPosts() async {
    try {

      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);

      setState(() {

        for (var i = 0; i < jsonData.length; i++) {
          final post = jsonData[i];
          Post record = Post(UserID: post["userId"],
              id: post["id"],
              Title: post["title"],
              Body: post['body']);
          users.add(record);
        }
      });

    } catch (err){throw Exception('Failed to load json $err');}

  }

  @override
  void initState(){
    super.initState();

    fetchPosts();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: Container(
          child: ContactList(users),
        )
    );
  }
}

class ContactList extends StatelessWidget {
  final List _users;

  ContactList(this._users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: users.length,
      itemBuilder: _buildContacts,
    );
  }

  Widget _buildContacts(context, index) {
    return ContactItem(_users[index]);
  }

}

class ContactItem extends StatelessWidget {
  const ContactItem(this.user);

  final Post user;

  Widget _buildTiles(BuildContext context, Post user) {
    return ListTile(
      title: Text(user.Title),
      subtitle: Text("ID Автора ${user.UserID}"),
      leading: CircleAvatar(
        child: Text("${user.id}"),
      ),
      trailing: Icon(Icons.local_post_office),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ContactViewPage(user: user,);
               return Scaffold(
                 appBar: AppBar(
                   title: Text(user.Title)
                 ),
                 body: Text('Hello'),
               );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, user);
  }
}
