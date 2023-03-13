import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:todo_app/configs/app_settings.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: prefer_final_fields
  // late List<String> task = [];
  late Map<String, List<String>> db;

  readDatabase() {
    db = context.watch<AppSettings>().database;
  }

  @override
  Widget build(BuildContext context) {
    readDatabase();
    final tasklist = db['tasks'] ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
      ),
      body: _body(tasklist),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Adicione aqui a ação que será executada quando o botão for pressionado.
          Navigator.pushNamed(context, 'list-page', arguments: tasklist);
        },
        label: const Text('Lista de Tarefas'),
        backgroundColor: Colors.pink,
        icon: const Icon(Icons.list),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _body(List<String> tasklist) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: taskController,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black87),
                      decoration: const InputDecoration(
                          hintText: 'Crie uma nova tarefa aqui...',
                          hintStyle: TextStyle(fontSize: 15)),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Campo de input necessário';
                        }
                        return null;
                      },
                    )),
                    Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.lightGreen),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                tasklist.add(taskController.text);
                              });
                              await context
                                  .read<AppSettings>()
                                  .setLocale(tasklist);
                              taskController.clear();
                            }
                          },
                          child: const Icon(Icons.add_task),
                        ))
                  ],
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasklist.length,
              itemBuilder: (context, index) {
                final task = tasklist[index];
                return GestureDetector(
                  onTap: () {
                    print(task);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(task),
                    ),
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //   child:
          //       Consumer<AppSettings>(builder: (context, appSettings, child) {
          //     final taskList = appSettings.database['tasks'] ?? [];
          //     return ListView.builder(
          //         itemCount: taskList.length,
          //         itemBuilder: (context, index) {
          //           final task = taskList[index];
          //           return GestureDetector(
          //             onTap: () {
          //               print(task[index]);
          //             },
          //             child: Card(
          //                 child: ListTile(
          //               title: Text(task[index]),
          //             )),
          //           );
          //         });
          //   }),
          // )
        ],
      ),
    );
  }
}
