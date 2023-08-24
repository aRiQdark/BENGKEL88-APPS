import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';

class berandaAdmin extends GetView<Authcontroller> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Row(
                        children: [
                          Icon(Icons.people_alt_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("88 Motor Tarutung"),
                              Text("Admin"),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          IconButton(onPressed: () => controller.logout(), icon: Icon(Icons.logout))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Selamat Datang Admin",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed('/pemesanan-barang-Admin'),
                        child: Container(
                          height: 100,
                          width: 325,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 241, 219, 219),
                              borderRadius: BorderRadius.circular(18)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 24,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("STOK PRODUK"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Icon(Icons.account_balance_sharp),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed('/peneriman-barang-Admin'),
                        child: Container(
                          height: 100,
                          width: 325,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 241, 219, 219),
                              borderRadius: BorderRadius.circular(18)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 24,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("PEMESANAN BARANG"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Icon(Icons.book),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed('/Reservasi-Admin'),
                        child: Container(
                          height: 100,
                          width: 325,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 241, 219, 219),
                              borderRadius: BorderRadius.circular(18)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: 24,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("RESERVASI"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Icon(
                                  Icons.boy_sharp,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ])))));
  }
}
