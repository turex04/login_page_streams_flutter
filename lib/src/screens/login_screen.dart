import 'package:flutter/material.dart';
import 'package:bloc_login/src/blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _emailField(),
          Container(margin: const EdgeInsets.only(top: 25.0)),
          _passwordField(),
          Container(margin: const EdgeInsets.only(top: 30.0)),
          _signInButton(),
        ],
      ),
    );
  }

  Widget _emailField() {
    return StreamBuilder(
        stream: loginBloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // if (snapshot.connectionState == ConnectionState.done) {
            return TextField(
              onChanged: loginBloc.emailSink.add,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "name@email.com",
                icon: const Icon(Icons.email),
                // errorText: snapshot.hasError ? snapshot.error.toString(): null,
                errorText: snapshot.error?.toString(),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              ),
            );
          // } else {
          //   return const CircularProgressIndicator();
          // }
        });
  }

  Widget _passwordField() {
    return StreamBuilder(
        stream: loginBloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return TextField(
            onChanged: loginBloc.passwordSink.add,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "password",
              icon: const Icon(Icons.security),
              errorText: snapshot.error?.toString(),
              suffixIcon: const Icon(Icons.visibility_off_outlined),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          );
        });
  }

  Widget _signInButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Text('Sign In'),
        onPressed: () {},
      ),
    );
  }
}
