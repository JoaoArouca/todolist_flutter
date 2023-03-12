import 'package:flutter/material.dart';
import 'package:todo_app/home/home_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
