import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/controller/controllerpenjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/Detailpenjualan.dart';

class Checkout extends GetView<controllermarket> {
  final int index = Get.arguments;
  final firebase = Get.find<Homecontroller>();
  final checkout = Get.find<Authcontroller>();
  var addsemua = 0.obs;

  @override
  Widget build(BuildContext context) {
    final Harga = controller.listdata[index]["Harga_brg"];
    final berat = controller.listdata[index]["berat"];
    var Hargatotal = 0.obs;
    int hargaBarang = int.parse(Harga.toString());
    int beratbarang = int.parse(berat.toString());

    var Subtotal = 0.obs;

    int allharga = int.parse(Hargatotal.toString());

    void tes() {
      Hargatotal.value = controller.itemCount.value * hargaBarang;
      Subtotal.value = allharga + 30000;
      addsemua.value = Hargatotal.value + Subtotal.value * beratbarang;
      FirebaseFirestore.instance
          .collection('transaksi')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'Nama Barang': addsemua.value,
      });
    }

    Future<void> _delayedFunction() async {
      await Future.delayed(Duration(seconds: 1));
      tes();
    }

    return Scaffold(
      backgroundColor: Color(0xffF0E5E5),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff35BCAC),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Checkout'),
      ),
      body: StreamBuilder(
        stream: firebase.strembldr(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox();
          } else {
            return ListView(
              children: [
                Container(
                  height: 150,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${FirebaseAuth.instance.currentUser!.email} | ${snapshot.data!.data()!["phoneNumber"]}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Alamat : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${snapshot.data!.data()!["Alamat"]}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  height: 200,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pesan"),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("jumlah"),
                            Text("${controller.itemCount.value.toString()}")
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Harga PerItem",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                "Rp. ${controller.listdata[index]["Harga_brg"]}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Berat Barang",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("${controller.listdata[index]["berat"]}KG",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 39,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  height: 200,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.sticky_note_2,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Rincian Pembayaran")
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal untuk produk"),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(() => Text("Rp.${Hargatotal}",
                                style: TextStyle(fontWeight: FontWeight.bold)))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal untuk pengiriman"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Rp.30.000",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            FutureBuilder(
                              future: _delayedFunction(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white,elevation: 0),
                                    onPressed: tes,
                                    child: Text(""),
                                  );
                                } else {
                                  return CircularProgressIndicator(); // Tampilkan indikator loading jika masih menunggu
                                }
                              },
                            ),

                           
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(color: Colors.white),
        child: InkWell(
          onTap: () {
            tes();
            Get.toNamed('/rincian-penjualan', arguments: index);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Pembayaran"),
                  SizedBox(
                    height: 5,
                  ),
                  Obx(() => Text("Rp. ${addsemua.value}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.redAccent)))
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: Color.fromARGB(255, 172, 74, 74),
                height: 60,
                width: 100,
                child: Center(
                    child: Text(
                  "Pesan",
                  style: TextStyle(color: Colors.white),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
