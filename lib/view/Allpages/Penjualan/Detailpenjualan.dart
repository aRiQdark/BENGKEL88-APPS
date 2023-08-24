import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jobstreet/Model/productmodel.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/controller/controllerpenjualan.dart';
import 'package:jobstreet/view/ViewAuth/Component/detailloading.dart';

class DetailbarangState extends GetView<controllermarket> {
  final controller = Get.find<controllermarket>();

  var hargaOngkos = 0.obs;
  final int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Harga = controller.listdata[index]["Harga_brg"];
    var Hargatotal = 0.obs;
    int hargaBarang = int.parse(Harga.toString());
    final firebase = Get.find<Homecontroller>();
    var Subtotal = 0.obs;
    var addsemua = 0.obs;
    int allharga = int.parse(Hargatotal.toString());
    var hargaOngkos = 0.obs;

    controller.getdata();
    Get.lazyPut(() => DetailbarangState());

    final berat = controller.listdata[index]["berat"];

    int beratbarang = int.parse(berat.toString());

    void tes() {
      Hargatotal.value = controller.itemCount.value * hargaBarang;
      Subtotal.value = allharga + 30000;
      addsemua.value = Hargatotal.value + Subtotal.value * beratbarang;
      FirebaseFirestore.instance
          .collection('transaksi')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
             'Nama Pembeli': FirebaseAuth.instance.currentUser!.email!,
                 'Nama Barang': addsemua.value,
                'Alamat': "",
                'Harga Barang': "",
                'stok':"",
                'Rilis': "",
                'status': "",
                'Status Pengiriman': "",
                'Status_User': "Sudah melakukan pembayaran",
       
      });
    }

    return StreamBuilder(
      stream: firebase.strembldr(),
      builder: (context, snapshot) {
        return FutureBuilder(
          future: controller.getdata(),
          builder:
              (BuildContext context, AsyncSnapshot<List<product>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: Detailload(),
                ),
              );
            } else if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('error: ${snapshot.error}'),
                ),
              );
            } else {
              final Product = snapshot.data!;
              // final product = controller.listdata[index];

              void hitungHargaOngkos() {
                int hargaBarang = int.parse(Harga.toString());
                final total = controller.itemCount.value * hargaBarang;
                tes();
                hargaOngkos.value = hargaBarang + 30000;
                Get.toNamed('/checkout1-penjualan', arguments: index);
              }

              return SafeArea(
                  child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  leading: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  title: Text(
                    "${controller.listdata[index]["Jdl_brg"]} Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  centerTitle: true,
                  elevation: 0,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          controller.listdata[index]["img"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.listdata[index]["Jdl_brg"],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Harga :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                    "Rp. ${controller.listdata[index]["Harga_brg"]}"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Waktu Rilis :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(controller.listdata[index]["Jam_rilis"]),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${controller.listdata[index]["sisa_stok"] != null ? controller.listdata[index]["sisa_stok"] : '0'} Stok",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text("Status Barang"),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  controller.listdata[index]["status_brg"],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: Get.width,
                      height: 4,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Deskripsi: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: controller.listdata[index]["Deskripsi"],
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]

                      // [
                      //     Container(
                      //       height: 197,
                      //       width: 360,
                      //       child: ClipRRect(
                      //         child: Image.network(
                      //           controller.listdata[index]["img"],
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //         padding:EdgeInsets.all(18),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             const SizedBox(
                      //               height: 13,
                      //             ),
                      //             Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text(
                      //                   controller.listdata[index]["Jdl_brg"],
                      //                   style: TextStyle(fontWeight: FontWeight.bold),
                      //                 ),
                      //                 Text(
                      //                     "Rp. ${controller.listdata[index]["Harga_brg"]}",
                      //                     style: TextStyle(fontWeight: FontWeight.bold)),
                      //               ],
                      //             ),

                      //             // Text("Rp.${product.harga}"),

                      //             const SizedBox(
                      //               height: 15,
                      //             ),
                      //             Text(
                      //               controller.listdata[index]["Deskripsi"],
                      //               style: const TextStyle(fontWeight: FontWeight.w300,color: Colors.black),
                      //             ),
                      //             const SizedBox(
                      //               height: 20,
                      //             ),
                      //           ],
                      //         ))
                      //   ],
                      // ),
                      //   floatingActionButton: FloatingActionButton(backgroundColor: Color(0xffFF5C5C),
                      //     onPressed: () {
                      //       Get.toNamed('/chat-admin');
                      //     },
                      //     child: const Icon(Icons.chat),
                      //   ),
                      //   bottomNavigationBar: Container(
                      //     height: 60,
                      //     width: 100,
                      //     decoration: BoxDecoration(color: Color(0xff5B7D69)),
                      //     child: InkWell(
                      //         onTap: () =>
                      //             Get.toNamed('/checkout1-penjualan', arguments: index),
                      //         child: Center(
                      //             child: Text(
                      //           "Check-out",
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 20,
                      //               fontWeight: FontWeight.bold),
                      //         ))),
                      //   ),
                      // );
                      ),
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Color(0xffFF5C5C),
                  onPressed: () {
                    Get.toNamed('/chat-admin');
                  },
                  child: const Icon(Icons.chat),
                ),
                bottomNavigationBar: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(color: Color(0xff5B7D69)),
                    child: InkWell(
                      onTap: () {
                        if (controller.listdata[index]["sisa_stok"] == "0") {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Stok Habis"),
                                content: Text(
                                    "Maaf, stok untuk item ini telah habis."),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          final Harga = controller.listdata[index]["Harga_brg"];
                          final berat = controller.listdata[index]["berat"];
                          var Hargatotal = 0.obs;
                          int hargaBarang = int.parse(Harga.toString());
                          int beratbarang = int.parse(berat.toString());

                          var Subtotal = 0.obs;

                          int allharga = int.parse(Hargatotal.toString());
                          void tes() {
                            Hargatotal.value =
                                controller.itemCount.value * hargaBarang;
                            Subtotal.value = allharga + 30000;
                            addsemua.value =
                                Hargatotal.value + Subtotal.value * beratbarang;
                            FirebaseFirestore.instance
                                .collection('transaksi')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .set({
                              'Nama Barang': addsemua.value,
                            });
                          }

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        child: ClipRRect(
                                          child: Image.network(
                                              "${controller.listdata[index]["img"]}"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Rp${controller.listdata[index]["Harga_brg"]}"),
                                          Text(
                                            "Sisa stok : ${controller.listdata[index]["sisa_stok"]}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey.shade400),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  content: Row(
                                    children: [
                                      Text("Jumlah"),
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: controller.subtractItem,
                                      ),
                                      Obx(() => Text(controller.itemCount.value
                                          .toString())),
                                      IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: controller.addItem,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        tes();
                                        Get.toNamed('/checkout1-penjualan',
                                            arguments: index);
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child: Center(
                        child: Text(
                          "Check-out",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
              ));
            }
          },
        );
      },
    );
  }
}
