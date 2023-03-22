import 'package:go_router/go_router.dart';
import 'package:kapira_admin/presentation/login/login_page.dart';
import 'package:router/router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppPage.LOGIN.path,
      builder: (_, __) => const LoginPage(),
    ),
  ],
  initialLocation: AppPage.LOGIN.path,
);
