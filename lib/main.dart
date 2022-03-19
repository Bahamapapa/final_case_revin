import 'package:flutter/material.dart';
import 'package:final_case_revin/auth_page.dart';

void main() {

 // runApp(App());

 runApp(const MaterialApp(
    title: "Contact book",
    home: AuthPage(), //AuthPage(),
  )
   /*const PizzaCalculatorScreen() const NavigationDrawerScreen()*/
 );

}

/*
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users list',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Список пользователей'),
        ),
        body: Center(
            child: AuthPage()
        ),
      ),
    );
  }
}

 */