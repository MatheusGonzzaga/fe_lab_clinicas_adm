import '../../repositories/user/user_repository.dart';

import '../../repositories/user/user_repository_impl.dart';
import 'login_controller.dart';
import 'login_page.dart';
import '../../services/login/user_login_service.dart';
import '../../services/login/user_login_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LoginRouter extends FlutterGetItPageRouter {
  const LoginRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>(
            (i) => UserRepositoryImpl(restClient: i())),
        Bind.lazySingleton<UserLoginService>(
            (i) => UserLoginServiceImpl(userRepository: i())),
        Bind.lazySingleton<LoginController>(
            (i) => LoginController(loginService: i())),
      ];

  @override
  WidgetBuilder get view => (_) => const LoginPage();

  @override
  String get routeName => '/login';
}
