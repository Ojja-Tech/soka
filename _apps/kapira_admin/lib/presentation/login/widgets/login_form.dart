part of '../login_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.kTheme.cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
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
            Text('Username'),
            TextFormField()
          ],
        ),
      ),
    );
  }
}
