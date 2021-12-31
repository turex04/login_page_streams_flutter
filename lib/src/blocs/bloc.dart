import 'dart:async' show StreamController, StreamSink, Stream;
import 'package:bloc_login/src/blocs/validators.dart';

class Bloc with Validators {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  StreamSink<String> get emailSink => _emailController.sink;
  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  StreamSink<String> get passwordSink => _passwordController.sink;
  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);

  // Function(String) get changePassword => _passwordController.sink.add;
  // Stream<String> get password => _passwordController.stream.transform(validatePassword);

  // Function(String) get changeEmail => _emailController.sink.add;
  // Stream<String> get email => _emailController.stream.transform(validateEmail);

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final loginBloc = Bloc();
