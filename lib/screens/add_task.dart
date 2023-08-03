import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/services/database/writer.dart';
import 'package:todo_list/widgets/add_button.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();
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
              controller: _titleController,
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
              controller: _descriptionController,
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
                SizedBox(
                  width: 150,
                  height: 38,
                  child: ElevatedButton(
                      onPressed: () async {
                        String taskTitle = _titleController.text;
                        String taskDescription = _descriptionController.text;

                        // Call the function to save the data to Firestore
                        await DataWriter.create(taskTitle, taskDescription);

                        // Clear the TextFormFields after adding the task
                        _titleController.clear();
                        _descriptionController.clear();
                      },
                      child: Text(
                        "Add",
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white))))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
