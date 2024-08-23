import 'package:chat_app/src/common/widgets/chat_message.dart';
import 'package:chat_app/src/core/configs/assets/images.dart';
import 'package:chat_app/src/data/models/message.dart';
import 'package:flutter/material.dart';

class DetailChatScreen extends StatefulWidget {
  const DetailChatScreen({super.key});

  @override
  State<DetailChatScreen> createState() => _DetailChatScreenState();
}

class _DetailChatScreenState extends State<DetailChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  List messages = [
    MessageModel(
        message: "hi keo",
        sender: "201",
        receiver: "202",
        messageId: "12312311",
        timestamp: DateTime(2024, 23, 8),
        isSeenByReceiver: false),
    MessageModel(
        message: "hi keo",
        sender: "202",
        receiver: "201",
        messageId: "12312311",
        timestamp: DateTime(2023, 22, 8),
        isSeenByReceiver: false),
    MessageModel(
        message: "hi keo",
        sender: "201",
        receiver: "202",
        messageId: "12312311",
        timestamp: DateTime(2000),
        isSeenByReceiver: false),
    MessageModel(
        message: "hi keo",
        sender: "201",
        receiver: "202",
        messageId: "12312311",
        timestamp: DateTime(2000),
        isSeenByReceiver: false,
        isImage: true),
    MessageModel(
        message: "hi keo",
        sender: "201",
        receiver: "202",
        messageId: "12312311",
        timestamp: DateTime(2024, 23, 8),
        isSeenByReceiver: false),
    MessageModel(
        message: "hi keo",
        sender: "202",
        receiver: "201",
        messageId: "12312311",
        timestamp: DateTime(2023, 22, 8),
        isSeenByReceiver: true),
    MessageModel(
        message: "hi keo",
        sender: "201",
        receiver: "202",
        messageId: "12312311",
        timestamp: DateTime(2000),
        isSeenByReceiver: false),
    MessageModel(
        message: "hi keo",
        sender: "201",
        receiver: "202",
        messageId: "12312311",
        timestamp: DateTime(2000),
        isSeenByReceiver: false,
        isImage: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(AppImages.avatar2,
                    height: 40, width: 40, fit: BoxFit.cover),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sasuke ngu người",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ChatMessage(
                        msg: messages[index],
                        currentUser: "201",
                        isImage: messages[index].isImage ?? false);
                  }),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Type a message..."),
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }
}
