
import 'package:flutter/material.dart';
import 'package:lost_and_found/auth/registration.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<LogIn> with SingleTickerProviderStateMixin{


  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passWordController = TextEditingController(text: '');

  final globalKeyForm = GlobalKey<FormState>();
  bool _obscureText = true;

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
                          TextSpan(text: 'LOST AND FOUND ',style: TextStyle
                            (color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 20),),

                        ]
                    ),
                  ),
                  const SizedBox(height: 7,),
                  Form(
                    key: globalKeyForm,
                    child: Column(
                      children: [



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

                        const SizedBox(height: 20,),
                        MaterialButton(onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (_)=>SignInPage()));
                          _formValidKey();


                        },
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.login,color: Colors.green,),
                                const SizedBox(width: 6,),
                                const Text('SignIn',style: TextStyle(color: Colors.green,fontSize: 15),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        RichText(
                          text: const TextSpan(
                              children: [
                                TextSpan(text: "Don't Hava an Account?",style: TextStyle
                                  (color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 20),),
                                TextSpan(text: 'Sign Up',style: TextStyle
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

