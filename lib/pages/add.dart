import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_and_found/pages/found_item.dart';
import 'package:lost_and_found/pages/lost_item.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<AddScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text("Lost And Found Dashboard"),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(text: "LOST"),
                  Tab(text: "FOUND"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: LostItem(),
                ),
                SingleChildScrollView(

                ),
              ],
            ),
          ),
        ));
  }
}


