import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imovelhub/controllers/loginController.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  CustomAppBar({super.key, this.height = kToolbarHeight});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Image.asset('assets/images/logo.png', height: 100),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'logout') {
              controller.logout();
            }
          },
          icon: const Icon(Icons.more_vert, color: Colors.black),
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      'Sair',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ];
          },
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
