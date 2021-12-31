import 'dart:async';
import 'package:bloc_login/src/blocs/validators.dart';
import 'package:rxdart/rxdart.dart' show CombineLatestStream, BehaviorSubject;

class LoginBloc extends Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get getEmail =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get getPassword =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get validateLogin =>
      CombineLatestStream.combine2(getEmail, getPassword, (e, p) => true);

  StreamSink<String> get changeEmail => _emailController.sink;
  StreamSink<String> get changePassword => _passwordController.sink;

  submitForm() {
    final String validEmail = _emailController.value;
    final String validPassword = _emailController.value;

    print("Email is ${validEmail} and Password is ${validPassword}");
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

// final loginBloc = LoginBloc();
// final _emailController = StreamController<String>.broadcast();
