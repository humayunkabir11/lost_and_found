import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LostScreen extends StatefulWidget {
  const LostScreen({super.key});

  @override
  State<LostScreen> createState() => _LostScreenState();
}

class _LostScreenState extends State<LostScreen> {
  final Stream<QuerySnapshot> lost_itemStream = FirebaseFirestore.instance.collection('lost_item').snapshots();

  final ImagePicker _picker = ImagePicker();


  XFile? image;
  List<XFile>? images;

  fromGallery() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: lost_itemStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Text(data['item_name']),
                  SizedBox(height: 10,),
                  Text(data['item_category']),

                ],
              );
            }).toList(),
          );
        },
      )
    );
  }
}



