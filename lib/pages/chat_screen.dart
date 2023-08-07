import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(
             height: 60,
             width: 180,
             child: Card(
               elevation: 8,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.person_2_rounded),
                   SizedBox(width: 25),
                   Text("hello"),
                 ],
               ),
             ),
           ),
           Align(
             alignment: Alignment.centerRight,
             child: SizedBox(
               height: 60,
               width: 180,
               child: Card(
                 elevation: 8,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("hi"),
                     SizedBox(width: 25),
                     Icon(Icons.person_2_rounded),
                   ],
                 ),
               ),
             ),
           ),
           SizedBox(
             height: 60,
             width: 180,
             child: Card(
               elevation: 8,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.person_2_rounded),
                   SizedBox(width: 25),
                   Text("I lost my pet"),
                 ],
               ),
             ),
           ),
           Align(
             alignment: Alignment.centerRight,
             child: SizedBox(
               height: 60,
               width: 200,
               child: Card(
                 elevation: 8,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("yes we have found"),
                     SizedBox(width: 25),
                     Icon(Icons.person_2_rounded),
                   ],
                 ),
               ),
             ),
           ),
          ],
        ),

      ),
    );
  }
}
