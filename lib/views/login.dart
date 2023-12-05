import 'package:event_management_app/auth.dart';
import 'package:event_management_app/constants/colors.dart';
import 'package:event_management_app/containers/custom_input_form.dart';
import 'package:event_management_app/views/homepage.dart';
import 'package:event_management_app/views/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const Text(
              'Login',
              style: TextStyle(
                  color: kLightGreen,
                  fontWeight: FontWeight.w800,
                  fontSize: 32),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputForm(
              controller: _emailController,
              icon: Icons.email,
              label: "Email",
              hint: "Enter your Email",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputForm(
              controller: _passwordController,
              obscureText: true,
              icon: Icons.lock_outline_rounded,
              label: "Password",
              hint: "Enter your Password",
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password",
                    style: TextStyle(
                        color: kLightGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w300)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    loginUser(_emailController.text, _passwordController.text)
                        .then((value) {
                      if (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Login successful")));
                        Future.delayed(
                            Duration(seconds: 2),
                            () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Homepage())));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Login failed, Try Again.")));
                      }
                    });
                  },
                  style: OutlinedButton.styleFrom(
                      foregroundColor: kLightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text("Login")),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create a New Account ?",
                    style: TextStyle(
                        color: kLightGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: kLightGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
