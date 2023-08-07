import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<AddScreen> {
  final lostKey = GlobalKey<FormState>();
  final foundKey = GlobalKey<FormState>();
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
                          key: foundKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please give right input';
                                  }
                                },
                                style: const TextStyle(
                                    color: Colors.lightGreenAccent),
                                controller: _nameController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Your Item Name',
                                  hintStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
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
                                controller: _desingnationController,
                                style: const TextStyle(
                                    color: Colors.lightGreenAccent, fontSize: 15),
                                decoration: const InputDecoration(
                                    hintText: 'Enter the item category',
                                    hintStyle: TextStyle(
                                        color: Colors.red, fontSize: 15),
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
                                    color: Colors.lightGreenAccent),
                                controller: _nameController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: 'Inter Description',
                                  hintStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
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
                                      icon: Icon(Icons.camera)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                      onPressed: () => fromCamera(),
                                      icon: Icon(Icons.photo_album_outlined))
                                ],
                              ),
                              MaterialButton(
                                onPressed: () {
                                  _foundValidKey();
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
                                  const TextStyle(color: Colors.lightGreenAccent),
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: 'Enter Your Item Name',
                                hintStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 15),
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
                              controller: _desingnationController,
                              style: const TextStyle(
                                  color: Colors.lightGreenAccent, fontSize: 15),
                              decoration: const InputDecoration(
                                  hintText: 'Enter the item category',
                                  hintStyle:
                                      TextStyle(color: Colors.red, fontSize: 15),
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
                                  const TextStyle(color: Colors.lightGreenAccent),
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: 'Inter Description',
                                hintStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 15),
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
                                _lostValidKey();
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

  late final TextEditingController _nameController = TextEditingController(text: '');

// late TextEditingController _numberController = TextEditingController(text: '');
  late final TextEditingController _desingnationController = TextEditingController(text: '');






  // variabls
  @override
  void _lostValidKey() {
    final isValid = lostKey.currentState!.validate();
    print('valid $isValid');
  }
  void _foundValidKey() {
    final isValid = foundKey.currentState!.validate();
    print('valid $isValid');
  }


  //image picker function
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
}
