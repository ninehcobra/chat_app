import 'package:chat_app/src/common/constants/router.dart';
import 'package:chat_app/src/core/configs/assets/images.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Chats',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouterConstants.profile);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  AppImages.avatar1,
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          AppImages.avatar2,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ]),
                    title: const Text('Nguyen Van A'),
                    subtitle: const Text('Hello'),
                    trailing: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF0684F8),
                              borderRadius: BorderRadius.circular(100)),
                          child: const SizedBox(
                              height: 24,
                              width: 24,
                              child: Center(
                                child: Text(
                                  "10",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        const Text('12:00'),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/search");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
