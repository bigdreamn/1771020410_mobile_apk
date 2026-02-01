import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BalanceCard extends StatefulWidget {
  final String name;
  final double score;
  final int rank;

  const BalanceCard({
    super.key,
    required this.name,
    required this.score,
    required this.rank,
  });

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _liftAnim;

  double get liftHeight {
    switch (widget.rank) {
      case 1:
        return -18;
      case 2:
        return -10;
      case 3:
        return -6;
      default:
        return 0;
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _liftAnim = Tween<double>(
      begin: 0,
      end: liftHeight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    if (widget.rank <= 3) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _liftAnim,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _liftAnim.value),
          child: child,
        );
      },
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.rank == 1 ? AppColors.warning : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            if (widget.rank == 1)
              BoxShadow(
                color: AppColors.warning.withOpacity(0.35),
                blurRadius: 18,
                spreadRadius: 2,
              )
            else
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.person, color: Colors.black),
            ),
            const SizedBox(height: 8),

            Text(
              widget.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 16, color: AppColors.warning),
                const SizedBox(width: 4),
                Text(
                  widget.score.toString(),
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
