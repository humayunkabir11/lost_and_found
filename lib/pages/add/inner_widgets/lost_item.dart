import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_and_found/model/lost_item_model.dart';
import 'package:lost_and_found/pages/add/add_screen.dart';
import 'package:lost_and_found/pages/lost_ screen.dart';

class LostItem extends StatefulWidget {
  const LostItem({super.key});

  @override
  State<LostItem> createState() => _LostItemState();
}

class _LostItemState extends State<LostItem> {
  
  final lostKey = GlobalKey<FormState>();
  
  final TextEditingController lostItemNameController = TextEditingController();
  final TextEditingController lostItemCategoryController = TextEditingController();
  final TextEditingController lostItemDescriptionController = TextEditingController();

  final auth = FirebaseAuth.instance;

  postDetailsToFireStore() async{

    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

    User? user = auth.currentUser;
    LostItemModel lostItemModel = LostItemModel();


    if(lostKey.currentState!.validate()){

      lostItemModel.lostItemName = lostItemNameController.text.toString();
      lostItemModel.lostItemCategory = lostItemCategoryController.text.toString();
      lostItemModel.lostIemDescription = lostItemDescriptionController.text.toString();

      if (imageFile != null) {
        Reference storageReference = FirebaseStorage.instance.ref().child('lost_images/${user!.uid}');
        TaskSnapshot uploadTask = await storageReference.putFile(File(imageFile!.path));
        imageUrl = await uploadTask.ref.getDownloadURL();
      }

      lostItemModel.LostimageUrls = imageUrl;

      await firebaseFireStore.collection("users").doc(user?.uid).set(lostItemModel.toMap());

      Navigator.push(context, MaterialPageRoute(builder: (_) => AddScreen()));
    }

  }

  File? imageFile;
  final imagePicker = ImagePicker();
  String? imageUrl;

  void openGallery(BuildContext context) async{

    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 120,
        maxWidth: 120
    );

    setState(() {
      if(pickedFile != null)
      {
        imageFile = File(pickedFile.path);
      }
    });
  }

  void openCamera(BuildContext context)  async{

    final pickedFile = await ImagePicker().pickImage(

        source: ImageSource.camera,
        maxHeight: 120,
        maxWidth: 120
    );
    setState(() {

      if(pickedFile != null)
      {
        imageFile = File(pickedFile.path);
      }
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Lost Dashborad",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Form(
            key: lostKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'please give right input';
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  controller: lostItemNameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'Your Name',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 15),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)

                    ),
                    focusColor: Colors.white,

                  ),

                ),
                const SizedBox(height: 7),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'please give right input';
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  controller: lostItemCategoryController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'Your Name',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 15),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)

                    ),
                    focusColor: Colors.white,

                  ),

                ),
                const SizedBox(height: 7),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'please give right input';
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  controller: lostItemDescriptionController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'Your Name',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 15),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)

                    ),
                    focusColor: Colors.white,

                  ),

                ),
                const SizedBox(
                  height: 10,
                ),
                imageFile == null ?
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(child: Text("upload picture")),
                ):
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:Image.file(File(imageFile!.path),height: 80,width: 80,)
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: ()=>openCamera(context), icon: const Icon(Icons.camera)),
                    const SizedBox(width: 20,),
                    IconButton(onPressed: ()=>openGallery(context), icon: const Icon(Icons.photo_album_outlined))
                  ],
                ),
                MaterialButton(
                  onPressed: () async {
                    if(lostKey.currentState!.validate()){
                      
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>  const LostScreen() ));

                    }
                  },
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.green, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
