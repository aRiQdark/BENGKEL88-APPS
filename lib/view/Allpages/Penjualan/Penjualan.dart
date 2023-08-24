import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jobstreet/Model/productmodel.dart';
import 'package:jobstreet/Utils/barangbaju.dart';
import 'package:http/http.dart' as http;
import 'package:jobstreet/controller/controllerpenjualan.dart';
import 'package:jobstreet/view/ViewAuth/Component/loadinglottie.dart';

class Market extends GetView<controllermarket> {
  Future<void> refreshData() async {
    // Simulasi proses pembaruan data
    var url = Uri.parse("http://192.168.1.26/backendphp/get.php");

    try {
      var response = await http.post(url);

      if (response.statusCode == 200) {
        // Berhasil memperbarui data
        print('Data berhasil diperbarui');
      } else {
        // Gagal memperbarui data
        print('Gagal memperbarui data');
      }
    } catch (e) {
      // Error dalam melakukan permintaan HTTP
      print('Terjadi kesalahan: $e');
    }
    await Future.delayed(Duration(seconds: 2));
  }

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();



  @override
  Widget build(BuildContext context) {
    final data = controller.listdata;
    return FutureBuilder(
        future: controller.getdata(),
        builder: (BuildContext context, AsyncSnapshot<List<product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: middleload(),
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

            return Scaffold(
                backgroundColor: Color(0xffF0F4FD),
                appBar: AppBar(
                  backgroundColor: Colors.brown,
                  leading: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  title: const Text('Market'),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () => Get.toNamed('/pembayaran_detail'),
                        icon: Icon(Icons.card_travel_rounded))
                  ],
                ),
                body: RefreshIndicator(
                    key: refreshIndicatorKey,
                    onRefresh: refreshData,
                    child: Obx(
                      () => ListView(
                        children: [
                          SizedBox(
                            height: 260,
                            child: CarouselSlider(
                              items: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  width: 360,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      "https://static.vecteezy.com/system/resources/previews/002/453/533/original/big-sale-discount-banner-template-promotion-illustration-free-vector.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(15),
                                  width: 360,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/sale-banner-with-discount_23-2149143592.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(15),
                                  width: 360,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      "https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2023/02/03/222745446.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(15),
                                  width: 360,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      "https://www.otomaniac.com/wp-content/uploads/2019/04/R15-V3-Racing-Black-min.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(15),
                                  width: 360,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2021/07/13/tampilan-master-brake-pump-s1-kh-20210713115547.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                              options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  viewportFraction: 1.0,
                                  enlargeCenterPage: true),
                            ),
                          ),
                          // Container(
                          //   margin: const EdgeInsets.only(top: 17),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(),
                          //       borderRadius: BorderRadius.circular(20)),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: TextField(
                          //       controller: controller.searchcontroller,
                          //       onChanged: (value) {
                          //         controller.searchData();
                          //       },
                          //       decoration: const InputDecoration(
                          //         border: InputBorder.none,
                          //         prefixIcon: Icon(Icons.search),
                          //         hintText: 'Search...',
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            margin: EdgeInsets.only(top: 8, left: 8, right: 8),
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
                              controller: controller.searchcontroller,
                              onChanged: (value) {
                                controller.searchData(value);
                                // controller.tes(value);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Cari Barang Anda....',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: Get.height,
                                      child: controller.listdata.isNotEmpty
                                          ? controller.isLoading.value
                                              ? SizedBox(
                                                height: Get.height,
                                                child: Obx(() => GridView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                    padding: EdgeInsets.all(8),
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      childAspectRatio: 1,
                                                      crossAxisCount: 2,
                                                    ),
                                                    itemCount: controller.listdata.length,
                                                    itemBuilder: (BuildContext context,
                                                        int index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          // controller.showBarangDetailnyid(
                                                          //     controller.listdata[index]["Id"]);
                                                          Get.toNamed('/Detail-barang',
                                                              arguments: index);
                                                        },
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets.all(10),
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      10),
                                                              border: Border.all(
                                                                  color: Colors.grey),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color: Colors.grey,
                                                                  blurRadius: 4,
                                                                  offset: Offset(2,
                                                                      4), // Shadow position
                                                                ),
                                                              ]),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                            children: [
                                                              controller.listdata[index]
                                                                          ["img"] !=
                                                                      null
                                                                  ? Container(
                                                                      height: 100,
                                                                      width: 170,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  10),
                                                                          border: Border.all(
                                                                              color: Colors
                                                                                  .grey),
                                                                          color: Colors
                                                                              .green),
                                                                      child: ClipRRect(
                                                                        child:
                                                                            Image.network(
                                                                          "${controller.listdata[index]["img"]}",
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ))
                                                                  : Container(
                                                                      height: 100,
                                                                      width: 170,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  10),
                                                                          border: Border.all(
                                                                              color: Colors
                                                                                  .grey),
                                                                          color: Colors.green),
                                                                      child: ClipRRect(child: Text("Tidak Ada Gambar"))),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.only(
                                                                        left: 10),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      controller.listdata[
                                                                              index]
                                                                          ["Jdl_brg"],
                                                                      style: const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 3,
                                                                    ),
                                                                    Text(
                                                                        "Rp. ${controller.listdata[index]["Harga_brg"]}"),
                                                                    const SizedBox(
                                                                      height: 2,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(controller
                                                                                    .listdata[
                                                                                index][
                                                                            "Jam_rilis"]),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                              
                                                              // Text("${listdata}"),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),)
                                              )
                                              : const SizedBox(
                                                  child: Center(
                                                    child:
                                                        Text("Barang tidak tersedia"),
                                                  ),
                                                )
                                          : Center(
                                              child: SizedBox(
                                                  child: Text("Barang kosong")),
                                            )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )));
          }
        });
  }
}
