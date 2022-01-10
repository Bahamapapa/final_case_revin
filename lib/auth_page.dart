import 'dart:async';
import 'dart:io';
import 'package:final_case_revin/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}



class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
            color: const Color(0xFFbbbbbb), width: 2));
    const linkTextStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0079D0)
    );

    return MaterialApp(
      home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              //image: DecorationImage(
              //  image: AssetImage("assets/images/img.png"),
              //  fit: BoxFit.cover,
             // ),
            ),
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 60, ),
                const SizedBox(width: 120, height: 120, child: Image(image: AssetImage('assets/images/pizza-and-ingredients.jpeg')),),
                SizedBox(height: 10,),
                Text("Введите номер телефона и пароль",
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 60))),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    labelText: "Телефон",
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    labelText: "Пароль",
                  ),
                ),
                SizedBox(height: 28,),
                SizedBox(width: 154, height: 42,
                    child: ElevatedButton(
                      child: const Text('Войти'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ContactsPage()),
                        );
                    },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0079D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                      ),
                    )
                ),
                SizedBox(height: 32,),
                InkWell(child: const Text('Регистрация',
                  style: linkTextStyle,
                ),
                    onTap: () {}),
                SizedBox(height: 20,),
                InkWell(child: const Text('Забыли пароль?',
                  style: linkTextStyle,
                ), onTap: () {}),

              ],),
            ),
          )
      ),
    );
  }

}
