import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobstreet/controller/Auth/authentikasi.dart';
import 'package:jobstreet/controller/controllerAuth.dart';
import 'package:jobstreet/view/ViewAuth/Auth/resetpassword.dart';
import 'package:jobstreet/widget/primary_textfield.dart';
import 'package:lottie/lottie.dart';

class Login extends GetView<Logincontroller> {
  Login({super.key});

  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final authC = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Lottie.asset('assets/lottie/68312-login.json')
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'SIGN IN',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 260,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryTextfield(
                controller: emailC,
                hintText: 'Cth. email-kamu@mail.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp("^[a-zA-Z0-9_.-]+@[a-zA-Z]+[.]+[a-z]")
                      .hasMatch(value)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
               height: 60,
              width: 260,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => PrimaryTextfield(
                  hintText: "Masukkan kata sandi",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: passwordC,
                      obscureText: controller.passwordIsHidden.value,
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        icon: controller.passwordIsHidden.value == true
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined),
                        onPressed: () {
                          controller.passwordIsHidden.toggle();
                        },
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xffCD5C5C),
                  ),
                  child: InkWell(
                    onTap: () => authC.login(
                      emailC.text,
                      passwordC.text,
                    ),
                    child: const Center(
                      child: Text(
                        'MASUK',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xff32CD32),
                  ),
                  child: InkWell(
                    onTap: () => Get.toNamed('/Registrasi'),
                    child: const Center(
                      child: Text(
                        'Registrasi',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(child: Text('OR')),
            const SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () => Get.toNamed('/Reset-password'),
                child: Text(
                  "Reset Password",
                  style: TextStyle(color: Colors.blue),
                )),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => authC.signInWithGoogle(),
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/facebook.png',
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
