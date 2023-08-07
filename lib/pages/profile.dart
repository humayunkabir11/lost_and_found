import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profile"),

        ),

        endDrawer: const Drawer(

          elevation: 2,
          width: 220,
          backgroundColor: Colors.grey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("LOST AND FOUND",style: TextStyle(color: Colors.indigoAccent ,fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                SizedBox(
                  height: 70,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.black,

                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.person),
                        Text("Profile")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.black,

                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Icon(Icons.interpreter_mode_sharp),
                        Text("My Items")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.black,

                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Icon(Icons.chat),
                        Text("Chatting")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.black,

                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.logout),
                        Text("Log Out")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );




  }
}

