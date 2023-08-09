import 'package:flutter/material.dart';
import 'package:todo_list/services/auth/auth_provider.dart';

import 'package:todo_list/screens/todo.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SignInPageState();
}

class _SignInPageState extends State<SigninScreen> {
  Widget smallsize = const SizedBox(
    height: 40.0,
  );
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sign In")),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Username',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(Icons.email, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              smallsize,
              TextFormField(
                controller: _passwordController,
                style: const TextStyle(fontSize: 14),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(Icons.lock, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              smallsize,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(100, 40),
                ),
                onPressed: () async {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  try {
                    final user =
                        await AuthProvider.login(context, username, password);

                    if (user != null) {
                      // Clear the TextFormFields after successful sign in
                      _usernameController.clear();
                      _passwordController.clear();

                      // Navigate to the TodoScreen after successful sign in
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoScreen()));
                    } else {
                      // Handle sign-in failure if needed
                      // e.g., Show an error message
                      debugPrint("Invalid credentials. Please try again.");
                    }
                  } catch (e) {
                    // Handle sign-in error if needed
                    debugPrint("Error in sign in: ${e.toString()}");
                  }
                },
                child: Text(
                  "Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
