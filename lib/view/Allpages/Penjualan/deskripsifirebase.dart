// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import 'package:jobstreet/Model/productmodel.dart';
// import 'package:jobstreet/controller/controllerpenjualan.dart';
// import 'package:jobstreet/view/ViewAuth/Component/detailloading.dart';


// class firebaseDetailbarang extends StatefulWidget {
  


//   @override
//   State<firebaseDetailbarang> createState() => _DetailbarangState();
// }

// class _DetailbarangState extends State<firebaseDetailbarang> {
  

//   _DetailbarangState();

//   Stream<DocumentSnapshot> stokbarang() {
//     return FirebaseFirestore.instance
//         .collection("Stokbarang")
//         .doc()
//         .snapshots();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff35BCAC),
//         leading: IconButton(
//           onPressed: () => Get.back(),
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: stokbarang(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             Map<String, dynamic>? data = snapshot.data!.data() as Map<String, dynamic>?;
//             if (data != null) {
//               String imageUrl = data['image_brg'];
//               String namabarang = data['Nama_brg'];
//               String harga = data['Harga_brg'].toString();
//               String deskripsi = data['Deskripsi'];

//               return ListView(
//                 children: [
//                   Container(
//                     height: 197,
//                     width: 360,
//                     child: ClipRRect(
//                       child: Image.network(
//                         imageUrl,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(18),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 13,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               namabarang,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               "Rp. $harga",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Text(
//                           deskripsi,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w300,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             } else {
//               return Center(
//                 child: Text('Item not found.'),
//               );
//             }
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color(0xffFF5C5C),
//         onPressed: () {
//           Get.toNamed('/chat-admin');
//         },
//         child: Icon(Icons.chat),
//       ),
//       bottomNavigationBar: Container(
//         height: 60,
//         width: 100,
//         decoration: BoxDecoration(color: Color(0xff5B7D69)),
//         child: InkWell(
//           onTap: () => Get.toNamed('/checkout1-penjualan'),
//           child: Center(
//             child: Text(
//               "Check-out",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }