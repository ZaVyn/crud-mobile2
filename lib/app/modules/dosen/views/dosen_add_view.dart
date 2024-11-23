import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_if22b/app/modules/dosen/controllers/dosen_controller.dart';

class DosenAddView extends GetView<DosenController> {
  const DosenAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DosenAddView'),
        centerTitle: true,
      ),
      body: Padding(
       padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.cNidn,
              decoration: const InputDecoration(
                labelText: 'NIDN',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.cNama,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.cProdi,
              decoration: const InputDecoration(
                labelText: 'Prodi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.cFakultas,
              decoration: const InputDecoration(
                labelText: 'Fakultas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                // Logic for form submission goes here
                controller.add(
                    controller.cNidn.text,
                    controller.cNama.text,
                    controller.cProdi.text,
                    controller.cFakultas.text,
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
