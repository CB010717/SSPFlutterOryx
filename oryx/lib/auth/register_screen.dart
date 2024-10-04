import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/input_field.dart';
import 'login_screen.dart'; // Correct import for LoginScreen

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  bool isLoading = false;

  void _register() async {
    setState(() {
      isLoading = true;
    });

    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final passwordConfirm = passwordConfirmController.text;

    if (password != passwordConfirm) {
      _showAlertDialog("Passwords do not match.");
      setState(() {
        isLoading = false;
      });
      return;
    }

    final isSuccess = await ApiService.registerUser(name, email, password);

    setState(() {
      isLoading = false;
    });

    if (isSuccess) {
      _showAlertDialog("Registration Successful. Please log in.");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      _showAlertDialog("Registration Failed. Please try again.");
    }
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogWidget(
          title: "Registration Status",
          message: message,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input field for name
            InputFieldWidget(
              controller: nameController,
              labelText: "Name",
              hintText: "Enter your name",
              isPassword: false,
            ),
            const SizedBox(height: 20),

            // Input field for email
            InputFieldWidget(
              controller: emailController,
              labelText: "Email",
              hintText: "Enter your email",
              isPassword: false,
            ),
            const SizedBox(height: 20),

            // Input field for password
            InputFieldWidget(
              controller: passwordController,
              labelText: "Password",
              hintText: "Enter your password",
              isPassword: true,
            ),
            const SizedBox(height: 20),

            // Input field for password confirmation
            InputFieldWidget(
              controller: passwordConfirmController,
              labelText: "Confirm Password",
              hintText: "Confirm your password",
              isPassword: true,
            ),
            const SizedBox(height: 20),

            // Register button
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
            const SizedBox(height: 20),

            // Login prompt
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Do you have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    "Login Now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
