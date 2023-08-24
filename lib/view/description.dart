// import 'dart:math';
// import 'package:get/get.dart';
// import 'package:jobstreet/controller/controller.dart';
// import 'package:flutter/material.dart';


// class Descriptionview extends GetView<controllertour> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             Container(
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(20)),
//               child: Stack(
//                 children: [
//                   const Icon(Icons.arrow_back_ios),
//                   Image.network(
//                       'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Hopetoun_falls.jpg/1200px-Hopetoun_falls.jpg')
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       const Text(
//                         'Santornia Island',
//                         style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       const Icon(Icons.account_balance)
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text('Rating Tempat'),
//                    const SizedBox(
//                     height:  10,
//                   ),
// Row(
//   children: [
        
//          Icon(Icons.star_border),SizedBox(width: 5,),
//           Icon(Icons.star_border),SizedBox(width: 5,), Icon(Icons.star_border),SizedBox(width: 5,), Icon(Icons.star_border),SizedBox(width: 5,), Icon(Icons.star_border),SizedBox(width: 10,)
//   ],
// ),

//                   const SizedBox(
//                     height: 15,
//                   ),
//                   SizedBox(
//                     height: 100,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 5,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           margin: const EdgeInsets.only(left: 10),
//                           height: 50,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             color: Colors.primaries[
//                                 Random().nextInt(Colors.primaries.length)],
//                           ),
//                           child: const Icon(Icons.add_a_photo_sharp),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.all(3.0),
//                     child: Text(
//                         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,'),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 20),
//                     height: 20,
//                     width: 100,
//                     child: TextField(
//                       controller: controller.reportC,
//                       decoration: InputDecoration(hintText: 'Report'),
//                     ),
//                   ),
//                   ElevatedButton(
//                       onPressed: () => controller.add(controller.reportC.text),
//                       child: Text('Kirim'),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.amber)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
