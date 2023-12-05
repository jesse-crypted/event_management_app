import 'package:event_management_app/auth.dart';
import 'package:event_management_app/constants/colors.dart';
import 'package:event_management_app/saved_data.dart';
import 'package:event_management_app/views/create_event_page.dart';
import 'package:event_management_app/views/login.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String userName = "User";
  @override
  void initState() {
    userName = SavedData.getUserName();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                logoutUser();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: const Icon(
                Icons.logout,
                color: kLightGreen,
                size: 30,
              ))
        ],
      ),
      body: Text(
        "Hi ${userName}👋",
        style: TextStyle(
            color: kLightGreen, fontSize: 24, fontWeight: FontWeight.w600),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateEventPage()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: kLightGreen,
      ),
    );
  }
}
