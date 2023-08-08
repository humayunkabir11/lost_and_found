
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_and_found/auth/sign_in.dart';
import 'package:lost_and_found/pages/add.dart';

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

    await firebaseFireStore.collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Navigator.push(context, MaterialPageRoute(builder: (_) => AddScreen()));
  }

  final globalKeyForm = GlobalKey<FormState>();
  bool _obscureText = true;
  final ImagePicker _picker = ImagePicker();

  XFile? image;

  List<XFile>? images;

  fromCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {

    });
  }

  fromgellry() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  pickmultiImages() async {
    images = await _picker.pickMultiImage();
    setState(() {

    });

  }


  fromGellary () async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
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
                  RichText(
                    text: const TextSpan(
                        children: [
                          TextSpan(text: 'Please Fill-Up the ',style: TextStyle
                            (color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 20),),
                          TextSpan(text: 'Form',style: TextStyle
                            (color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20)
                          ),

                        ]
                    ),
                  ),
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
                            if(value!.isEmpty||value.length<6){
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
                        image ==null?
                            Container(
                              child: Center(child: Text("upload picture")),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ):
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:Image.file(File(image!.path),height: 80,width: 80,)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: ()=>fromCamera(), icon: Icon(Icons.camera)),
                            SizedBox(width: 20,),
                            IconButton(onPressed: ()=>fromCamera(), icon: Icon(Icons.photo_album_outlined))
                          ],),
                        MaterialButton(onPressed: (){
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

class UserModel{

  String? uid;
  String? name;
  String? phoneNumber;
  String? email;
  String? address;

  UserModel({this.uid, this.name, this.phoneNumber, this.email, this.address});

  // receive data from server
  factory UserModel.fromMap(map)
  {
    return UserModel(

        uid: map['uid'],
        name: map['name'],
        phoneNumber: map['phoneNumber'],
        email: map['email'],
        address: map['address']
    );
  }

  // sending data to server
  Map<String, dynamic> toMap()
  {
    return {

      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
    };
  }
}

