import 'dart:async';
import 'dart:io';
import 'package:final_case_revin/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: LoginScaffold(storage: LoginStorage()),
    );
  }
}

class LoginStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/login.txt');
  }

  Future<String> readLogin() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return empty string
      return "";
    }
  }

  Future<File> writeLogin(String login) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$login');
  }
}

class LoginScaffold extends StatefulWidget{
    const LoginScaffold({Key? key, required this.storage}) : super(key: key);

    final LoginStorage storage;

    @override
    _LoginScaffoldState createState() => _LoginScaffoldState();
}

class _LoginScaffoldState extends State<LoginScaffold> {
  final String _rightlogin = '+79557105050';
  final String _rightpassword = 'superpower';
  String _login = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    widget.storage.readLogin().then((value) {
      setState(() {
        _login = value;
        loginController.text = _login;
      });
    });
  }

  Future<File> _setLogin() {
    setState(() {
    });

    // Write the variable as a string to the file.
    _login = loginController.text;
    return widget.storage.writeLogin(_login);

  }

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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

    return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 60, ),
                const SizedBox(width: 80, height: 80, child: Image(image: AssetImage('assets/img.png')),),
                SizedBox(height: 10,),
                Text("Введите номер телефона и пароль",
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 60))),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    labelText: "Телефон",
                  ),
                  controller: loginController,
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
                  controller: passwordController,
                ),
                SizedBox(height: 20,),
                SizedBox(width: 154, height: 42,
                    child: ElevatedButton(
                      child: const Text('Войти'),
                      onPressed: (){

    // Здесь проверим комбинацию логин-пароль
                        _setLogin();
                        if ((_login == _rightlogin) && (passwordController.text == _rightpassword)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactsPage()),
                          );
                        } else {
                          showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Неверная комбинация номера телефона и пароля, попробуйте еще раз!"),
          );}
    );
                        }
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
            )
      ));
  }
}


