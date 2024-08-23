import 'package:chat_app/src/core/configs/assets/images.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(AppImages.avatar1)),
              title: const Text(
                "Trương Nguyễn Công Chính",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("0987654321"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              )),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log out"),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About"),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
