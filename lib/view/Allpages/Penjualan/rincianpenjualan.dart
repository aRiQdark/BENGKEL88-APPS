import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/controller/controllerpenjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/checkout-penjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/pembayaran.dart';

class rincianpenjualan extends GetView<controllermarket> {
  Stream<DocumentSnapshot<Map<String, dynamic>>> transaksi() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection('transaksi').doc(uid).snapshots();
  }

  final int index = Get.arguments;
  final pembayaran = Get.find<Checkout>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 30, 99),
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: IconButton(
      //       onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new)),
      //   title: Text("Rincian Pesanan"),
      //   centerTitle: true,
      //   backgroundColor: Color.fromARGB(255, 102, 159, 206),
      // ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: transaksi(),
        builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }else{
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 80,
                        ),
                        const Text(
                          "Pembayaran",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ClipRRect(
                    child: Container(
                        height: 150,
                        width: 280,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'assets/images/bri3.png',
                          fit: BoxFit.contain,
                          scale: 10,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: Get.height,
                    width: 420,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nomor Rekening",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text("1234 7843 1236 1256"),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Nama Rekening",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text("Bengkel 88"),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "*jika sudah melakukan transaksi pembayaran \n  mohon untuk mengunggah hasil screenshot pada \n  halaman selanjutnya",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Total pembayaran",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                  child: Text(
                                      "Rp.${snapshot.data!.data()!['Nama Barang']}")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        }
        },
      ),
      bottomNavigationBar: InkWell(
        onTap: () => Get.toNamed('/pembayaran', arguments: index),
        child: Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Center(
            child: Text(
              "Lanjut",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
