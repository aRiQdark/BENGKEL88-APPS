import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/view/View.dart';

class Profilecustomer extends GetView<Authcontroller> {
  final data = Get.find<Homecontroller>();
  @override
  Widget build(BuildContext context) {
    var display = TextEditingController();
    var number = TextEditingController();

    final profile = Get.find<Authcontroller>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Profile"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Get.back(),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: data.strembldr(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            Get.lazyPut(() => Homecontroller());
            return SizedBox();
          }
          if (snapshot.data!.data()!["role"] == "admin" &&
              snapshot.data!.data()!["role"] == "pelanggan") {
            Get.lazyPut(() => Homecontroller());
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/icons/logo88.jpg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text("${FirebaseAuth.instance.currentUser!.email!}"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${snapshot.data!.data()!["role"]}",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${snapshot.data!.data()!["Alamat"]}",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${snapshot.data!.data()!["phoneNumber"]}",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: TextField(
                        controller: display,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Update display name"),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controller.phoneNumberController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Update Number Phone"),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed('/Gantipass'),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ganti Password"),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        )),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.currentUser!
                            .updateDisplayName(display.text);
                        controller.updatePhoneNumber();
                      },
                      child: Text("Update"))
                ],
              ),
            );
          } else {
            Get.lazyPut(() => Homecontroller());
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/icons/logo88.jpg',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text("${FirebaseAuth.instance.currentUser!.email!}"),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${snapshot.data!.data()!["role"]}",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${snapshot.data!.data()!["Alamat"]}",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${snapshot.data!.data()!["phoneNumber"]}",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: TextField(
                          controller: display,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ubah Nama Tampilan"),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      height: 60,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: TextField(
                          controller: controller.notelp,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Ubah Nomor Handphone"),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () => Get.toNamed('/Gantipass'),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        height: 60,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Ganti Password"),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.currentUser!
                            .updateDisplayName(display.text);
                        Flushbar(
                          flushbarPosition: FlushbarPosition.TOP,
                          message:
                              "Nama tampilan sudah di ubah mohon melakukan log-in ulang",
                          icon: Icon(
                            Icons.info_outline,
                            size: 28.0,
                            color: Colors.blue[300],
                          ),
                          duration: Duration(seconds: 3),
                          leftBarIndicatorColor: Colors.blue[300],
                        )..show(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 2,
                      ),
                      child: Text(
                        "Ubah Nama Tampilan",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: 2,
                        ),
                        onPressed: () async {
                          controller.numberphoneupdate();
                          Flushbar(
                            flushbarPosition: FlushbarPosition.TOP,
                            message: "Nomor Handphone di ubah",
                            icon: Icon(
                              Icons.info_outline,
                              size: 28.0,
                              color: Colors.blue[300],
                            ),
                            duration: Duration(seconds: 3),
                            leftBarIndicatorColor: Colors.blue[300],
                          )..show(context);
                        },
                        child: Text("Ubah Nomor Handphone"))
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          controller.logout(),
         
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
