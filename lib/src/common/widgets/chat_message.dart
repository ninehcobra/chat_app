import 'package:chat_app/src/core/util/format_date.dart';
import 'package:chat_app/src/data/models/message.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatefulWidget {
  final MessageModel msg;
  final String currentUser;
  final bool isImage;

  const ChatMessage(
      {super.key,
      required this.msg,
      required this.currentUser,
      required this.isImage});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: widget.msg.sender == widget.currentUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: widget.msg.sender == widget.currentUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: widget.msg.sender == widget.currentUser
                          ? const Color(0xFF0A83F9)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                          bottomLeft: widget.msg.sender != widget.currentUser
                              ? const Radius.circular(2)
                              : const Radius.circular(20),
                          bottomRight: widget.msg.sender == widget.currentUser
                              ? const Radius.circular(2)
                              : const Radius.circular(20),
                          topLeft: const Radius.circular(20),
                          topRight: const Radius.circular(20)),
                    ),
                    child: Text(
                      widget.msg.message,
                      style: TextStyle(
                          color: widget.msg.sender == widget.currentUser
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      child: Text(
                        (formatDate(widget.msg.timestamp)),
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.outline),
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
