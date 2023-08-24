import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class pembayaran_Detail extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUsers() async* {
    String uid = auth.currentUser!.uid;
    yield* FirebaseFirestore.instance
        .collection('transaksi')
        .doc(uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text("Detail Pembayaran"),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Proses',
            ),
            Tab(
              text: 'Dikirim',
            ),
            Tab(
              text: 'Selesai',
            ),
            Tab(
              text: 'Ditolak',
            ),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String statusPengiriman =
                    snapshot.data!.data()!['Status Pengiriman'];
                return TabBarView(
                  children: [
                    _buildStatusPage(
                        'Proses', statusPengiriman, snapshot.data!.data()!),
                    _buildStatusPage(
                        'Dikirim', statusPengiriman, snapshot.data!.data()!),
                    _buildStatusPage(
                        'Selesai', statusPengiriman, snapshot.data!.data()!),
                    _buildStatusPage(
                        'Ditolak', statusPengiriman, snapshot.data!.data()!),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('Loading...');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatusPage(
      String statusPage, String statusPengiriman, Map<String, dynamic> data) {
    if (statusPengiriman == statusPage) {
      return Container(
        width: Get.width,
        height: 350,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Nama Pembeli: ${data['Nama Pembeli']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Harga Barang: ${data['Nama Barang']}'),
              SizedBox(
                height: 10,
              ),
              Text('Nama Barang: ${data['Harga Barang']}'),
              SizedBox(
                height: 10,
              ),
              Text('Alamat: ${data['Alamat']}'),
              SizedBox(
                height: 10,
              ),
              Text('Waktu: ${data['Rilis'].toDate()}'),
              SizedBox(
                height: 10,
              ),
              Text('Status: ${data['status']}'),
              SizedBox(
                height: 10,
              ),
              Text('Status Pengiriman: ${data['Status Pengiriman']}'),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 100,
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Note",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextField(
                        readOnly: true,
                        decoration: InputDecoration(hintText: 'Note Admin'))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text("Tidak ada barang"),
      ); // Return an empty container if it's not the selected tab.
    }
  }
}
