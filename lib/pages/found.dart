import 'package:flutter/material.dart';

class FoundScreen extends StatefulWidget {
  const FoundScreen({super.key});

  @override
  State<FoundScreen> createState() => _FoundScreenState();
}

class _FoundScreenState extends State<FoundScreen> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Found Dashboard"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                     shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount:  6,
                    itemBuilder: (context, index){
                  return  Card(
                    elevation: 10,
                    child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Image.asset("images/img.png",width: 180,height: 180,),

                              )),
                          SizedBox(width: 20,),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Name :"),
                              SizedBox(height: 6,),
                              Text("Category:"),
                              SizedBox(height: 6,),
                              Text("Adress :"),
                              SizedBox(height: 6,),
                              Text("Description :"),
                            ],))
                        ]
                    ),
                  );
                }),

              ],
            ),
          ),
        )
      ),
    );
  }
}
