import 'package:flutter/material.dart';
import 'package:todo_app/components/card_task.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListState();
  }
}

class ListState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final tasks = ModalRoute.of(context)?.settings.arguments as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Adicione aqui a ação que será executada quando o botão for pressionado.
          Navigator.pushNamed(context, '/');
        },
        label: const Text('Adicionar Tarefas'),
        backgroundColor: Colors.pink,
        icon: const Icon(Icons.add_task),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView.builder(
          // itemCount: (tasks as List).length,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return CardTask(tasks[index]);
          }),
    );
  }
}
