import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/Model/informasi-detail.dart';

class Detailinformasi extends StatelessWidget {
  List<detailinfor> alllist = [
    detailinfor(
        img: 'assets/icons/penjualan.png',
        txt:
            'Fitur pembelian suku cadang \n adalah sebuah komponen dalam \n sistem atau  platform '),
    detailinfor(
        img:
            'assets/images/pngtree-cartoon-hand-holding-labor-tool-free-button-image_1316233-removebg-preview 1.png',
        txt: "serangkaian fungsi atau kemampuan \n yang ditawarkan oleh sistem \n atau platform."),
    detailinfor(img: "assets/icons/Informasi.png", txt: "serangkaian fungsi atau kemampuan \n yang ditawarkan oleh sistem \n atau platform."),
    detailinfor(img: "assets/icons/profilebranda.png", txt: "Fitur profil dengan kemampuan untuk \n mengganti nama, password, \n dan nomor telepon (HP)"),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 120,
                    width: 120,
                    child: Image.asset(
                      "assets/icons/logo88.jpg",
                    )),
                Text(
                  "Bengkel 88 Motor Tarutung",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Reservasi dan pemesanan"),
                SizedBox(
                  height: 27,
                ),
                SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    itemCount: alllist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 30,left: 20,right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(alllist[index].img),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(alllist[index].txt,)),
                            )
                          ],
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
