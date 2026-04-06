import 'package:bookly_app/core/utils/AppImages.dart';
import 'package:bookly_app/features/splash/functions/navigation_controler.dart';
import 'package:flutter/material.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> feedignAnimation;
  @override
  void initState() {
    navigationControler(context);
    createAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Opacity(
            opacity: feedignAnimation.value,
            child: Image.asset(AppImages.kLogo)),
      ),
    );
  }

  createAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    feedignAnimation =
        Tween<double>(begin: 0.3, end: 1).animate(animationController);
    animationController.forward();
    animationController.repeat(reverse: true);
    animationController.addListener(() {
      setState(() {});
    });
  }
}
