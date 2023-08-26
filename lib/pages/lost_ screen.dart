import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/model/lost_item_model.dart';

class LostScreen extends StatefulWidget {
  const LostScreen({super.key});

  @override
  State<LostScreen> createState() => _LostScreenState();
}

class _LostScreenState extends State<LostScreen> {

  final auth = FirebaseAuth.instance;
  final fireStore  =  FirebaseFirestore.instance;


  LostItemModel currentUser = LostItemModel();
  bool isLoading = false;

  Future<void> getUserInfo() async {

    setState(() {
      isLoading = true;
    });

    User? user = auth.currentUser;

    if(currentUser != null){

      await fireStore.collection("Lost_item").doc(user!.uid).get().then((value) {
        currentUser = LostItemModel.fromMap(value.data());
      });
    }
    else{
      print("No user found");
    }

    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          image: currentUser.LostimageUrls == null ? const AssetImage("images/img.png") : NetworkImage(currentUser.LostimageUrls.toString()) as ImageProvider,
                          fit: BoxFit.cover
                      )
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      currentUser.lostItemName ?? "",style: TextStyle(color: Colors.blue,fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(currentUser.lostItemCategory ?? "",style: TextStyle(color: Colors.blue,fontSize: 18),),
                    const SizedBox(height: 8,),
                    // Text(currentUser.lostDate?? ""),
                    Text(currentUser.lostIemDescription ?? "",),

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}