import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';
import 'package:jobstreet/Model/panduanmodel.dart';
import 'package:jobstreet/view/Allpages/Panduan/Panduan_1.dart';

class Bukupanduan extends StatelessWidget {
  List<panduan> alllist = [
    panduan(
        Deskripsi:
            "1.Masuk ke dalam page pembelian suku cadang \n2.Memilih item yang akan di beli \n3.Lanjutkan Pembayaran \n6.Kirim Bukti Pembayaran",
        jdl: "Pemesanan barang"),
    panduan(
        Deskripsi:
            "1.Masuk ke dalam page reservasi \n2.Update Detail Motor \n3.Masukkan Kilometer serta keluhan \n4.Pilih tanggal dan waktu \n5.tekan tombol mulai booking",
        jdl: "Sistem Reservasi"),
        panduan(Deskripsi: "1.Masuk page profile \n2.pilih menu Ganti password \n3.Masukkan email \n4.Lanjut kan penggantian password", jdl: 'Ganti password')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: InkWell(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back_ios_new_outlined)),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(33),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Panduan Buku",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "learn from the smallest things",
                  style: TextStyle(color: Colors.grey[500]),
                ),
                SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    itemCount: alllist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 261,
                        width: 313,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Align(
                                  child: Text(
                                alllist[index].jdl,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                alllist[index].Deskripsi,
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 1.5),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
