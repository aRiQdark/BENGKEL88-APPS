// ignore: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:jobstreet/Routes/routes.dart';
import 'package:jobstreet/Utils/Loadingpage.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';



import 'firebase_options.dart';

void main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 

  runApp(Home());
}

class Home extends StatelessWidget {
  Home({super.key});
  final authC = Get.put(Authcontroller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.stremAuthStatus(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.active ) {
            return GetMaterialApp(
                title: "Application",
                debugShowCheckedModeBanner: false,
                // home: snapshot.data != null ? View() : Login(),
                getPages: TourRout.Page,
                
                initialRoute:
                    snapshot.data != null && snapshot.data!.emailVerified
                        ? TourRout.Home
                        : TourRout.Onboarding

             
                );
          }
          return LoadingPage();
        }
        );
  }
}
