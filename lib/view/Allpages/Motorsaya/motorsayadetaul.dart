import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/controller/controllerkereta.dart';

class MotorSayaDetail extends GetView<controllermotor> {
  @override
  Widget build(BuildContext context) {
    final add = Get.find<Homecontroller>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Motor"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: ListView(
        children: [
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: add.datamotor(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                Get.put(Homecontroller());
                return SizedBox();
              } else {
                Get.put(Homecontroller());
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 300,
                          width: 100,
                          child: ClipRRect(
                            child: Image.asset(
                                "assets/images/reservasidetail.png"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Motor",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${snapshot.data!.data()!['Jenis Motor']}",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Model",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Text(
                                  "${snapshot.data!.data()!['Jenis Motor']}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "No Plat",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Text(
                                  "${snapshot.data!.data()!['Noplat']}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tahun Beli",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Text(
                                  "${snapshot.data!.data()!['Tahunbeli']}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
    // return FutureBuilder<void>(
    //   future: controller.getdatamotor(),
    //   builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     } else if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     } else {
    //       final motorData = controller.datamotor;
    //       final motorByEmail = motorData
    //           .where((motor) => motor['email'] == 'muhammadariq105@gmail.com')
    //           .toList();

    //       if (motorByEmail.isEmpty) {
    //         return Text('No motor found for the email');
    //       }

    //       final motor = motorByEmail[0];

    //       return SafeArea(
    //         child: Scaffold(
    //           appBar: AppBar(
    //             backgroundColor: Colors.blue[200],
    //             elevation: 0,
    //             leading: IconButton(
    //               onPressed: () => Get.back(),
    //               icon: Icon(Icons.arrow_back_ios_new),
    //             ),
    //             title: Text("Detail Motor"),
    //             centerTitle: true,
    //           ),
    //           body: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 margin: EdgeInsets.only(top: 20),
    //                 height: 200,
    //                 width: 100,
    //                 child: ClipRRect(
    //                   child: Image.asset('assets/images/moge.png'),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       "Motor",
    //                       style: TextStyle(
    //                         color: Colors.grey[400],
    //                         fontSize: 16,
    //                       ),
    //                     ),
    //                     Text(
    //                       "${motor['jenis motor']}",
    //                       style: TextStyle(
    //                         fontSize: 30,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     SizedBox(height: 40),
    //                     Padding(
    //                       padding: const EdgeInsets.all(16.0),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "Model",
    //                             style: TextStyle(
    //                               fontSize: 20,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.grey[500],
    //                             ),
    //                           ),
    //                           Text(
    //                             "${motor['jenis motor']}",
    //                             style: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     SizedBox(height: 20),
    //                     Padding(
    //                       padding: const EdgeInsets.all(16.0),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "No Plat",
    //                             style: TextStyle(
    //                               fontSize: 20,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.grey[500],
    //                             ),
    //                           ),
    //                           Text(
    //                             "${motor['noplat']}",
    //                             style: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     SizedBox(height: 20),
    //                     Padding(
    //                       padding: const EdgeInsets.all(16.0),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "KM",
    //                             style: TextStyle(
    //                               fontSize: 20,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.grey[500],
    //                             ),
    //                           ),
    //                           Text(
    //                             "${motor['KM']}\rKM",
    //                             style: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     SizedBox(height: 20),
    //                     Padding(
    //                       padding: const EdgeInsets.all(16.0),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             "Tahun Beli",
    //                             style: TextStyle(
    //                               fontSize: 20,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.grey[500],
    //                             ),
    //                           ),
    //                           Text(
    //                             "${motor['tahunbeli']}",
    //                             style: TextStyle(
    //                               fontSize: 18,
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
