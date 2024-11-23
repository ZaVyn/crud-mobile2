import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                // Menambahkan logo
                // Image.network(
                //   'https://logospng.org/download/android/logo-android-4096.png', // Ganti dengan path gambar logo kamu
                //   height: 150, // Atur ukuran logo sesuai kebutuhan
                // ),
                Container(
                  child: Text(
                    "SIGNUP SCREEN",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Jarak antara logo dan form
              ],
            ),
            TextField(
              controller: controller.cEmail,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: controller.cPass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                cAuth.signup(
                  controller.cEmail.text,
                  controller.cPass.text,
                );
              },
              child: Text("Signup"),
            ),
          ],
        ),
      ),
    );
  }
}