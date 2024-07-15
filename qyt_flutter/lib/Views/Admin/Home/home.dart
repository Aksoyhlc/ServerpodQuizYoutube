import 'package:flutter/material.dart';
import 'package:qyt_flutter/Views/Widgets/global_app_Bar.dart';

import '../Layout/Shared/Drawer/drawer.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            GlobalAppBar(title: "Admin Home Page"),
          ],
        ),
      ),
    );
  }
}
