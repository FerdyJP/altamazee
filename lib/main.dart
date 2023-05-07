import 'package:altamazee/providers/product_provider.dart';
import 'package:altamazee/providers/search_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/detail_chat_page.dart';
import 'pages/home/cart_page.dart';
import 'pages/home/checkout_page.dart';
import 'pages/home/checkout_success_page.dart';
import 'pages/home/edit_profile_page.dart';
import 'pages/home/main_page.dart';
import 'pages/home/product_page.dart';
import 'pages/home/search_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/splash_page.dart';
import 'providers/auth_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/', //TODO: ADD INITIAL ROUTE
        routes: {
          '/': (_) => const SplashPage(),
          '/sign-in': (_) => const SignInPage(),
          '/sign-up': (_) => const SignUpPage(),
          '/home': (_) => const MainPage(),
          '/detail-chat': (_) => const DetailChatPage(),
          '/edit-profile': (_) => const EditProfilePage(),
          '/product': (_) => const ProductPage(),
          '/cart': (_) => const CartPage(),
          '/checkout': (_) => const CheckoutPage(),
          '/checkout-success': (_) => const CheckoutSuccessPage(),
          '/search-page': (_) => const SearchPage(),
        },
      ),
    );
  }
}
