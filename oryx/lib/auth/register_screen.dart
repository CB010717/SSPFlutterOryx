import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/alert_dialog.dart';
import 'login_screen.dart'; // Correct import for LoginScreen

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  bool isLoading = false;

  // Function to register a user
  Future<void> _register() async {
    setState(() {
      isLoading = true;
    });

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final passwordConfirm = passwordConfirmController.text.trim();

    // Validate the input fields
    if (name.isEmpty || email.isEmpty || password.isEmpty || passwordConfirm.isEmpty) {
      _showAlertDialog("All fields are required.");
      setState(() {
        isLoading = false;
      });
      return;
    }

    if (password != passwordConfirm) {
      _showAlertDialog("Passwords do not match.");
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Call the API to register the user
    final isSuccess = await ApiService.registerUser(name, email, password);

    setState(() {
      isLoading = false;
    });

    if (isSuccess) {
      _showAlertDialog("Registration Successful. Please log in.");
      // Navigate to Login Screen after the dialog is dismissed
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      });
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
        title: const Text("Create Account"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: Colors.white, // Set background color
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome! Let's get started.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // Input fields
              _buildInputField(
                controller: nameController,
                labelText: "Name",
                hintText: "Enter your name",
                isPassword: false,
              ),
              const SizedBox(height: 16), // Reduced space between fields

              _buildInputField(
                controller: emailController,
                labelText: "Email",
                hintText: "Enter your email",
                isPassword: false,
              ),
              const SizedBox(height: 16),

              _buildInputField(
                controller: passwordController,
                labelText: "Password",
                hintText: "Enter your password",
                isPassword: true,
              ),
              const SizedBox(height: 16),

              _buildInputField(
                controller: passwordConfirmController,
                labelText: "Confirm Password",
                hintText: "Confirm your password",
                isPassword: true,
              ),
              const SizedBox(height: 30),

              // Register button
              isLoading
                  ? const CircularProgressIndicator()
                  : _buildRegisterButton(),
              const SizedBox(height: 20),

              // Login prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Login Now",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
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

  // Helper method to create input fields for reuse
  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required bool isPassword,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.purple, width: 2.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      style: const TextStyle(fontSize: 16),
    );
  }

  // Method to create a stylized register button
  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _register,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        backgroundColor: Colors.purple, // Background color
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white, // Button text color
        ),
      ),
      child: const Text("Register"),
    );
  }
}