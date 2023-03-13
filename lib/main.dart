import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/configs/app_settings.dart';
import 'package:todo_app/home/home_page.dart';
import 'package:todo_app/pages/list_page.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AppSettings())],
      child: const App(),
    ));

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        'list-page': (context) => const ListPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
