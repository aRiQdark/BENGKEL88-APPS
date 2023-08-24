import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Informasi extends StatelessWidget {
  const Informasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: const Color(0xff35BCAC),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
              height: 270,
              width: Get.width,
              decoration: const BoxDecoration(color: Color(0xff35BCAC)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                      alignment: Alignment.center,
                      heightFactor: 3,
                      child: Text(
                        "Mari pesan dan melakukan reservasi \n dengan mudah",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        "assets/icons/logo88.jpg",
                        fit: BoxFit.scaleDown,
                      )),

                    
                ],
              )),
                Center(
                  heightFactor: 4,
                        child: Column(
                          children: [
                            Text("Bengkel 88 Motor Tarutung",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 8,),
                            Text("Reservasi dan pemesanan"),

                            InkWell(
                              onTap: () => Get.toNamed('/informasi-bengkel-detail'),
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(color: Color(0xffE17D7D),borderRadius: BorderRadius.circular(60)),
                                child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                              ),
                            )
                          ],
                        ),
                      )
        ],
      ),
    );
  }
}
