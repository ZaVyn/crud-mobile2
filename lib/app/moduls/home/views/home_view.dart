import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_if22b/app/controllers/auth_controller.dart';
import 'package:latihan_if22b/app/modules/dosen/views/dosen_add_view.dart';
import 'package:latihan_if22b/app/modules/dosen/views/dosen_view.dart';
import 'package:latihan_if22b/app/modules/mahasiswa/views/mahasiswa_add_view.dart';
import 'package:latihan_if22b/app/modules/mahasiswa/views/mahasiswa_view.dart';
import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return DashboardAdmin();
  }
}

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  List<Map> _fragment = [
    {
      "title": "Dashboard",
      "view": MahasiswaView(),
      "add": () => MahasiswaAddView()
    },
    {
      "title": "Data Mahasiswa",
      "view": MahasiswaView(),
      "add": () => MahasiswaAddView()
    },
    {
      "title": "Data Dosen",
      "view": DosenView(),
      "add": () => DosenAddView()
    },
    {
      "title": "Data Pegawai",
      "view": MahasiswaView(),
      "add": () => MahasiswaAddView()
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          ),
        titleSpacing: 0,
        title: Text(_fragment[_index]['title']),
        actions: [
          IconButton(
          onPressed: () {
            Get.to(_fragment[_index]
            ["add"]);
          },
          icon: Icon(
            Icons.add_box_rounded,
            size: 35,
            color: Colors.white,
            ),
          )
        ],
      ),
       body: _fragment[_index]['view'],
    );
  }
  Widget drawer() {
   
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  CircleAvatar(
                    radius: 44,
                    backgroundImage: NetworkImage(
                      'https://thumb.tvonenews.com/thumbnail/2024/09/19/66eb952c3f16d-ishowspeed-kenakan-seragam-timnas-indonesia_1265_711.jpg'
                    ),
                  ),
                  Text(
                    "Aqgit Ariya Kusuma",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              setState(() => _index = 0);
              Get.back();
            },
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.black,
            textColor: Colors.black,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Mahasiswa'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.black,
            textColor: Colors.black,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Dosen'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.black,
            textColor: Colors.black,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Pegawai'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.black,
            textColor: Colors.black,
          ),
          const Divider(
            color: Colors.black54,
            ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.black,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}