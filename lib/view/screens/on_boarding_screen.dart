import 'dart:math';
import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/dashboard/dashboard_screen.dart';
import 'package:changin/view/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> rotationAnimation;
  late final PageController pageController;
  static const viewportFraction = 0.7;
  int activeIndex = 0;

  @override
  void initState() {
    pageController = PageController(viewportFraction: viewportFraction);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );
    rotationAnimation =
        Tween<double>(begin: 0, end: 30 * pi / 180).animate(curvedAnimation);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final itemWidth = screenSize.width * viewportFraction;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text(
                'Welcome to',
                style: Style.textStyles
                    .poppins(fontSize: 25.sp, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [ 
                  Positioned.fill(
                    child: GestureDetector(
                      onTapDown: (_) => animationController.forward(),
                      onTapUp: (_) => animationController.reverse(),
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: Variables.onBoardingItems.length,
                        onPageChanged: (int index) {
                          setState(() {
                            activeIndex = index;
                          });
                          animationController.forward().then(
                                (value) => animationController.reverse(),
                              );
                        },
                        itemBuilder: (context, index) {
                          return AnimatedScale(
                            duration: const Duration(milliseconds: 300),
                            scale: index == activeIndex ? 1 : 0.8,
                            curve: Curves.easeOut,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.onBlack,
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Variables.onBoardingItems[index].image,
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: (screenSize.width - itemWidth) / 2,
                right: (screenSize.width - itemWidth) / 2,
                top: 40,
                bottom: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._buildItemInfo(activeIndex: activeIndex),
                  PageIndicator(
                    length: Variables.onBoardingItems.length,
                    activeIndex: activeIndex,
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Get Started!',
                      style: Style.textStyles.poppins(color: AppColors.white,fontSize: 13.sp,fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItemInfo({int activeIndex = 0}) {
    return [
      Center(
        child: Text(
          Variables.onBoardingItems[activeIndex].title,
          style: Style.textStyles.poppins(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Center(
        child: Text(
          Variables.onBoardingItems[activeIndex].subtitle,
          style:  Style.textStyles.poppins(fontSize: 13.sp),
        ),
      ),
    ];
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    this.length = 1,
    this.activeIndex = 0,
    this.activeColor = AppColors.primary,
  });

  final int length;
  final int activeIndex;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox.fromSize(
        size: const Size.fromHeight(8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.smallest;
            final activeWidth = size.width * 0.5;
            final inActiveWidth =
                (size.width - activeWidth - (2 * length * 2)) / (length - 1);

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    height: index == activeIndex ? 8 : 5,
                    width: index == activeIndex ? activeWidth : inActiveWidth,
                    decoration: BoxDecoration(
                      color: index == activeIndex
                          ? activeColor
                          : AppColors.onBlack,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
