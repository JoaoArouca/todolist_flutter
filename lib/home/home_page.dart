import "package:flutter/material.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
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
            Form(
                child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                  decoration: const InputDecoration(
                      hintText: 'Crie uma nova tarefa aqui...',
                      hintStyle: TextStyle(fontSize: 15)),
                  keyboardType: TextInputType.text,
                )),
                Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green),
                      onPressed: () {},
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 18),
                      ),
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
