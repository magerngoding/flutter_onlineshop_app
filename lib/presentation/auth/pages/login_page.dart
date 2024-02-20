// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(0, 7),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              color: Colors.green[50],
            ),
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              children: [
                const Text(
                  'Login Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Hello, welcome back to our account',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(50.0),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email ID',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Assets.icons.email.svg(),
                    ),
                  ),
                ),
                const SpaceHeight(20.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Assets.icons.password.svg(),
                    ),
                  ),
                ),
                const SpaceHeight(50.0),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (data) {
                        AuthLocalDatasource()
                            .saveAuthData(data); // simpan data dilocal
                        context.goNamed(RouteConstants.root,
                            pathParameters: PathParameters().toMap());
                      },
                      erorr: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.red,
                            content: Text(message),
                          ),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Button.filled(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginEvent.login(
                                      email: emailController.text,
                                      password: passwordController.text),
                                );
                            ;
                          },
                          label: 'Login',
                        );
                      },
                      loading: () {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(50.0),
                InkWell(
                  onTap: () {
                    context.goNamed(RouteConstants.register);
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Not Registered yet? ',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'Create an Account',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
