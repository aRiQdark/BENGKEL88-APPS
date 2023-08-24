import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/controller/controllerkereta.dart';
import 'package:jobstreet/view/Allpages/Reservasi_view.dart';

class motorku extends GetView<Homecontroller> {
  @override
  Widget build(BuildContext context) {
    // final data = controller.datamotor;

//     print(data);
// print(controller.getdatamotor());
    return FutureBuilder(
      // future: controller.getdatamotor(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Get.put(Homecontroller());
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () => Get.toNamed('/motorku-detail'),
                    icon: Icon(Icons.card_travel)),
              )
            ],
            centerTitle: true,
            title: Text("Motor"),
            leading: ElevatedButton(
                onPressed: () => Get.back(),
                child: Icon(Icons.arrow_back_ios_new_sharp)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 160,
                  width: 50,
                  child: ClipRRect(
                    child: Center(
                      child: Image.asset("assets/icons/becak2.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller.jenismotor,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[500],
                    hintText: 'Masukkan Jenis Motor',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controller.noplat,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[500],
                    hintText: 'Masukkan No Plat',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: controller.thnbeli,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[500],
                    hintText: 'Masukkan Tahun Beli',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                //   child: Obx(
                //     () => DropdownButton(
                //       isExpanded: true,
                //       hint: Text('Pilih opsi'),
                //       value: controller.selected.value,
                //       onChanged: (newValue) {
                //         controller.selected.value = newValue!;
                //       },
                //       items: controller.items.map((option) {
                //         return DropdownMenuItem(
                         
                //           child: Text(option),
                //           value: option,
                //         );
                //       }).toList(),
                //     ),
                //   ),
                // ),
                ElevatedButton(
                    onPressed: () => controller.Postmotor(
                       ),
                    child: Text("Update"))
              ],
            ),
          ),
        );
        ;
      },
    );
  }
}
