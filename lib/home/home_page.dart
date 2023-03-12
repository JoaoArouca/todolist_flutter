import "package:flutter/material.dart";

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
  List<String> _tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        centerTitle: true,
      ),
      body: Container(
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
                        style: const TextStyle(
                            fontSize: 18, color: Colors.black87),
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
                                backgroundColor: Colors.green),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _tasks.add(taskController.text);
                                });
                                taskController.clear();
                              }
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(fontSize: 18),
                            ),
                          ))
                    ],
                  )),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text(_tasks[index]),
                    ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
