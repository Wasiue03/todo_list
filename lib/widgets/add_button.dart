import 'package:flutter/material.dart';

import '../services/database/writer.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});
  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  Widget smallsize = const SizedBox(
    height: 40.0,
  );
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white))))),
        ),
      ],
    );
  }
}
