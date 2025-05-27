import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/log_in_bloc.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return LogInBloc();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Log In"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Username'),
                  controller: usernameController,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Password'),
                  obscureText: true,
                  controller: passwordController,
                ),
                OutlinedButton(
                  onPressed: () {
                    context.read<LogInBloc>().add(LoggedInEvent());
                  },
                  child: Text("Log In"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
