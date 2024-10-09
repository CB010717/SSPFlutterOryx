import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/alert_dialog.dart';
import 'login_screen.dart'; // Correct import for LoginScreen

class RegisterScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const RegisterScreen({super.key, required this.toggleTheme, required this.isDarkMode});

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

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final passwordConfirm = passwordConfirmController.text.trim();

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

    final isSuccess = await ApiService.registerUser(name, email, password);

    setState(() {
      isLoading = false;
    });

    if (isSuccess) {
      _showAlertDialog("Registration Successful. Please log in.");
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => LoginScreen(
              toggleTheme: widget.toggleTheme,
              isDarkMode: widget.isDarkMode,
            ),
          ),
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
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
              const SizedBox(height: 16),

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

              isLoading
                  ? const CircularProgressIndicator()
                  : _buildRegisterButton(),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => LoginScreen(
                            toggleTheme: widget.toggleTheme,
                            isDarkMode: widget.isDarkMode,
                          ),
                        ),
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
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _register,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.purple,
      ),
      child: const Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
