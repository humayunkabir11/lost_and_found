
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_and_found/model/user_model.dart';
import 'package:lost_and_found/pages/add/add_screen.dart';
import 'package:lost_and_found/pages/bottom_nav_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin{

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final auth = FirebaseAuth.instance;

  void registerUser({required String email, required String password}) async {

    if(globalKeyForm.currentState!.validate()) {
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) => {
        postDetailsToFireStore()
      }).catchError((e){
       print(e);
      });
    }
  }

  postDetailsToFireStore() async{

    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

    User? user = auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = _nameController.text.toString();
    userModel.phoneNumber = _numberController.text.toString();
    userModel.address = _addressController.text.toString();

    if (imageFile != null) {
      Reference storageReference = FirebaseStorage.instance.ref().child('profile_images/${user!.uid}');
      TaskSnapshot uploadTask = await storageReference.putFile(File(imageFile!.path));
      imageUrl = await uploadTask.ref.getDownloadURL();
    }

    userModel.imageSrc = imageUrl;

    await firebaseFireStore.collection("users").doc(user.uid).set(userModel.toMap());

    Navigator.push(context, MaterialPageRoute(builder: (_) => const AddScreen()));

  }

  final globalKeyForm = GlobalKey<FormState>();

  bool _obscureText = true;

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

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  SizedBox(height: size.height*0.1,),
              const Text("Registration Here",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                  const Divider(height: 2,color: Colors.grey,),
                  const SizedBox(height: 7,),
                  Form(
                    key: globalKeyForm,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please give right input';
                            }
                          },
                          style: const TextStyle(color: Colors.black),
                          controller: _nameController,
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
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please give right input';
                            }
                          },
                          style: const TextStyle(color: Colors.black),
                          controller: _numberController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Your Number',
                            hintStyle: TextStyle(color: Colors.black,fontSize: 15),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)

                            ),
                            focusColor: Colors.white,

                          ),

                        ),

                        const SizedBox(height: 7,),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please valid value';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          style:const TextStyle(color: Colors.black,fontSize: 15),
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.black,fontSize: 15),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red
                                ),
                              ),
                              focusColor: Colors.green
                          ),
                        ),
                        const SizedBox(height: 7,),
                        TextFormField(
                          obscureText: _obscureText,
                          validator: (value){
                            if(value!.isEmpty || value.length<4){
                              return 'please valid value';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _passWordController,
                          style:const TextStyle(color: Colors.black,fontSize: 15),
                          decoration: InputDecoration(
                              hintText: 'password',
                              suffixIcon: IconButton(onPressed: (){
                                setState(() {
                                  _obscureText=!_obscureText;
                                });
                              },
                                icon: Icon(
                                  _obscureText?Icons.visibility_off:Icons.visibility,color: Colors.green,
                                ),
                              ),
                              hintStyle: const TextStyle(color: Colors.black,fontSize: 15),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green
                                ),
                              ),
                              errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red
                                ),
                              ),
                              focusColor: Colors.green
                          ),
                        ),
                        const SizedBox(height: 7,),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please valid value';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _addressController,
                          style:const TextStyle(color: Colors.black,fontSize: 15),
                          decoration: const InputDecoration(
                              hintText: 'Address',
                              hintStyle: TextStyle(color: Colors.black,fontSize: 15),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red
                                ),
                              ),
                              focusColor: Colors.green
                          ),
                        ),
                        const SizedBox(height: 20,),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: ()=>openCamera(context), icon: const Icon(Icons.camera,color: Colors.green,)),
                            const SizedBox(width: 20,),
                            IconButton(onPressed: ()=>openGallery(context), icon: const Icon(Icons.photo_album_outlined,color: Colors.green,))
                          ],
                        ),
                        MaterialButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const BottomNavBar()));
                          registerUser(email: _emailController.text, password: _passWordController.text);

                        },
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.login,color: Colors.green,),
                                SizedBox(width: 6,),
                                Text('SignUp',style: TextStyle(color: Colors.green,fontSize: 15),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        RichText(
                          text: const TextSpan(
                              children: [
                                TextSpan(text: 'Already Hava an Account',style: TextStyle
                                  (color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 20),),

                              ]
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        )

    );
  }
}



