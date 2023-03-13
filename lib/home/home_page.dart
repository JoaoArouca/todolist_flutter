import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

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
  SharedPreferences? prefs;
  List<String> tasklist = [];

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    readDatabase();
  }

  Future<void> initSharedPreferences() async {
    prefs ??= await SharedPreferences.getInstance();
    readDatabase();
    // readDatabase();
  }

  List<String> readDatabase() {
    tasklist = prefs?.getStringList('tasks') ?? [];
    return tasklist;
  }

  Future<void> saveDatabase(String task) async {
    List<String> list = readDatabase();
    list.add(task);
    await prefs?.setStringList('tasks', list);
    tasklist = readDatabase();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          Navigator.pushNamed(context, 'list-page', arguments: tasklist);
        },
        label: const Text('Lista de Tarefas'),
        backgroundColor: Colors.pink,
        icon: const Icon(Icons.list),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _body(List<String>? tasklist) {
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
                              saveDatabase(taskController.text);
                              taskController.clear();
                              setState(() {});
                            }
                          },
                          child: const Icon(Icons.add_task),
                        ))
                  ],
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasklist?.length ?? 0,
              itemBuilder: (context, index) {
                final task = tasklist?[index] ?? '';
                return GestureDetector(
                  onTap: () {
                    debugPrint(task);
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
        ],
      ),
    );
  }
}
