import 'package:event_management_app/auth.dart';
import 'package:event_management_app/views/login.dart';
import 'package:flutter/material.dart';
import 'package:event_management_app/constants/colors.dart';
import 'package:event_management_app/containers/custom_input_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
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
              'Sign Up',
              style: TextStyle(
                  color: kLightGreen,
                  fontWeight: FontWeight.w800,
                  fontSize: 32),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputForm(
              controller: _nameController,
              icon: Icons.person_outline,
              label: "Name",
              hint: "Enter your Name",
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
              obscureText: true,
              controller: _passwordController,
              icon: Icons.lock_outline_rounded,
              label: "Password",
              hint: "Enter your Password",
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    createUser(_nameController.text, _emailController.text,
                            _passwordController.text)
                        .then((value) {
                      if (value == "success") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Account Created")));
                        Future.delayed(
                            Duration(seconds: 2),
                            () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage())));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(value)));
                      }
                    });
                  },
                  style: OutlinedButton.styleFrom(
                      foregroundColor: kLightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text("Sign up")),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: TextStyle(
                        color: kLightGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Log In",
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
