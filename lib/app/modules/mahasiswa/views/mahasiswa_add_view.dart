import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_if22b/app/modules/mahasiswa/controllers/mahasiswa_controller.dart';

class MahasiswaAddView extends GetView<MahasiswaController> {  
  const MahasiswaAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MahasiswaAddView'),
        centerTitle: true,
      ),
      body: Padding(
       padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.cNama,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.cNpm,
              decoration: const InputDecoration(
                labelText: 'NPM',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.cAlamat,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                // Logic for form submission goes here
                controller.add(
                    controller.cNpm.text,
                    controller.cNama.text,
                    controller.cAlamat.text,
                  );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
