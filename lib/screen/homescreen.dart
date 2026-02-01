import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool isLoggedIn = false; // sau này lấy từ backend / token

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // TITLE
            Text(
              'CLB Vợt Thủ Phố Núi',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Đánh kèo • Xếp hạng • Đặt sân Pickleball',
              style: TextStyle(color: AppColors.subText),
            ),

            const SizedBox(height: 24),

            // LOGIN / REGISTER
            if (!isLoggedIn)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _authButton(
                    context,
                    text: 'Đăng ký',
                    route: '/register',
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 16),
                  _authButton(
                    context,
                    text: 'Đăng nhập',
                    route: '/login',
                    color: AppColors.card,
                  ),
                ],
              ),

            const SizedBox(height: 32),

            // FEATURES GRID
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _feature(
                  context,
                  Icons.flash_on,
                  'Săn kèo',
                  'Tạo & thách đấu',
                  '/keo',
                ),
                _feature(
                  context,
                  Icons.emoji_events,
                  'Xếp hạng',
                  'Tính điểm CLB',
                  '/ranking',
                ),
                _feature(
                  context,
                  Icons.calendar_month,
                  'Đặt sân',
                  'Xem lịch trống',
                  '/booking',
                ),

                // 🔥 NÚT LỊCH SỬ ĐẶT SÂN (THÊM MỚI)
                _feature(
                  context,
                  Icons.history,
                  'Lịch sử',
                  'Đã đặt sân',
                  '/booking-history',
                ),

                _feature(
                  context,
                  Icons.account_balance_wallet,
                  'Ví / Nạp tiền',
                  'Số dư & giao dịch',
                  '/wallet',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // AUTH BUTTON
  Widget _authButton(
    BuildContext context, {
    required String text,
    required String route,
    required Color color,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(text),
    );
  }

  // FEATURE CARD
  Widget _feature(
    BuildContext context,
    IconData icon,
    String title,
    String desc,
    String route,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.subText),
            ),
          ],
        ),
      ),
    );
  }
}
