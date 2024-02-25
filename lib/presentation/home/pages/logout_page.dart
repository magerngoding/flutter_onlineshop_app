// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/core/router/app_router.dart';
import 'package:flutter_onlineshop_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:go_router/go_router.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<LogoutBloc, LogoutState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: () {
                context.goNamed(
                  RouteConstants.root,
                  pathParameters: PathParameters().toMap(),
                );
              },
              erorr: (message) {
                context.goNamed(
                  RouteConstants.login,
                  // pathParameters: PathParameters().toMap(),
                );
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: Text(message),
                //   backgroundColor: Colors.red,
                // ));
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return ElevatedButton(
                    onPressed: () {
                      context.read<LogoutBloc>().add(
                            LogoutEvent.logout(),
                          );
                    },
                    child: Text('Logout'));
              },
              loading: () {
                return CircularProgressIndicator();
              },
            );
          },
        ),
      ),
    );
  }
}
