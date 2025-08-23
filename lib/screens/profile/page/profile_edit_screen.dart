import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spotify_app/widgets/custom_textfield.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  void saveUsername(String name) {
    final newName = name.trim();
    box.put('username', newName);
  }

  final TextEditingController _usernameController = TextEditingController();
  var box = Hive.box('Flutter');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                saveUsername(_usernameController.text);
                Navigator.pushReplacementNamed(context, '/profile/view');
              },
              icon: Icon(Icons.done),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Change your username:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 4),
              CustomTextfield(
                hintText: box.get("username") ?? "username",
                controller: _usernameController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
