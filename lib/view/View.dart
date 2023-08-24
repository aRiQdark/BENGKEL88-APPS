import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jobstreet/Model/model.dart';

import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/controller/controllerpenjualan.dart';

// ignore: must_be_immutable
class View extends GetView<Homecontroller> {
  // ignore: non_constant_identifier_names

  View({super.key});

  final authC = Get.find<Authcontroller>();
  final penjualan = Get.find<controllermarket>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ListView(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.people_alt_rounded),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Hello,",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${FirebaseAuth.instance.currentUser!.displayName}")
                    ],
                  ),
                  SizedBox(
                    height: 193,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          margin: const EdgeInsets.only(right: 45, top: 43),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.network(
                                'https://www.twibbic.com/blog/wp-content/uploads/2023/02/5-6.webp',
                                fit: BoxFit.contain,
                              )),
                        )),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  const Text(
                    'Layanan 88 motor',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              height: 80,
                              width: 156,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 151, 87, 87),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Pembelian \n Suku Cadang',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Image.asset('assets/icons/penjualan.png')
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              // Get.toNamed('/firebase-stokbarang');
                              penjualan.listdata.isNotEmpty
                                  ? Get.toNamed('/Market')
                                  : Get.defaultDialog(
                                      middleText: "error 404",
                                      confirm: ElevatedButton(
                                          onPressed: () => Get.back(),
                                          child: Text("Kembali")));
                            },
                            // onTap: () => Get.toNamed('/Market'),
                          ),
                          InkWell(
                            child: Container(
                              height: 80,
                              width: 156,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 151, 87, 87),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      'Reservasi \n Service Motor',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Image.asset(
                                      'assets/images/pngtree-cartoon-hand-holding-labor-tool-free-button-image_1316233-removebg-preview 1.png',
                                      scale: 1.2,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () => Get.toNamed('/Reservasi'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed('/informasi-bengkel'),
                            child: Container(
                              height: 80,
                              width: 156,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 89, 124, 163),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Informasi \n Bengkel',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Image.asset("assets/icons/Informasi.png")
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                              child: Container(
                                height: 80,
                                width: 156,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 89, 124, 163),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Profile \n Anda',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Image.asset(
                                          "assets/icons/profilebranda.png")
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () => Get.toNamed('/Profilecustomer')),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          height: 80,
                          width: 156,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF5C5C),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Buku \n Panduan',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                Icon(
                                  Icons.book,
                                  color: Colors.white,
                                  size: 35,
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () => Get.toNamed('/panduan'),
                      ),
                      InkWell(
                        child: Container(
                          height: 80,
                          width: 156,
                          decoration: BoxDecoration(
                              color: const Color(0xffFF5C5C),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Chat \n Admin',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.chat,
                                  color: Colors.white,
                                  size: 35,
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () => Get.toNamed('/chat-admin'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: controller.strembldr(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox();
                      }
                      String role = snapshot.data!.data()!["role"];
                      if (role == "admin") {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: InkWell(
                                child: Container(
                                  height: 80,
                                  width: 156,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 37, 221, 77),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Motor \n Saya',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Image.asset("assets/icons/becak.jpg")
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () => Get.toNamed('/motorku'),
                              ),
                            ),
                            Center(
                              child: InkWell(
                                child: Container(
                                  height: 80,
                                  width: 156,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 37, 221, 77),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'ini \n admin',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.admin_panel_settings,
                                          size: 40,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () => Get.toNamed('/beranda-admin'),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: InkWell(
                            child: Container(
                              height: 80,
                              width: 156,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 37, 221, 77),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Motor \n Saya',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Image.asset("assets/icons/becak.jpg")
                                  ],
                                ),
                              ),
                            ),
                            onTap: () => Get.toNamed('/motorku'),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Informasi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 240,
                    child: CarouselSlider(
                      items: [
                        SizedBox(
                          height: Get.height,
                          child: ListView.builder(
                            itemCount: 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    width: 300,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(13),
                                        child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWCqBw8xv_6LwmtW0pW_bhpHm0d1esNYhoSg&usqp=CAU',
                                          fit: BoxFit.contain,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  // Text("Bengkel 88 Menjadi tempat favorit para \n pembalap tarutung")
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          viewportFraction: 1.0,
                          enlargeCenterPage: true),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
