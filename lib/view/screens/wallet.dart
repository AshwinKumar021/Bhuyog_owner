import 'dart:math';

import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({
    required this.width,
    required this.height,
    super.key,
    this.onAddPressed,
    this.strapRotation = 0,
    this.bodyRotation = 0,
  });

  final double width;
  final double height;
  final VoidCallback? onAddPressed;
  final double strapRotation;
  final double bodyRotation;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -12,
            left: 0,
            right: 0,
            child: Center(
              child: _WalletStrapSide(),
            ),
          ),
          WalletSide(),
          Positioned(
            top: -12,
            left: 0,
            right: 0,
            child: Center(
              child: _WalletStrapSide(),
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletStrapSide extends StatelessWidget {
  const _WalletStrapSide();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.walletStrapWidth,
      height: Constants.walletStrapHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppBorderRadius.sm),
          topRight: Radius.circular(AppBorderRadius.sm),
          bottomRight: Radius.circular(Constants.walletStrapWidth / 2),
          bottomLeft: Radius.circular(Constants.walletStrapWidth / 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(3),
      child: const DashedBorderContainer(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppBorderRadius.sm),
          topRight: Radius.circular(AppBorderRadius.sm),
          bottomRight: Radius.circular(Constants.walletStrapWidth / 2),
          bottomLeft: Radius.circular(Constants.walletStrapWidth / 2),
        ),
        dash: 3,
        gap: 3,
        borderWidth: 0.5,
      ),
    );
  }
}

class WalletSide extends StatelessWidget {
  const WalletSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(AppBorderRadius.xl),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: DashedBorderContainer(
        borderRadius: BorderRadius.circular(AppBorderRadius.xl),
        dash: 3,
        gap: 3,
        borderWidth: 0.5,
      ),
    );
  }
}


class Constants {
  static const double appHPadding = 16;
  static const double walletStrapWidth = 85;
  static const double walletStrapHeight = 100;
  static const double perspectiveSm = 0.0005;
  static const double perspective = 0.001;
  static const double perspectiveLg = 0.002;
}



class AppColors {
  static const Color primary = Color(0xff1A77FF);
  static const Color secondary = Color(0xffFFBB05);
  static const Color accent = Color(0xffF5C3D2);
  static const Color border = Color(0xff505254);
  static const Color danger = Color(0xffF70000);
  static const Color success = Color(0xff04B616);
  static const Color black = Color(0xff1A1A1A);
  static const Color onBlack = Color(0xff353535);
  static const Color onWhite = Color(0xffEBEBEB);
  static const Color white = Color(0xffF2F2F2);
}

class AppBorderRadius {
  static const double sm = 5;
  static const double md = 10;
  static const double lg = 15;
  static const double xl = 20;
  static const double xxl = 25;
}

class AppThemes {
  static ThemeData getTheme({bool isDark = true}) {
    return ThemeData(
      fontFamily: 'Raleway',
      scaffoldBackgroundColor: AppColors.black,
      dividerColor: AppColors.border,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.black,
        onBackground: AppColors.onBlack,
        shadow: AppColors.black,
      ),
      splashFactory: NoSplash.splashFactory,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        indicatorColor: Colors.transparent,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          fixedSize: const Size.fromHeight(50),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: AppColors.border),
          ),
          fillColor: AppColors.black,
        ),
        menuStyle: MenuStyle(
          backgroundColor:
          const MaterialStatePropertyAll<Color>(AppColors.black),
          elevation: const MaterialStatePropertyAll<double>(0),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.border),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
        ),
        fillColor: AppColors.black,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0, color: AppColors.border),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 0, color: AppColors.border),
        ),
      ),
    );
  }

  static ThemeData get darkTheme => getTheme();
}



class DashedBorderContainer extends StatelessWidget {
  const DashedBorderContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.borderColor,
    this.borderRadius,
    this.borderWidth = 1,
    this.dash = 10,
    this.gap = 10,
  });

  final double? width;
  final double? height;
  final Widget? child;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double dash;
  final double gap;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: DashedBorderPainter(
          dashColor: borderColor ?? Theme.of(context).dividerColor,
          borderRadius: borderRadius ?? BorderRadius.zero,
          dash: dash,
          gap: gap,
          borderWidth: borderWidth,
        ),
        child: child,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  DashedBorderPainter({
    this.dash = 5.0,
    this.gap = 3.0,
    this.dashColor = Colors.black,
    this.borderRadius = BorderRadius.zero,
    this.borderWidth = 1,
  });

  final double dash;
  final double gap;
  final Color dashColor;
  final BorderRadius borderRadius;
  final double borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dashColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    _drawDashedPath(
      canvas,
      paint,
      RRect.fromLTRBAndCorners(
        0,
        0,
        size.width,
        size.height,
        bottomLeft: borderRadius.bottomLeft,
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomRight: borderRadius.bottomRight,
      ),
    );
  }

  void _drawDashedPath(Canvas canvas, Paint paint, RRect rrect) {
    final path = Path()..addRRect(rrect);
    final dashLength = dash + gap;

    for (final metric in path.computeMetrics()) {
      final totalLength = metric.length;

      for (var distance = 0.0; distance < totalLength; distance += dashLength) {
        final start = distance;
        final double end = min(distance + dash, totalLength);
        final extractPath = metric.extractPath(start, end);
        canvas.drawPath(extractPath, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
