import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../components/white_button_component.dart';
import '../data/image_data.dart';
import '../routes/app_routes.dart';
import '../utils/theme_util.dart';
import '../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String version = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    setVersion();
    super.initState();
  }

  Future<void> setVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  void showPlayDialog() {
    showModalBottomSheet<dynamic>(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              OutlinedButton(
                onPressed: showRegisterDialog,
                child: const Text('Cadastrar uma nova conta'),
              ),
              ElevatedButton(
                onPressed: showLoginDialog,
                child: const Text('Entrar'),
              ),
            ],
          ),
        );
      },
    );
  }

  void showRegisterDialog() {
    pop(context);
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Cadastrar uma nova conta!'),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 2),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Informe o e-mail',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Informe a senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirme a senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showLoginDialog() {
    pop(context);
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Faça login na sua conta!'),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 2),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Informe o e-mail',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Informe a senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: login,
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> login() async {
    pop(context);
    pushReplacementNamed(context, homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(loginBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'Battle RPG',
                    style: garudaBoldStyle().copyWith(
                      fontSize: 50,
                      color: Colors.white,
                      shadows: shadows,
                    ),
                  ),
                ),
              ),
              Center(
                child: WhiteButtonComponent(
                  text: 'Jogar',
                  callback: showPlayDialog,
                ),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 4,
                    left: 4,
                  ),
                  child: Text(
                    'CL Games',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 4,
                    right: 4,
                  ),
                  child: Text(
                    'Versão: $version',
                    style: const TextStyle(
                      color: Colors.white,
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
