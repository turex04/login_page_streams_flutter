import 'package:bloc_login/src/blocs/login_blocs.dart';
import 'package:flutter/material.dart';

class BlocInheritedState extends InheritedWidget {
  final loginBloc = LoginBloc();
  BlocInheritedState({Key? key, required Widget child})
      : super(key: key, child: child);

  static LoginBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<BlocInheritedState>()!
        .loginBloc;
    // return (context.dependOnInheritedWidgetOfExactType(aspect: BlocInheritedState) as BlocInheritedState).loginBloc;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
