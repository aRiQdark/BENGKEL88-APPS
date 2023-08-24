import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/controllerpenjualan.dart';

class Panduan extends StatelessWidget {
  
final add = Get.find<controllermarket>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffF0F4FD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF0F4FD),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Selamat Datang di menu panduan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text("Mau membaca apa hari ini?"),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Mulai mencari',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 190,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/pembelajaran.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Menu Panduan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            InkWell(
              onTap: () => Get.toNamed('/panduan-buku'),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 100,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.book_rounded,
                        size: 40,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Menu buku panduan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/panduan-video'),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 100,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(
                              'assets/icons/video-player-1-alternate.png')),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Menu video panduan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            // Container(
            //   decoration: BoxDecoration(color: Colors.white),
            //   margin: EdgeInsets.only(top: 18),
            //   height: 160,
            //   width: Get.width,
            //   child: Center(
            //     child: Text(
            //       "Selamat datang di panduan aplikasi kami. Di sini, Anda \n dapat mempelajari cara menggunakan semua fitur dan \n fungsi aplikasi dengan mudah",
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       InkWell(
            //         onTap: () => Get.toNamed('/panduan-buku'),
            //         child: Container(
            //           decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(20)),
            //           height: 113,
            //           width: 127,
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 8, right: 8,top: 18),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Align(
            //                   heightFactor: 1,
            //                     alignment: Alignment.bottomLeft,
            //                     child:Icon(Icons.book_rounded,size: 40,color: Colors.green,)),
            //                     SizedBox(height: 10,),
            //                 Text(
            //                   "Buku Panduan",
            //                   style: TextStyle(fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       InkWell(
            //         onTap: () => Get.toNamed('/panduan-video'),
            //         child: Container(
            //           decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(20)),
            //           height: 113,
            //           width: 127,
            //           child: Padding(
            //             padding: const EdgeInsets.only(left: 5, right: 8),
            //             child: Column(
            //               children: [
            //                 Align(
            //                     alignment: Alignment.bottomLeft,
            //                     child: Image.asset('assets/icons/video-player-1-alternate.png')),
            //                 Text(
            //                   "Video Panduan",
            //                   style: TextStyle(fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
