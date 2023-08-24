import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/view/ViewAuth/Component/loadinglottie.dart';

class listreservasi extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUsers() async* {
    String uid = auth.currentUser!.uid;
    yield* FirebaseFirestore.instance
        .collection('reservasi')
        .doc(uid)
        .snapshots();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
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
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new)),
              title: Text("List Reservasi"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: Get.width,
                      height: 430,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Email:${snapshot.data!.data()!['email']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Kilometer: ${snapshot.data!.data()!['Kilometer']}'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Jenis Motor: ${snapshot.data!.data()!['Jenis Motor']}'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Noplat: ${snapshot.data!.data()!['Noplat']}'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Tahunbeli: ${snapshot.data!.data()!['Tahunbeli']}'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Keluhan: ${snapshot.data!.data()!['Keluhan']}'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Booking Start: ${snapshot.data!.data()!['bookingStart'].toDate()}'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'Booking End: ${snapshot.data!.data()!['bookingEnd'].toDate()}'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                'jamrilis: ${snapshot.data!.data()!['date'].toDate()}'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Status: ${snapshot.data!.data()!['status']}'),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                                onPressed: () => Get.toNamed('/motorku'),
                                child: Text("Update Detail Motor")),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                                onPressed: () => Get.toNamed('/Reservasi'),
                                child: Text("Update Jadwal Reservasi")),
                          ],
                        ),
                      ),
                    );
                    // return ListView.builder(
                    //   itemCount: documents.length,
                    //   itemBuilder: (context, index) {
                    //     // Access data from each document
                    //     DocumentSnapshot document = documents[index];
                    //     Map<String, dynamic> data =
                    //         document.data() as Map<String, dynamic>;
                    //     if (data.containsKey('email') &&
                    //     data.containsKey('Kilometer') &&
                    //     data.containsKey('Keluhan') &&  data.containsKey('date') &&
                    //       data.containsKey('Jenis Motor') &&
                    //         data.containsKey('bookingStart') &&
                    //         data.containsKey('bookingEnd')) {
                    //       DateTime jamrilis = data['date'].toDate();
                    //       String email = data['email'];
                    //       String Kilometer = data['Kilometer'];
                    //       String jenismotor = data['Jenis Motor'];
                    //        String keluhan = data['Keluhan'];
                    //       DateTime bookingStart =
                    //           data['bookingStart'].toDate();
                    //       DateTime bookingEnd = data['bookingEnd'].toDate();
                    //       return Container(
                    //         decoration: BoxDecoration(
                    //           border: Border.all(),
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         margin: EdgeInsets.all(20),
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text(
                    //                 'Email: $email',
                    //                 style: TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //                SizedBox(height: 15,),
                    //               Text('Kilometer: $Kilometer'),
                    //                 SizedBox(height: 15,),
                    //               Text('Jenis motor: $jenismotor'),
                    //                  SizedBox(height: 15,),
                    //               Text('Keluhan: $keluhan'),
                    //               SizedBox(height: 15,),
                    //               Text('Booking Start: $bookingStart'),
                    //               SizedBox(height: 15,),
                    //               Text('Booking End: $bookingEnd'),
                    //                SizedBox(height: 15,),
                    //               Text('jamrilis: $jamrilis'),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     } else {
                    //       return Container(); // Skip rendering if required fields are missing
                    //     }
                    //   },
                    // );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Loading...');
                  }
                },
              ),
            ),
          );
        }
      },
    );
  }
}
