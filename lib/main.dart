import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/core/constants/colors.dart';
import 'package:flutter_onlineshop_app/core/router/app_router.dart';
import 'package:flutter_onlineshop_app/data/datasource/address_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasource/category_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasource/order_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasource/product_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/best_seller_product/best_seller_product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/special_offer_product/special_offer_product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/bloc/cost/cost_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/bloc/history_order/history_order_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/bloc/order/order_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/bloc/order_detail/order_detail_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/bloc/status_order/status_order_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/bloc/tracking/tracking_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/datasource/firebase_messaging_remote_datasource.dart';
import 'presentation/address/bloc/add_address/add_address_bloc.dart';
import 'presentation/address/bloc/address/address_bloc.dart';
import 'presentation/home/bloc/category/category_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //panggil
  await FirebaseMessagingRemoteDatasource().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(
            CategoryRemoteDataSource(),
          ),
        ),
        BlocProvider(
          create: (context) => AllProductBloc(
            ProductRemoteDataSource(),
          ),
        ),
        BlocProvider(
          create: (context) => BestSellerProductBloc(
            ProductRemoteDataSource(),
          ),
        ),
        BlocProvider(
          create: (context) => SpecialOfferProductBloc(
            ProductRemoteDataSource(),
          ),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(
            AuthRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(
            AuthRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => AddressBloc(
            AddressRemoteDataSource(),
          ),
        ),
        BlocProvider(
          create: (context) => AddAddressBloc(
            AddressRemoteDataSource(),
          ),
        ),
        BlocProvider(
          create: (context) => ProvinceBloc(
            RajaOngkirRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => CityBloc(
            RajaOngkirRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => SubdistrictBloc(
            RajaOngkirRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => CostBloc(
            RajaOngkirRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => OrderBloc(
            OrderRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => StatusOrderBloc(
            OrderRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => HistoryOrderBloc(
            OrderRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => OrderDetailBloc(
            OrderRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => TrackingBloc(
            RajaOngkirRemoteDatasource(),
          ),
        ),
      ],
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
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
