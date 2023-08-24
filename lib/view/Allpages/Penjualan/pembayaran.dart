import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/Repository/repoAPI.dart';
import 'package:http/http.dart' as http;
import 'package:jobstreet/Utils/suksespage.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/controller/controllerpembayaran.dart';
import 'package:jobstreet/controller/controllerpenjualan.dart';
import 'package:jobstreet/view/Allpages/Penjualan/checkout-penjualan.dart';
import 'package:lottie/lottie.dart';

class Pembayaran extends StatefulWidget {
  @override
  State<Pembayaran> createState() => PembayaranState();
}

class PembayaranState extends State<Pembayaran> {
  final add = Get.find<controllermarket>();
  final int index = Get.arguments;
  final get = Get.find<API>();
  bool _isFilled = false;
  final now = DateTime.now();
  var selectedOption = ''.obs;
  var statuspengiriman = ''.obs;
  List<String> statuspengirim = ['proses', 'dikirim', 'selesai', 'ditolak'];
  List<String> items = ['Menunggu', 'Disetujuin', 'Ditolak'];
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> datamotor() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection('transaksi').doc(uid).snapshots();
  }

  final controller = Get.find<controllerpembayaran>();
  @override
  Widget build(BuildContext context) {
    final firebase = Get.find<Homecontroller>();
    // final penambahan = add.listdata[index]["Jdl_brg"];
    // final Harga = add.listdata[index]["Harga_brg"];
    // final jdl_brg = TextEditingController(text: '$penambahan');

    // final hargabarang = TextEditingController(text: '$Harga');
    final checkout = Get.find<Authcontroller>();

    print(controller.getdata());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 223, 223),
      appBar: AppBar(
        backgroundColor: const Color(0xff35BCAC),
        title: const Text("Pembayaran"),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed('/pembayaran_detail'),
              icon: Icon(Icons.card_travel_rounded))
        ],
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: firebase.strembldr(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          } else {
            final firebase = Get.find<Homecontroller>();
            final penambahan = add.listdata[index]["Jdl_brg"];
            final Harga = add.listdata[index]["Harga_brg"];
            final jdl_brg = TextEditingController(
                text: '${add.listdata[index]["Jdl_brg"]}');

            final hargabarang = TextEditingController(
                text: '${add.listdata[index]["Harga_brg"]}');
            final checkout = Get.find<Authcontroller>();
            TextEditingController almaT = TextEditingController(
                text: "${snapshot.data!.data()!["Alamat"]}");
 TextEditingController Nohp = TextEditingController(
                text: "${snapshot.data!.data()!["phoneNumber"]}");
            void Postmotor(
              TextEditingController username,
              TextEditingController alamat,
              TextEditingController hrgbrg,
              TextEditingController judulbrang,
              String opsi,
              String image, TextEditingController nohp,
            ) async {
              Get.defaultDialog(
                middleText: 'Pembayaran Terkirim',
                title: '',
                confirm: Lottie.asset('assets/lottie/tick.json'),
              );
              // Get.defaultDialog(
              //     middleText: "Yakin ingin update data?",
              //     confirm: ElevatedButton(
              //         onPressed:  () => Get.toNamed('/motorku-detail'),
              //         child: Text("Lanjut")),
              //     cancel:
              //         ElevatedB utton(onPressed: () => Get.back(), child: Text("Batal")));
              return FirebaseFirestore.instance
                  .collection('transaksi')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .update({
                'Nama Pembeli': FirebaseAuth.instance.currentUser!.email!,
                'stok':add.itemCount.value,
                'Nohp':Nohp.text,
                'Alamat': almaT.text,
                'Harga Barang': jdl_brg.text,
                'Rilis': now,
                'status': "Menunggu",
                'Status Pengiriman': "Proses",
                // 'img': add.selectedImagePath.value,
                'Status_User': "Sudah melakukan pembayaran",
              });
            }

            void addData(
              TextEditingController username,
              TextEditingController alamat,
              TextEditingController hrgbrg,
              TextEditingController judulbrang,
            ) async {
              Get.lazyPut(() => PembayaranState());
              var url = Uri.parse(get.APIconnectPost);
              var response = await http.post(url, body: {
                'Username': username.text,
                'alamat': almaT.text,
                'hargabrg': jdl_brg.text,
                "Jdl_brg": hargabarang.text,
              });

              if (response.statusCode == 200) {
                await Future.delayed(const Duration(seconds: 2));
                Get.defaultDialog(
                  middleText: 'Pembayaran Terkirim',
                  title: '',
                  confirm: Lottie.asset('assets/lottie/tick.json'),
                );
                // Data was successfully added
                print("Data added!");
              } else {
                // Error occurred
                print("Error adding data: ${response.statusCode}");
              }
            }

            var hargaOngkos = 0.obs;
            int hargaBarang = int.parse(Harga.toString());
            void hitungHargaOngkos() {
              hargaOngkos.value = hargaBarang + 30000;
            }

            return Padding(
              padding: const EdgeInsets.all(50),
              child: ListView(
                children: [
                  // ElevatedButton(
                  //     onPressed: () => hitungHargaOngkos(),
                  //     child: Text("data")),
                  // Obx(() => Text('Harga Ongkos: Rp${hargaOngkos.value}')),
                  TextField(
                    controller: controller.Username,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Masukkan Nama Penerima',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      suffixIcon: const Icon(Icons.check, color: Colors.green),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                          "${snapshot.data!.data()!["Alamat"]}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: almaT,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Masukkan Alamat tambahan',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      prefixIcon:
                          const Icon(Icons.location_on, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                          child: TextField(
                        readOnly: true,
                        controller: jdl_brg,
                      )),
                    ),
                  ),

               
 

                  Obx(
                    () => add.selectedImagePath.value.isNotEmpty
                        ? Column(
                            children: [
                              Image.file(
                                File(add.selectedImagePath.value),
                                width: 200,
                                height: 200,
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 200),
                            child: Container(
                              height: 50,
                              width: 50,
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () => add.pickImage(),
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.add_link),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text("Masukkan link gambar screenshot")
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => add.TakeImage(),
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.camera),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text("Ambil Gambar")
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(
                      onPressed: () => Postmotor(controller.Username,
                          controller.Almt, hargabarang, jdl_brg,firebase.statuspengiriman.toString(),add.selectedImagePath.value,Nohp),
                      child: const Text("Kirim")),
                  // InkWell(
                  //   onTap: () => controller.addData(controller.username,
                  //       controller.almt, controller.Hrg, controller.jdlbrang),
                  //   child: Container(
                  //     height: 50,
                  //     width: 100,
                  //     decoration: BoxDecoration(
                  //         color: Colors.blue,
                  //         borderRadius: BorderRadius.circular(20)),
                  //     child: Center(
                  //         child: Text(
                  //       "Selesai",
                  //       style: TextStyle(color: Colors.white),
                  //     )),
                  //   ),
                  // )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
