import 'package:assets/assets.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widgets/buttons.dart';
import 'package:widgets/checkbox_label.dart';
import 'package:widgets/drag_handle.dart';

part 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/images/soccer-board.jpg',
            package: 'assets',
            height: context.height * 4.5 / 11,
            fit: BoxFit.cover,
            color: context.kTheme.cardColor,
            colorBlendMode: BlendMode.modulate,
          ),
          Column(
            children: const [
              Expanded(
                flex: 4,
                child: SizedBox.shrink(),
              ),
              Expanded(
                flex: 7,
                child: LoginForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
