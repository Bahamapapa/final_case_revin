import 'package:flutter/material.dart';
import 'contact_data.dart';

class ContactViewPage extends StatelessWidget {
  final Post user;

  ContactViewPage({required this.user}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.Title),
        ),
        body: Container(
          width: double.infinity,
            margin: const EdgeInsets.only(top: 50),
          child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Text('User ID: ${user.UserID}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 0, 0, 60))),
            const SizedBox(
              height: 12,
            ),
            Text('Title:\n${user.Title}', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 60))),
            const SizedBox(
              height: 12,
            ),
            Text('Body text:\n\n${user.Body}', style: TextStyle(fontSize: 18, color: Color.fromRGBO(0, 0, 0, 60))),

  ]
        )
    )
    );
  }

}
