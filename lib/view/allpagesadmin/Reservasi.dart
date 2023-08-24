import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/controllerhome.dart';
import 'package:jobstreet/view/Allpages/Reservasi_view.dart';

class Reservasiadmin extends GetView<Reservasi_view> {
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsers() {
  return FirebaseFirestore.instance
      .collection("reservasi")
      .orderBy('date', descending: false) 
      .snapshots();
}

  final Homectrller = Get.find<Homecontroller>();

  @override
  Widget build(BuildContext context) {
    Future<void> Postmotor(String documentId) async {
      Get.defaultDialog(middleText: "Update Berhasil");

      // Fetch all documents from the "reservasi" collection
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('reservasi').get();

      // Update each document in the collection
      WriteBatch batch = FirebaseFirestore.instance.batch();
      snapshot.docs.forEach((doc) {
        batch.update(
            doc.reference, {
              'status': Homectrller.selectedOption.value});
      });

      // Commit the batch update
      await batch.commit();
    }
Get.put(Homecontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Reservasi"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              // List<String> emails = snapshot.data!.docs
              //     .map((doc) => doc['email'] as String)
              //     .toList();
Get.lazyPut(()=>Homecontroller());
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  // Access data from each document
                  DocumentSnapshot document = documents[index];
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  if (data.containsKey('email') &&
                      data.containsKey('Kilometer') &&
                      data.containsKey('Keluhan') &&
                      data.containsKey('date') &&
                      data.containsKey('Jenis Motor') &&
                      data.containsKey('bookingStart') &&
                      data.containsKey('bookingEnd') &&
                      data.containsKey('status')) {
                    DateTime jamrilis = data['date'].toDate();
                    String email = data['email'];
                    String Kilometer = data['Kilometer'];
                    String jenismotor = data['Jenis Motor'];
                    String keluhan = data['Keluhan'];
                    DateTime bookingStart = data['bookingStart'].toDate();
                    DateTime bookingEnd = data['bookingEnd'].toDate();
                    String status = data['status'];
                    Get.put(Homecontroller());
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Email: $email',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            Text('Kilometer: $Kilometer'),
                            const SizedBox(height: 15),
                            Text('Jenis motor: $jenismotor'),
                            const SizedBox(height: 15),
                            Text('Keluhan: $keluhan'),
                            const SizedBox(height: 15),
                            Text('Booking Start: $bookingStart'),
                            const SizedBox(height: 15),
                            Text('Booking End: $bookingEnd'),
                            const SizedBox(height: 15),
                            Text('jamrilis: $jamrilis'),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => DropdownButton(
                                  isExpanded: true,
                                  hint: const Text('Pilih opsi'),
                                  value: Homectrller.items.contains(
                                          Homectrller.selectedOption.value)
                                      ? Homectrller.selectedOption.value
                                      : null,
                                  onChanged: (newValue) {
                                    Homectrller.selectedOption.value =
                                        newValue!;
                                  },
                                  items: Homectrller.items.map((option) {
                                    return DropdownMenuItem(
                                      child: Text(option),
                                      value: option,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Text('status: $status'),
                            ElevatedButton(
                              onPressed: () => Postmotor(document.id),
                              child: const Text("Update status"),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    Get.put(Homecontroller());
                    return Container();
                  }
                },
              );
            } else if (snapshot.hasError) {
              
              Get.put(Homecontroller());
              return Text('Error: ${snapshot.error}');
            } else {
              Get.put(Homecontroller());
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
