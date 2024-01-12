import 'dart:developer';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Call a function to handle the login logic
                login();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle the login logic
  void login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    
    // Add your login validation logic here
    if (username.isNotEmpty && password.isNotEmpty) {
      // Successful login
      log('Login successful! Welcome, $username!');
    } else {
      // Invalid credentials
      log('Invalid credentials. Please try again.');
    }
  }
}
