import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/auth/signin_screen.dart';
import 'package:lost_and_found/message/message/message_screen.dart';
import 'package:lost_and_found/model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  UserModel currentUser = UserModel();

  bool isLoading = false;

  Future<void> getUserInfo() async {

    setState(() {
      isLoading = true;
    });
    User? user = auth.currentUser;

    if(currentUser != null){

      await fireStore.collection("users").doc(user!.uid).get().then((value) {
        currentUser = UserModel.fromMap(value.data());
      });
    }
    else{
      print("No user found");
    }

    setState(() {
      isLoading = false;
    });
  }

  void accountLogout() async{
    await auth.signOut();
  }
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Profile"),
        ),
        endDrawer:  Drawer(
          elevation: 2,
          width: 220,
          backgroundColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("LOST AND FOUND",style: TextStyle(color: Colors.indigoAccent ,fontSize: 30,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 70,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProfileScreen()));
                    },
                    child: const Card(
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
                ),
                SizedBox(
                  height: 70,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>MessageScreen()));
                    },
                    child: const Card(
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
                ),
                SizedBox(
                  height: 70,
                  child: InkWell(
                    onTap: () {
                      accountLogout();
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const LogIn()));
                    },
                    child: const Card(
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
                ),
              ],
            ),
          ),

        ),
        body: isLoading ? const Center(
          child: CircularProgressIndicator(color: Colors.blue, strokeWidth: 4),
        ) : SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100, width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: currentUser.imageSrc == null ? const AssetImage("images/img.png") : NetworkImage(currentUser.imageSrc.toString()) as ImageProvider,
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentUser.name ?? "",style: const TextStyle(color: Colors.blue,fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(currentUser.email ?? "",style: const TextStyle(color: Colors.blue,fontSize: 18),),
                      const SizedBox(height: 8,),
                      Text(currentUser.address?? ""),
                      Text(currentUser.phoneNumber ?? "",),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
