import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:widgets/drag_handle.dart';

part 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(
            flex: 4,
            child: SizedBox.shrink(),
          ),
          Expanded(
            flex: 6,
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}
