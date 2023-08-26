import 'package:flutter/material.dart';

import 'package:lost_and_found/pages/add/inner_widgets/found_item.dart';
import 'package:lost_and_found/pages/add/inner_widgets/lost_item.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

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
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: const Text("Lost And Found Dashboard"),
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
                  child: FoundItem(),
                ),
              ],
            ),
          ),
        ));
  }
}
