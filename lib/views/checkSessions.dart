import 'package:event_management_app/views/homepage.dart';
import 'package:event_management_app/views/login.dart';
import 'package:event_management_app/auth.dart';
import 'package:flutter/material.dart';

class checkSessions extends StatefulWidget {
  const checkSessions({super.key});

  @override
  State<checkSessions> createState() => _checkSessionsState();
}

class _checkSessionsState extends State<checkSessions> {
  @override
  void initState() {
// check if user has an active session or not

    Future checkSessions() async {
      try {
        await account.getSession(sessionId: 'current');
        return true;
      } catch (e) {
        return false;
      }
    }

    checkSessions().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
