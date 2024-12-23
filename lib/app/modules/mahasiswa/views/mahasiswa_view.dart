import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_if22b/app/modules/mahasiswa/views/mahasiswa_update_view.dart';

import '../controllers/mahasiswa_controller.dart';

class MahasiswaView extends GetView<MahasiswaController> {

  void ShowOption(id) async {
    var result = await Get.dialog(SimpleDialog(
      children: [
        ListTile(
          onTap: () {
            Get.back();
            Get.to(
              MahasiswaUpdateView(),
              arguments: id,
            );
          },
          title: Text("Update"),
        ),
        ListTile(
          onTap: () {
            Get.back();
            controller.delete(id);
          },
          title: Text("Delete"),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child:const Text("Close"),
        ),
      ],
    ),
    barrierDismissible: false,
    );
  } 
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: Get.put(MahasiswaController()).streamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // ambil data dari Firebase
          var listAllDocs = snapshot.data?.docs ?? [];
          return listAllDocs.length > 0
              ? ListView.builder(
                itemCount: listAllDocs.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
                    subtitle: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["npm"]}"),
                    trailing: IconButton(
                      onPressed: () {
                        ShowOption(listAllDocs
                        [index].id);
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
                )
              : Center(
                  child: Text("Data kosong"),
                );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
