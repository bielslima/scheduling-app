import 'package:flutter/material.dart';
import 'package:scheduling_app/src/presentation/pages/login/view/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      home: const LoginPage(),
    );
  }
}
