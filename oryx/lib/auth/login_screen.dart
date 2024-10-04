import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/token_service.dart'; // Import TokenService
import '../screens/home_screen.dart'; // Home Screen after login
import '../widgets/alert_dialog.dart'; // Custom alert dialog for errors
import 'register_screen.dart'; // Correct import for RegisterScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  // Function to handle login
  void _login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog("Please fill in both fields.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      // Perform login via API service
      final response = await ApiService.loginUser(email, password);

      if (response != null && response.containsKey('access_token')) {
        final token = response['access_token'];

        // Store the token using TokenService
        await TokenService.storeToken(token);

        // Navigate to Home Screen after successful login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        _showErrorDialog("Login failed. Please check your credentials.");
      }
    } catch (e) {
      _showErrorDialog("An error occurred during login. Please try again.");
    }

    setState(() {
      isLoading = false;
    });
  }

  // Function to display error dialogs
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialogWidget(
        title: "Error",
        message: message,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input field for email
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // Input field for password
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // Login button with loading indicator
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

            const SizedBox(height: 20),

            // Option to navigate to Register Screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    " Register",
                    style: TextStyle(color: Colors.purple),
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
