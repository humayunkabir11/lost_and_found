

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class LostScreen extends StatefulWidget {
  const LostScreen({Key? key}) : super(key: key);

  @override
  State<LostScreen> createState() => _HumaState();
}

class _HumaState extends State<LostScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Lost Dashboard"),
        ),
        body:   Column(children: [
             Card(
               child: Row(
                 children: [
                   Expanded(
                       child: Container(
                         height: 200,
                         width: 200,
                         decoration: BoxDecoration(
                             color: Colors.grey,
                             borderRadius: BorderRadius.circular(20)
                         ),
                         child: Image.asset("images/img.png",width: 180,height: 180,),

                       )),


                   Expanded(child: Column(children: [

                     Text("Product Name"),
                     Text("category"),
                     Text("Description"),
                     Text("Time"),

                   ],))
                 ],
               ),
             )


        ],)
    );
  }
}
