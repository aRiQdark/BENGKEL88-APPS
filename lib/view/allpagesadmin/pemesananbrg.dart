import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:jobstreet/controller/controlleradmin/controllerpenjualan.dart';

class addbarang extends StatefulWidget {
  final List? list;
  final int? index;
  addbarang({this.list, this.index});
  @override
  State<addbarang> createState() => _addbarangState();
}

class _addbarangState extends State<addbarang> {
  final controller = Get.find<controllermarketAdmin>();
  bool editmode = false;
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => controllermarketAdmin());
    return Scaffold(
      body: Obx(
        () => ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_new)),
                const Text(
                  "Data Product",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height,
                      child: ListView.builder(
                        itemCount: controller.listdata.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(top: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            width: Get.width,
                            height: 230,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  // Container(
                                  //   height: 80,
                                  //   width: 80,
                                  //   child: Image.network(
                                  //       controller.listdata[index]["img"]),
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //       border: Border.all()),
                                  // ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.listdata[index]["Jdl_brg"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          "Stok : .${controller.listdata[index]["sisa_stok"]}"),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          "Rp.${controller.listdata[index]["Harga_brg"]}"),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(controller.listdata[index]
                                          ["Jam_rilis"]),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 80,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            Get.defaultDialog(
                                              cancel: ElevatedButton(
                                                onPressed: () => Get.back(),
                                                child: Text("Kembali"),
                                              ),
                                              confirm: ElevatedButton(
                                                onPressed: () {
                                                  Get.back(); // Close the confirmation dialog
                                                  Get.defaultDialog(
                                                    content: Text(
                                                        "Yakin Ingin Edit Data?"),
                                                    confirm: ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          var url = Uri.parse(
                                                              "http://192.168.35.128/backendphp/update.php");
                                                          var body = {
                                                            //
                                                            "id_brg": controller
                                                                    .listdata[
                                                                index]['id_brg'],
                                                            "Jdl_brg": controller
                                                                    .jdlbrg
                                                                    .text
                                                                    .isNotEmpty
                                                                ? controller
                                                                    .jdlbrg.text
                                                                : controller.listdata[
                                                                        index]
                                                                    ["Jdl_brg"],
                                                            "Deskripsi": controller
                                                                    .deskripsi
                                                                    .text
                                                                    .isNotEmpty
                                                                ? controller
                                                                    .deskripsi
                                                                    .text
                                                                : controller.listdata[
                                                                        index][
                                                                    "Deskripsi"],
                                                            "Harga_brg": controller
                                                                    .Harga
                                                                    .text
                                                                    .isNotEmpty
                                                                ? controller
                                                                    .Harga.text
                                                                : controller.listdata[
                                                                        index][
                                                                    "Harga_brg"],
                                                            "sisa_stok": controller
                                                                    .stok
                                                                    .text
                                                                    .isNotEmpty
                                                                ? controller
                                                                    .stok.text
                                                                : controller.listdata[
                                                                        index][
                                                                    "sisa_stok"],
                                                          };
                          
                                                          http
                                                              .post(url,
                                                                  body: body)
                                                              .then(
                                                            (response) {
                                                              Get.back(); // Close the inner dialog
                                                              Get.defaultDialog(
                                                                title: "Pesan",
                                                                middleText:
                                                                    "Data Berhasil Di edit",
                                                              );
                                                            },
                                                          );
                                                        });
                                                      },
                                                      child: Text("Lanjutkan"),
                                                    ),
                                                    cancel: ElevatedButton(
                                                      onPressed: () =>
                                                          Get.back(),
                                                      child: Text("Kembali"),
                                                    ),
                                                  );
                                                },
                                                child: Text("Lanjutkan"),
                                              ),
                                              title: 'Edit',
                                              content: Column(
                                                children: [
                                                  TextField(
                                                    controller:
                                                        controller.jdlbrg,
                                                    inputFormatters: <
                                                        TextInputFormatter>[],
                                                    decoration: InputDecoration(
                                                      labelText: 'Judul Barang',
                                                      hintText:
                                                          'Masukkan Judul Barang',
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  TextField(
                                                    controller:
                                                        controller.Harga,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                    ],
                                                    decoration: InputDecoration(
                                                      labelText: 'Harga',
                                                      hintText:
                                                          'Masukkan Harga',
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  TextField(
                                                    controller:
                                                        controller.deskripsi,
                                                    decoration: InputDecoration(
                                                      labelText: 'Deskripsi',
                                                      hintText:
                                                          'Masukkan Deskripsi',
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  TextField(
                                                    controller: controller.stok,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: 'Stok',
                                                      hintText: 'Masukkan Stok',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                        },
                                        child: const Text("Edit"),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              var url = Uri.parse(
                                                  "http://192.168.35.128/backendphp/delete.php");
                                              var body = {
                                                "id_brg": controller
                                                    .listdata[index]['id_brg']
                                              };
                          
                                              http
                                                  .post(url, body: body)
                                                  .then((response) {
                                                Get.back();
                                                Get.defaultDialog(
                                                    title: "Pesan",
                                                    middleText:
                                                        "Data ${controller.listdata[index]["Jdl_brg"]} Berhasil Di Hapus ");
                          
                                                print(response.statusCode);
                                              }).catchError((error) {
                                                print(error);
                                              });
                                            });
                                          },
                                          child: const Text("Hapus"))
                                    ],
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
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_chart_outlined),
        onPressed: () => Get.toNamed('/Add-barang-Admin'),
      ),
    );
  }
}
