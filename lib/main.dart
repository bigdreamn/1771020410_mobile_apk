import 'package:flutter/material.dart';
import 'package:mobile_1771020410/screen/booking_history_screen.dart';
import 'package:mobile_1771020410/screen/booking_list.dart';
import 'constants/app_colors.dart';

import 'screen/homescreen.dart';
import 'screen/login_screen.dart';
import 'screen/register_screen.dart';
import 'screen/match_screen.dart';
import 'screen/tournament_screen.dart';
import 'screen/transaction_screen.dart';
import 'screen/wallet_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CLB Pickleball',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/keo': (_) => const MatchScreen(),
        '/ranking': (_) => const TournamentScreen(),
        '/booking': (_) => const TransactionScreen(),
        '/wallet': (_) => const WalletScreen(),
        '/bookingList': (_) => const BookingListPage(),
        '/booking-history': (_) => const BookingHistoryScreen(),
      },
    );
  }
}
