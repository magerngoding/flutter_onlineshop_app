import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/core/constants/colors.dart';
import 'package:flutter_onlineshop_app/core/router/app_router.dart';
import 'package:flutter_onlineshop_app/data/datasource/category_remote_datasource.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/home/bloc/category/category_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return BlocProvider(
      create: (context) => CategoryBloc(
        CategoryRemoteDataSource(),
      ),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(
                color: AppColors.black.withOpacity(0.05),
              ),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
