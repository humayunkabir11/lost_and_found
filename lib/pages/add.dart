import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_and_found/pages/found.dart';
import 'package:lost_and_found/pages/lost.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<AddScreen> {

  final ImagePicker _picker = ImagePicker();

  XFile? image;

  List<XFile>? images;

  fromCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }
  fromgellry() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
  pickmultiImages() async {
    images = await _picker.pickMultiImage();
    setState(() {});
  }

  final lostKey = GlobalKey<FormState>();
  final foundKey = GlobalKey<FormState>();

  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemCategoryController = TextEditingController();
  final TextEditingController itemDescriptionController = TextEditingController();


  final TextEditingController foundItemNameController = TextEditingController();
  final TextEditingController foundItemCategoryController = TextEditingController();
  final TextEditingController foundItemDescriptionController = TextEditingController();

  CollectionReference lostItem = FirebaseFirestore.instance.collection('lost_item');
  CollectionReference foundItem = FirebaseFirestore.instance.collection('found_item');

  Future<void> addLostItem(){
    // Call the user's CollectionReference to add a new user
    return lostItem.add({
      'item_name': itemNameController.text.toString(), // John Doe
      'item_category': itemCategoryController.text.toString(), // Stokes and Sons
      'item_description': itemDescriptionController.text.toString(),
       'lost_item_id': lostItem.id,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  Future<void> addFoundItem() {
    // Call the user's CollectionReference to add a new user
    return foundItem
        .add({
      'item_name': foundItemNameController.text.toString(), // John Doe
      'item_category': foundItemCategoryController.text.toString(), // Stokes and Sons
      'item_description': foundItemDescriptionController.text.toString(),
      'found_item_id' : foundItem.id,


    })

        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;


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
                  child: Column(
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
                        padding: const EdgeInsets.only(left: 10.0, right: 20),
                        child: Form(

                          key: lostKey,
                          child: Column(
                            children: [
                              TextFormField(

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please give right input';
                                  }
                                },
                                style: const TextStyle(
                                    color: Colors.black),
                                controller: itemNameController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Your Item Name',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  focusColor: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 7),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please valid value';
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: itemCategoryController,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                                decoration: const InputDecoration(
                                    hintText: 'Enter the item category',
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    focusColor: Colors.green),
                              ),
                              const SizedBox(height: 7),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please give right input';
                                  }
                                },
                                style: const TextStyle(
                                    color: Colors.black),
                                controller: itemDescriptionController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: 'Inter Description',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  focusColor: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              image == null
                                  ? Container(
                                      height: 100,
                                      width: 100,
                                     decoration: BoxDecoration(
                                       color: Colors.green,
                                       borderRadius: BorderRadius.circular(20)
                                     ),
                                      child:
                                          Center(child: Text("upload picture")),
                                    )
                                  : ClipRRect(
                                      child: Image.file(
                                        File(image!.path),
                                        width: 200,
                                        height: 200,
                                      ),
                                    ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () => fromCamera(),
                                      icon: Icon(Icons.camera_alt)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                      onPressed: () => fromgellry(),
                                      icon: const Icon(Icons.photo_album_outlined))
                                ],
                              ),
                              MaterialButton(
                                onPressed: () async {
                                if(lostKey.currentState!.validate()){
                                    addLostItem();
                                           try {
                                    // show the loading indicator
                                      File imageFile = File(image!.path);
                                     // upload to stroage
                                      UploadTask _uploadTask = storage
                                     .ref('images')
                                        .child(image!.name)
                                           .putFile(imageFile);
                                      TaskSnapshot snapshot = await _uploadTask;
                                      // get the image download link
                                      var imageUrl = await snapshot.ref.getDownloadURL();
                                      // store the image & name to our database
                                      firestore.collection('languages').add(
                                        {
                                          'icon': imageUrl,
                                        },
                                      ).whenComplete(
                                            () {
                                          // after adding data to the database
                                          image = null;
                                          Navigator.of(context)
                                            ..pop()
                                            ..pop();
                                        },
                                      );
                                    } catch (e) {
                                      // if try block doesn't work
                                      print(e);
                                      Navigator.of(context)
                                        ..pop()
                                        ..pop();
                                    }

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
                  ),
                ),
                SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Found Dashboard",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: foundKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please give right input';
                                }
                              },
                              style:
                                  const TextStyle(color: Colors.black),
                              controller: foundItemNameController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: 'Enter Your Item Name',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                focusColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 7),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                   return 'please valid value';
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: foundItemCategoryController,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                              decoration: const InputDecoration(
                                  hintText: 'Enter the item category',
                                  hintStyle:
                                      TextStyle(color: Colors.black, fontSize: 15),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusColor: Colors.green),
                            ),
                            const SizedBox(height: 7),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please give right input';
                                }
                              },
                              style:
                                  const TextStyle(color: Colors.black),
                              controller: foundItemDescriptionController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: 'Inter Description',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                focusColor: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            image == null
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                        child: Text("upload picture")),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(image!.path),
                                      width: 200,
                                      height: 200,
                                    )),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () => fromCamera(),
                                    icon: Icon(Icons.camera)),
                                const SizedBox(
                                  width: 30,
                                ),
                                IconButton(
                                    onPressed: () => fromgellry(),
                                    icon: Icon(Icons.photo_album))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () {
                                if(foundKey.currentState!.validate()){
                                  addFoundItem();
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>FoundScreen()));
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
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
  //image picker function

}


