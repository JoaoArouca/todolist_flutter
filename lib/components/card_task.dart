import 'package:flutter/material.dart';

class CardTask extends StatelessWidget {
  final String content;

  const CardTask(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Expanded(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  content,
                  style: const TextStyle(color: Colors.black87, fontSize: 20),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Icon(Icons.delete),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {},
                      child: const Icon(Icons.edit)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
