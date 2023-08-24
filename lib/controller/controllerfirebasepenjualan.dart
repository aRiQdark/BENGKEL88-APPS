import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class Penjualanfirebasecontroller extends GetxController {

 RxBool isLoading = false.obs;
 FirebaseAuth auth = FirebaseAuth.instance;
 FirebaseFirestore firestore = FirebaseFirestore.instance; 

Stream<DocumentSnapshot<Map<String, dynamic>>> stokbarang() async*{

 yield* firestore.collection('Stokbarang').doc("qDF5RlXPVQ3cJhwy2oxN").snapshots();
}

  }

