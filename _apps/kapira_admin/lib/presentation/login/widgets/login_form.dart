part of '../login_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final ValueNotifier<bool> showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = ValueNotifier(false);
  }

  @override
  void dispose() {
    showPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.kTheme.cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: DragHandle(
                  color: context.kTheme.handleColor,
                ),
              ),
              const SizedBox(height: 10),
              const Text('Username'),
              const SizedBox(height: 10),
              TextFormField(),
              const SizedBox(height: 20),
              const Text('Password'),
              const SizedBox(height: 10),
              ValueListenableBuilder<bool>(
                  valueListenable: showPassword,
                  builder: (context, isVisible, child) {
                    return TextFormField(
                      obscureText: !isVisible,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () => showPassword.value = !showPassword.value,
                          child: Icon(
                            isVisible ? KapiraIcon.eye_off : KapiraIcon.eye,
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              Row(
                children: [
                  CheckboxLabel(
                    value: true,
                    label: 'Remember Me',
                    onChanged: (remeber) {},
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  )
                ],
              ),
              const SizedBox(height: 15),
              ElevatedGradientButton(
                onPressed: () {},
                gradient: const LinearGradient(colors: [
                  Color(0xFF4769DC),
                  Color(0xFFAF69B3),
                ]),
                child: const Text('SIGN IN'),
              ),
              const SizedBox(height: 20),
              Align(
                child: Text(
                  'Or Login With',
                  style: context.labelSmall,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(KapiraIcon.facebook_circle),
                      label: const Text('Facebook'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.kTheme.facebookColor,
                        foregroundColor: context.kTheme.secondary0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'lib/images/google-icon.svg',
                        package: 'assets',
                        height: 24,
                        width: 24,
                      ),
                      label: const Text('Google'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: context.kTheme.secondary0,
                        side: BorderSide(
                          color: context.kTheme.backgroundColor,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Align(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    children: const [
                      TextSpan(
                        text: 'Register Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFAF69B3),
                        ),
                      )
                    ],
                    style: TextStyle(
                      color: context.kTheme.secondary2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
