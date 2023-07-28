import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget smallspace = SizedBox(
      height: 50.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Add Task"),
        ),
      ),
      body: Form(
        child: Column(
          children: [
            smallspace,
            TextFormField(
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                hintText: 'Task',
                hintStyle: const TextStyle(fontSize: 14),
                icon:
                    const Icon(CupertinoIcons.square_list, color: Colors.brown),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            smallspace,
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                hintText: 'Description',
                hintStyle: const TextStyle(fontSize: 14),
                icon: const Icon(CupertinoIcons.bubble_left_bubble_right,
                    color: Colors.brown),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            smallspace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Add"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
