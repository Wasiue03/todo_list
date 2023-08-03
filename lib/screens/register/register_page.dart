import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/services/auth/auth_provider.dart';
import 'package:todo_list/models/user_auth.dart';
import 'package:todo_list/screens/todo.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final Widget smallspace = SizedBox(
      height: 50.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Register")),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: [
              smallspace,
              TextFormField(
                controller: _nameController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Full Name',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(CupertinoIcons.square_list,
                      color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              smallspace,
              TextFormField(
                controller: _emailController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Email',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(CupertinoIcons.bubble_left_bubble_right,
                      color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              smallspace,
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Password',
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
                        String name = _nameController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        // Call the function to register the user
                        try {
                          await AuthProvider.register(password, email, name);

                          // Clear the TextFormFields after successful registration
                          _nameController.clear();
                          _emailController.clear();
                          _passwordController.clear();

                          // Navigate to the TodoScreen after successful registration
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TodoScreen()));
                        } catch (e) {
                          // Handle registration failure if needed
                          // e.g., Show an error message
                          debugPrint("Error in registration: ${e.toString()}");
                        }
                      },
                      child: Text("Register"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
