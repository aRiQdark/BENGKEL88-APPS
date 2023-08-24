import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:jobstreet/Model/reservasi_model.dart';

class userrepo extends GetxController {
  static userrepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  createuser(SportBookingmodel user) {
    _db
        .collection("${FirebaseAuth.instance.currentUser!.email!}")
        .add(user.toJson())
        .whenComplete(() => () => Get.snackbar("sukses", "reservasi berhasil"));
  }
}
