import 'package:chat_app/src/common/widgets/custom_button.dart';
import 'package:chat_app/src/core/configs/assets/images.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Center(
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        AppImages.avatar1,
                        height: 140,
                        width: 140,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Form(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return "Cannot be empty";
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Enter you name"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Form(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return "Cannot be empty";
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Phone number"),
                    ),
                  ),
                ),
              ],
            ),
            const CustomButton(
              title: "Update",
              backgroundColor: Color(0xFF0A83F9),
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
