import 'package:bloc_login/src/blocs/bloc_inherited_widget.dart';
import 'package:bloc_login/src/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocInheritedState(
      child: MaterialApp(
        title: 'Log Me In',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        darkTheme: ThemeData.dark(),
        home: const Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
