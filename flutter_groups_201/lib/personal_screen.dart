import 'package:flutter/material.dart';
import 'package:flutter_groups_201/login_screen.dart';
import 'package:flutter_groups_201/services/isar_service.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            ///Khởi tạo Isar service
            final isar = IsarService();

            final accounts = await isar.getAllAccounts();

            final result = await isar.deleteAccount(accounts[0]);

            ///Nếu xóa được thì navigate vào màn Login
            if (result) {
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
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                "Đăng xuất",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
