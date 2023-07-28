import 'package:flutter/material.dart';
import 'package:todo_list/screens/add_task.dart';
import 'package:todo_list/services/database/writer.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Tasks"),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Completed",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Pending",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
        },
        child: const Icon(Icons.add_task),
      ),
    );
  }
}
