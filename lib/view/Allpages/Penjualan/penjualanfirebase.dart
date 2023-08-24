import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/controlleradmin/controllerfirebasepenjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/testadmin.dart';

class firebasepenjualan extends GetView<firebasetest> {
  const firebasepenjualan({super.key});
  Stream<QuerySnapshot> stokbarang() {
    return FirebaseFirestore.instance.collection("Stokbarang").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suku Cadang"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed('/firebase'), icon: Icon(Icons.abc))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: stokbarang(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              // List<String> emails = snapshot.data!.docs
              //     .map((doc) => doc['email'] as String)
              //     .toList();
              return SizedBox(
                height: Get.height,
                child: GridView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    // Access data from each document
                    DocumentSnapshot document = documents[index];
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    String deskripsi = data['Deskripsi'];
                    String Harga = data['Harga_brg'].toString();

                    String image = data['image_brg'];
                    String namabarang = data['Nama_brg'];

                    return InkWell(
                      onTap: () => Get.toNamed(
                        '/firebase-detail-barang',
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 4,
                                                offset: Offset(
                                                    2, 4), // Shadow position
                                              ),
                                            ]),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      color: Colors.green),
                                                  child: ClipRRect(
                                                    child: Image.network(
                                                      "$image",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "$namabarang",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                          height: 3,
                                                        ),
                                                        Text("$Harga"),
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                            "${data['Jam_rilis'].toDate()}"),
                                                      ]))
                                            ]))
                                  ]))),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.2,
                    crossAxisCount: 2,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Loading...');
            }
          },
        ),
      ),
    );
    // return Scaffold(
    //   body: ListView(
    //     children: [
    //       StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
    //         stream: controller.strembldr(),
    //         builder: (context, snapshot) {
    //           List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
    //           if (snapshot.connectionState == ConnectionState.waiting) {
    //             return SizedBox();
    //           } else {
    //             return SizedBox(
    //               height: 1000,
    //               child: ListView.builder(
    //                 itemCount: 1,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return Container(
    //                     child: Text(snapshot.data!.data()!['Nama_brg']),
    //                   );
    //                 },
    //               ),
    //             );
    //           }
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
