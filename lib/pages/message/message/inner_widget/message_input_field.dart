import 'package:flutter/material.dart';


class MessageInputField extends StatelessWidget {

  final TextEditingController controller;
  final VoidCallback onTap;

  const MessageInputField({super.key, required this.controller, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
        color: Colors.white,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black38),
                  color: Colors.white
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: controller,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: 'Type message',
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send,size: 30,color: Colors.black,),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}