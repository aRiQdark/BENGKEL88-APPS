import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import 'package:jobstreet/Routes/routes.dart';
import 'package:jobstreet/view/dialog.dart';
import 'package:jobstreet/view/snackbar.dart';

File? imagefile;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
Stream<DocumentSnapshot<Map<String, dynamic>>> strembldr() async* {
  String uid = auth.currentUser!.uid;
  yield* firestore.collection('bengkel88').doc(uid).snapshots();
}

class Authcontroller extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();
  String _verificationId = '';
  Stream<User?> stremAuthStatus() {
    return auth.authStateChanges();
  }

  RxBool passwordIsHidden = true.obs;
  final GetStorage _storage = GetStorage();
  RxBool isLoading = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var selectedOption = ''.obs;

  List<String> options = ['pelanggan', 'admin'];

  @override
  void onInit() {
    super.onInit();
    selectedOption.value = options.first;
    notelp.text;
  }

  final notelp = TextEditingController();
  final alamat = TextEditingController();
  var display = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  Future signup(String email, String password, String? address, String? nohp,
      String display, String role) async {
    try {
      if (password.length < 8) {
        // Display dialog for weak password
        Get.defaultDialog(
          title: "Password Error",
          middleText: "Password harus memiliki minimal 8 karakter.",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "Oke",
        );
        return; // Exit the function since the password is too weak
      }
      UserCredential Myuser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await Myuser.user?.sendEmailVerification();
      await FirebaseAuth.instance.currentUser!.updateDisplayName(display);
      await FirebaseFirestore.instance
          .collection('bengkel88')
          .doc(Myuser.user!.uid)
          .set({
        'Email': email,
        'password': password,
        'Alamat': alamat.text,
        'phoneNumber': notelp.text,
        'role': selectedOption.value,
      });

      Get.defaultDialog(
          title: "Verifikasi email",
          middleText: "Kami telah mengirimkan email verifikasi ke $email",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ya,Saya akan cek email");

      String userId = Myuser.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
            title: "Password Error",
            middleText: "Mohon Periksa Kembali password anda",
            onConfirm: () {
              Get.back();
              Get.back();
            },
            textConfirm: "Oke");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> numberphoneupdate() {
   
    return FirebaseFirestore.instance
        .collection('bengkel88')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'phoneNumber': notelp.text});
  }
 
  @override
  void dispose() {
    alamat.dispose();
    notelp.dispose();
    super.dispose();
  }

  void signInWithGoogle() async {
    // firebase validation
    try {
      isLoading.value = true;

      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (firebaseError) {
      isLoading.value = false;

      KGSnackBar.showKGSnackBar(Get.context!, '$firebaseError',
          backgroundColor: Colors.red);
      _googleSignIn.signOut();
    } catch (error) {
      print('error: $error');
      isLoading.value = false;
      if (error
          .toString()
          .contains('At least one of ID token and access token is required')) {
        return;
      }
      KGSnackBar.showKGSnackBar(Get.context!, '$error',
          backgroundColor: Colors.red);
      _googleSignIn.signOut();
    }

    try {
      final user = auth.currentUser;

      if (user != null) {
        List<String?> providerList = [];
        for (final providerProfile in user.providerData) {
          final provider = providerProfile.providerId;

          print('PROVIDER ID: $provider');
          providerList.add(provider);
          _storage.write('provider', providerList);
        }

        isLoading.value = false;
        Get.offAllNamed(TourRout.Home);
      }
    } catch (e) {
      isLoading.value = false;
      KGSnackBar.showKGSnackBar(Get.context!, '$e',
          backgroundColor: Colors.red);
      _googleSignIn.signOut();
    }
  }

  void login(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        Fluttertoast.showToast(
            msg: "Masukkan email dan password yang valid",
            gravity: ToastGravity.TOP);
      } else if (password.isEmpty) {
        Fluttertoast.showToast(
            msg: "Password tidak boleh kosong", gravity: ToastGravity.TOP);
      } else if (email.isEmpty) {
        Fluttertoast.showToast(
            msg: "Email tidak boleh kosong", gravity: ToastGravity.TOP);
      } else if (password.length < 5) {
        Fluttertoast.showToast(
            msg: "Masukkan password dengan benar", gravity: ToastGravity.TOP);
      } else if (email == RegExp("^[a-zA-Z0-9_.-]+@[a-zA-Z]+[.]+[a-z]")) {
        Fluttertoast.showToast(
            msg: "Masukkan email dan password yang valid",
            gravity: ToastGravity.TOP);
      }
      isLoading.value = true;
       await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final user = auth.currentUser;

      if (user != null) {
        List<String?> providerList = [];
        for (final providerProfile in user.providerData) {
          final provider = providerProfile.providerId;

          print('PROVIDER ID: $provider');
          providerList.add(provider);
          _storage.write('provider', providerList);
          providerList.add(provider);
          _storage.write('provider', providerList);
        }
        isLoading.value = false;
      }

      if (user!.emailVerified == true) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await firestore.collection('bengkel88').doc(user.uid).get();
        String role = snapshot.data()!['role'];

        if (role == 'admin') {
          Get.offAllNamed('/beranda-admin');
          Get.defaultDialog(
              title: "Halo",
              middleText: "Selamat Datang Admin",
              cancel: ElevatedButton(
                  onPressed: () => Get.back(), child: Text("Oke")));
        } else if (role == 'pelanggan') {
          Get.offAllNamed(TourRout.Home);

          Get.defaultDialog(
              title: "Selamat Datang",
              middleText:
                  "Selamat datang di halaman utama $email! \n Mohon di baca Buku panduan terlebih dahulu",
              cancel: ElevatedButton(
                  onPressed: () => Get.back(), child: Text("Oke")));
        }
      } else {
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "Mohon Verifikasi email anda $email",
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: "${e.message}", gravity: ToastGravity.TOP);
      isLoading.value = false;
      print('FIREBASE AUTH EXCEPTION : ${e.code}');
      // if (e.code == 'user-not-found') {
      //   Get.defaultDialog(
      //       title: "Pengguna tidak ditemukan",
      //       middleText:
      //           "Email tidak ditemukan anda sudah mengisi email dengan benar",
      //       onConfirm: () {
      //         Get.back();
      //       },
      //       textConfirm: "Oke");
      //   print('email tidak di temukan');
      // } else if (e.code == 'wrong-password') {
      //   Get.defaultDialog(
      //       title: "Kata sandi salah",
      //       middleText: "Pastikan anda sudah mengisi kata sandi dengan benar",
      //       onConfirm: () {
      //         Get.back();
      //       },
      //       textConfirm: "Oke");
      //   print('Wrong password provided for that user.');
      // } else if (e.code == 'unknow') {
      //   showDialog(
      //     context: Get.context!,
      //     builder: (context) => KGDialog(
      //       filePath: 'assets/icons/exclamation_sign.svg',
      //       actionsDirection: ActionsDirection.horizontal,
      //       imageHeight: 50.0,
      //       imageWidth: 50.0,
      //       title: 'Sepertinya ada masalah',
      //       middleText:
      //           'Untuk melanjutkan isi email dan password anda terlebih dahulu',
      //       textCancel: 'Kembali',
      //       onCancel: () => Get.back(),
      //     ),
      //   );
      // }
    }
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.amber, content: Text(message.toString())));
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.toNamed('/Log-in');
  }

  Future<void> resetpassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: 'Berhasil',
            middleText: 'Kami sudah mengirim reset password ke email $email',
            onConfirm: () {
              Get.back();
              Get.back();
            },
            textConfirm: 'Saya sudah mengerti');
      } catch (e) {
        Get.defaultDialog(
            title: 'Terjadi kesalahan',
            middleText: 'Tidak dapat mengirimkan reset password');
      }
    } else {
      Get.defaultDialog(
          title: 'Terjadi kesalahan', middleText: 'Email tidak valid');
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile != null) {
      imagefile = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> _updateProfilePicture() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    final Reference storageRef =
        FirebaseStorage.instance.ref().child(user!.uid);

    try {
      await storageRef.putFile(imagefile!);
      final String downloadURL = await storageRef.getDownloadURL();
      await user.updatePhotoURL(downloadURL);
      print("Profile picture updated successfully");
    } catch (e) {
      print("Error updating profile picture: $e");
    }

    //   Get.defaultDialog(
    //       title: "Verifikasi email",
    //       middleText: "Kami telah mengirimkan email verifikasi ke $email",
    //       onConfirm: () {
    //         Get.back();
    //         Get.back();
    //       },
    //       textConfirm: "Ya,Saya akan cek email");
  }

  Future<void> updateDisplayName(String newName) async {
    try {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(newName);
      // Update display name in Firebase Firestore or Realtime Database, if necessary.
    } catch (e) {
      print("Error updating display name: $e");
    }
  }

  Future<void> verifyPhoneNumber() async {
    final phoneNumber = phoneNumberController.text.trim();
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await FirebaseAuth.instance.currentUser
          ?.updatePhoneNumber(phoneAuthCredential);
      // Phone number successfully verified and updated
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      // Verification failed
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      _verificationId = verificationId;
      // Verification code sent to the provided phone number
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
      // Auto retrieval timeout for verification code
    };

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      // Handle error verifying phone number
    }
  }

  Future<void> updatePhoneNumber() async {
    final smsCode = phoneNumberController.text.trim();

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.currentUser?.updatePhoneNumber(credential);
      // Phone number successfully updated
    } catch (e) {
      // Handle error updating phone number
    }
  }

  void addData() async {}
}
