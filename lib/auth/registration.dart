
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_and_found/auth/sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin{
  late TextEditingController _nameController = TextEditingController(text: '');
  late TextEditingController _numberController = TextEditingController(text: '');
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passWordController = TextEditingController(text: '');
  late TextEditingController _degingnationController = TextEditingController(text: '');
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

  void _formValidKey(){
    final isValid = globalKeyForm.currentState!.validate();
    print('valid $isValid');
  }
  @override
  Widget build(BuildContext con) {
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
                          style: const TextStyle(color: Colors.lightGreenAccent),
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: 'Your Name',
                            hintStyle: TextStyle(color: Colors.redAccent,fontSize: 15),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)

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
                          style: const TextStyle(color: Colors.lightGreenAccent),
                          controller: _numberController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Your Number',
                            hintStyle: TextStyle(color: Colors.redAccent,fontSize: 15),
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
                            if(value!.isEmpty||value.contains('@')){
                              return 'please valid value';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          style:const TextStyle(color: Colors.lightGreenAccent,fontSize: 15),
                          decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.redAccent,fontSize: 15),
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
                            if(value!.isEmpty||value.length<10){
                              return 'please valid value';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _passWordController,
                          style:const TextStyle(color: Colors.lightGreenAccent,fontSize: 15),
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
                              hintStyle: const TextStyle(color: Colors.red,fontSize: 15),
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
                          controller: _degingnationController,
                          style:const TextStyle(color: Colors.lightGreenAccent,fontSize: 15),
                          decoration: const InputDecoration(
                              hintText: 'Adress',
                              hintStyle: TextStyle(color: Colors.red,fontSize: 15),
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
                              color: Colors.green,
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
                          _formValidKey();
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>LogIn()));

                        },
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.login,color: Colors.green,),
                                const SizedBox(width: 6,),
                                const Text('SignUp',style: TextStyle(color: Colors.green,fontSize: 15),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        RichText(
                          text: const TextSpan(
                              children: [
                                TextSpan(text: 'Already Hava an Account?    ',style: TextStyle
                                  (color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 20),),
                                TextSpan(
                                    text: 'SignIn',style: TextStyle
                                  (color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20)
                                ),

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

