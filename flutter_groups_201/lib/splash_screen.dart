import 'package:flutter/material.dart';
import 'package:flutter_groups_201/login_screen.dart';
import 'package:flutter_groups_201/services/isar_service.dart';

import 'bottom_bar_screen.dart';
import 'bottom_bar_screen/bottom_bar_screen2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // initPage();
    super.initState();
  }

  void initPage() async {
    ///Open Isar service
    final isar = IsarService();

    ///1. Kiểm tra xem có tài khoản đăng nhập không
    final listAccount = await isar.getAllAccounts();

    ///1.1. Nếu có TK đăng nhập thì router vào màn Home
    if (listAccount.isNotEmpty) {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBarScreen2(),
          ),
        );
      }
    } else {
      ///1.2. Nếu không có TK thì vào màn login
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF1D2D50),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Shopping Food App",
                style: TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () async {
                  ///Open Isar service
                  final isar = IsarService();

                  ///1. Kiểm tra xem có tài khoản đăng nhập không
                  final listAccount = await isar.getAllAccounts();

                  ///1.1. Nếu có TK đăng nhập thì router vào màn Home
                  if (listAccount.isNotEmpty) {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomBarScreen2(),
                        ),
                      );
                    }
                  } else {
                    ///1.2. Nếu không có TK thì vào màn login
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 36,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF1D2D50),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
