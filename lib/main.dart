import 'package:cred/ui/pages/authentication/carddetails.dart';
import 'package:cred/ui/pages/authentication/login.dart';
import 'package:cred/ui/pages/authentication/registration.dart';
import 'package:cred/ui/pages/cards/CardsPage.dart';
import 'package:cred/ui/pages/cards/CardsPageBinding.dart';
import 'package:cred/ui/pages/centraltab/CentralPage.dart';
import 'package:cred/ui/pages/centraltab/CentralPageBinding.dart';
import 'package:cred/ui/pages/club/ClubPage.dart';
import 'package:cred/ui/pages/club/ClubPageBinding.dart';
import 'package:cred/ui/pages/dashboard/DashboardBinding.dart';
import 'package:cred/core/AppConstants.dart';
import 'package:cred/ui/pages/home/HomePage.dart';
import 'package:cred/ui/pages/home/HomePageBinding.dart';
import 'package:cred/ui/pages/money/MoneyPage.dart';
import 'package:cred/ui/pages/money/MoneyPageBinding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'ui/pages/authentication/welcome_screen.dart';
import 'ui/pages/authentication/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CRED',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: darkMaterialBlack,
      ),
      getPages: [
        GetPage(name: Welcome, page: () => WelcomeScreen()),
        GetPage(name: Login, page: () => LoginScreen()),
        GetPage(name: Registration, page: () => RegistrationScreen()),
        GetPage(name: CreditCardDetails, page: () => CardDetails()),
        GetPage(
          name: RouteDashboard,
          page: () => DashboardPage(),
          binding: DashBoardBinding(),
        ),GetPage(
          name: RouteHome,
          page: () => HomePage(),
          binding: HomePageBinding(),
        ),GetPage(
          name: RouteCards,
          page: () => CardsPage(),
          binding: CardsPageBinding(),
        ),GetPage(
          name: RouteCentralTab,
          page: () => CentralPage(),
          binding: CentralPageBinding(),
        ),GetPage(
          name: RouteMoney,
          page: () => MoneyPage(),
          binding: MoneyPageBinding(),
        ),GetPage(
          name: RouteClub,
          page: () => ClubPage(),
          binding: ClubPageBinding(),
        ),
      ],
      initialRoute: Welcome,
      home: WelcomeScreen(),
    );
  }
}


