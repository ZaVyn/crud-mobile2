import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/controllers/auth_controller.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password Screen'),
        centerTitle: true,
      ),
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
                    "RESET PASSWORD",
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
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                cAuth.resetPassword(
                  controller.cEmail.text,
                );
              },
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}