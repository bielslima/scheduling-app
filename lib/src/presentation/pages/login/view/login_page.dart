import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scheduling_app/src/presentation/constants/app_assets.dart';
import 'package:scheduling_app/src/presentation/pages/home/view/home_page.dart';
import 'package:scheduling_app/src/presentation/themes/app_theme_helper.dart';
import 'package:scheduling_app/src/presentation/widgets/sc_button.dart';
import 'package:scheduling_app/src/presentation/widgets/sc_input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              SvgPicture.asset(AppAssets.logoLogin, semanticsLabel: 'App Logo'),
              const _FormLogin()
            ],
          ),
        ),
      ),
    );
  }
}

class _FormLogin extends StatelessWidget {
  const _FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 32.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScInputText(),
          const SizedBox(
            height: 8,
          ),
          const ScInputText(),
          const SizedBox(
            height: 16,
          ),
          ScButton(
            child: const Text('Entrar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
