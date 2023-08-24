import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/controlleradmin/controllerpemesananbrg.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/view/Allpages/Reservasi_view.dart';

class pemesanan extends GetView<Reservasi_view> {
  Stream<QuerySnapshot> getUsers() {
    return FirebaseFirestore.instance.collection("transaksi").snapshots();
  }

  final Homectrller = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    Future<void> Postmotor(String documentId) async {
      Get.defaultDialog(middleText: "Update Berhasil");

      // Fetch all documents from the "reservasi" collection
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('transaksi').get();

      // Update each document in the collection
      WriteBatch batch = FirebaseFirestore.instance.batch();
      snapshot.docs.forEach((doc) {
        batch.update(doc.reference, {
          'status': Homectrller.selectedOption.value,
        });
      });

      // Commit the batch update
      await batch.commit();
    }

    Future<void> StatusPembayaran() async {
      Get.defaultDialog(middleText: "Update status Berhasil");

      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('transaksi').get();

      // Update each document in the collection
      WriteBatch batch = FirebaseFirestore.instance.batch();
      snapshot.docs.forEach((doc) {
        batch.update(doc.reference,
            {'Status Pengiriman': Homectrller.statuspengiriman.value});
      });

      // Commit the batch update
      await batch.commit();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pemesanan barang"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              // List<String> emails = snapshot.data!.docs
              //     .map((doc) => doc['email'] as String)
              //     .toList();

              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  // Access data from each document
                  DocumentSnapshot document = documents[index];
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  if (data.containsKey('Nama Pembeli') &&
                      data.containsKey('Alamat') &&
                      data.containsKey('Harga Barang') &&
                      data.containsKey('Nama Barang') &&
                      data.containsKey('Nohp') &&
                      data.containsKey('Rilis') &&
                      data.containsKey('Status_User') &&
                      data.containsKey('stok') &&
                      data.containsKey('Status Pengiriman') &&
                      data.containsKey('status')) {
                    // DateTime jamrilis = data['date'];
                    String NamaPembeli = data['Nama Pembeli'];
                    String harga = data['Nama Barang'].toString();
                    String statuspengirim = data['Status Pengiriman'];
                    String namabarang = data['Harga Barang'];
                    DateTime Rilis = data['Rilis'].toDate();
                    String alamat = data['Alamat'];
                    String nohp = data['Nohp'];
                    String statususer = data['Status_User'];
                    int stok = data['stok'];
                    String status = data['status'];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Email: $NamaPembeli',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            Text('Nama Barang: $namabarang || x$stok item'),
                            const SizedBox(height: 15),
                            Text('Harga Barang: Rp.$harga'),
                            const SizedBox(height: 15),
                            // Text('Waktu Pemesanan: $Rilis'),
                            Text('Nomor Hp: $nohp'),
                            const SizedBox(height: 15),
                            Text('Status User: $statususer'),
                            const SizedBox(height: 15),
                            Text('Status Pembayaran: $status'),
                            const SizedBox(height: 15),
                            Text('Tgl/Jam pembelian: $Rilis'),
                            const SizedBox(height: 15),
                            ElevatedButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: '',
                                      content: Column(
                                        children: [
                                          Container(
                                              height: 500,
                                              width: 400,
                                              color: Colors.amber,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    "assets/images/bristruk.jpg",
                                                    fit: BoxFit.cover,
                                                  )))
                                        ],
                                      ));
                                },
                                child: Text("Detail-screenshot")),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => DropdownButton(
                                  isExpanded: true,
                                  hint: const Text('Pilih status'),
                                  value: Homectrller.items.contains(
                                          Homectrller.selectedOption.value)
                                      ? Homectrller.selectedOption.value
                                      : null,
                                  onChanged: (newValue) {
                                    Homectrller.selectedOption.value =
                                        newValue!;
                                  },
                                  items: Homectrller.items.map((option) {
                                    return DropdownMenuItem(
                                      child: Text(option),
                                      value: option,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => DropdownButton(
                                  isExpanded: true,
                                  hint: const Text('Pilihstatus'),
                                  value: Homectrller.statuspengirim.contains(
                                          Homectrller.statuspengiriman.value)
                                      ? Homectrller.statuspengiriman.value
                                      : null,
                                  onChanged: (newValue) {
                                    Homectrller.statuspengiriman.value =
                                        newValue!;
                                  },
                                  items:
                                      Homectrller.statuspengirim.map((option) {
                                    return DropdownMenuItem(
                                      child: Text(option),
                                      value: option,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Text('status: $status'),
                            SizedBox(
                              height: 5,
                            ),
                            Text("status Pengiriman: $statuspengirim"),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: () => Postmotor(document.id),
                              child: const Text("Update status"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: () => StatusPembayaran(),
                              child: const Text("Update status pengiriman"),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(); // Skip rendering if required fields are missing
                  }
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
