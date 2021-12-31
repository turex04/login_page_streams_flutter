// import 'package:bloc_login/src/blocs/login_blocs.dart' show loginBloc;
import 'package:bloc_login/src/blocs/bloc_inherited_widget.dart';
import 'package:bloc_login/src/blocs/login_blocs.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocInheritedState.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            emailField(loginBloc),
            passwordField(loginBloc),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            submitButton(loginBloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(LoginBloc loginBloc) {
    return StreamBuilder<Object>(
        stream: loginBloc.getEmail,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            onChanged: loginBloc.changeEmail.add,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error?.toString(),
            ),
          );
        });
  }

  Widget passwordField(LoginBloc loginBloc) {
    return StreamBuilder(
        stream: loginBloc.getPassword,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            onChanged: loginBloc.changePassword.add,
            obscureText: true,
            decoration: InputDecoration(
              hintText: '********',
              labelText: 'Password',
              errorText: snapshot.error?.toString(),
            ),
          );
        });
  }

  Widget submitButton(LoginBloc loginBloc) {
    return StreamBuilder<Object>(
        stream: loginBloc.validateLogin,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ElevatedButton(
            onPressed: snapshot.hasData ? loginBloc.submitForm : null,
            child: const Text('Login'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          );
        });
  }
}
