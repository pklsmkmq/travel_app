import 'package:go_router/go_router.dart';
import 'package:traver_v2/presentation/page/forgot_page.dart';
import 'package:traver_v2/presentation/page/home.dart';
import 'package:traver_v2/presentation/page/introduction.dart';
import 'package:traver_v2/presentation/page/login_page.dart';
import 'package:traver_v2/presentation/page/otp_page.dart';
import 'package:traver_v2/presentation/page/register_page.dart';
import 'package:traver_v2/presentation/page/splash_page.dart';
import 'package:traver_v2/presentation/page/success_page.dart';

part 'route_name.dart';

final appRoute = GoRouter(routes: [
  GoRoute(
    path: "/",
    name: Routes.splash,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: "/introduction",
    name: Routes.introduction,
    builder: (context, state) => Introduction(),
  ),
  GoRoute(
      path: "/login",
      name: Routes.login,
      builder: (context, state) => LoginScreen(),
      routes: [
        GoRoute(
            path: "register",
            name: Routes.register,
            builder: (context, state) => RegisterScreen(),
            routes: [
              GoRoute(
                  path: "verify",
                  name: Routes.otp,
                  builder: (context, state) => OtpVerification(),
                  routes: [
                    GoRoute(
                        path: "success",
                        name: Routes.success,
                        builder: (context, state) => NotifSuccesScreen())
                  ])
            ]),
        GoRoute(
          path: "forgot",
          name: Routes.forgot,
          builder: (context, state) => ForgotPasswordScreen(),
        ),
        GoRoute(
          path: "home",
          name: Routes.home,
          builder: (context, state) => HomeScreen(),
        ),
      ]),
]);
