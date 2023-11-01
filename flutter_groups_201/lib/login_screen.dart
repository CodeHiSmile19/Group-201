import 'package:flutter/material.dart';
import 'package:flutter_groups_201/models/account_entity.dart';
import 'package:flutter_groups_201/services/isar_service.dart';

import 'bottom_bar_screen/bottom_bar_screen2.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController accountController;
  late TextEditingController passwordController;

  @override
  void initState() {
    accountController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng nhập"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Tài khoản"),
              TextFormField(
                controller: accountController,
              ),
              const SizedBox(height: 24),
              const Text("Mật khẩu"),
              TextFormField(
                controller: passwordController,
              ),
              const SizedBox(height: 48),
              InkWell(
                onTap: () async {
                  ///Khởi tạo Isar service
                  final isar = IsarService();

                  ///Lấy được account chúng ta nhập
                  final userName = accountController.text;

                  ///Lấy được mật khẩu mình nhập
                  final password = passwordController.text;

                  ///Gọi hàm create account để lưu account vào device máy
                  final account = AccountEntity(
                    username: userName,
                    password: password,
                  );

                  final result = await isar.createAccount(account);

                  ///Nếu tạo được thì navigate vào màn Home
                  if (result) {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomBarScreen2(),
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}