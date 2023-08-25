// import 'package:flutter/material.dart';
// import 'package:lost_and_found/wigdets/text_form_field/custom_text_field.dart';
//
// class FoundItem extends StatefulWidget {
//   const FoundItem({super.key});
//
//   @override
//   State<FoundItem> createState() => _FoundItemState();
// }
//
// class _FoundItemState extends State<FoundItem> {
//
//   final foundKey = GlobalKey<FormState>();
//
//   final TextEditingController foundItemNameController = TextEditingController();
//   final TextEditingController foundItemCategoryController = TextEditingController();
//   final TextEditingController foundItemDescriptionController = TextEditingController();
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Column(
//         children: [
//       const SizedBox(
//         height: 20,
//       ),
//       const Text(
//         "Found Dashboard",
//         style: TextStyle(
//           color: Colors.green,
//           fontSize: 20,
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 20.0, right: 20),
//               child: Form(
//                 key: foundKey,
//                 child: Column(
//                   children: [
//                     const CustomTextField(
//                       hintText: "Item Name",
//                     ),
//                     const SizedBox(height: 7),
//                     const CustomTextField(
//                       hintText: "Item Category",
//                     ),
//                     const SizedBox(height: 7),
//                     const CustomTextField(
//                       hintText: "Description",
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     image == null
//                         ? Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       child:
//                       Center(child: Text("upload picture")),
//                     )
//                         : ClipRRect(
//                       child: Image.file(
//                         File(image!.path),
//                         width: 200,
//                         height: 200,
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                             onPressed: () => fromCamera(),
//                             icon: Icon(Icons.camera_alt)),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         IconButton(
//                             onPressed: () => fromgellry(),
//                             icon: const Icon(Icons.photo_album_outlined))
//                       ],
//                     ),
//                     MaterialButton(
//                       onPressed: () async {
//                         if(lostKey.currentState!.validate()){
//                           addLostItem();
//                           Navigator.push(context, MaterialPageRoute(builder: (_)=>  const LostScreen() ));
//                         }
//                       },
//                       color: Colors.red,
//                       child: const Padding(
//                         padding: EdgeInsets.all(15.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.login,
//                               color: Colors.green,
//                             ),
//                             SizedBox(
//                               width: 6,
//                             ),
//                             Text(
//                               'Submit',
//                               style: TextStyle(
//                                   color: Colors.green, fontSize: 15),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     ]);
//   }
// }
