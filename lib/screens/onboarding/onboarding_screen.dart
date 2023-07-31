import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../components/animated_btn.dart';
import '../components/custom_sign_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // height: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInShown ? -50 : 0,
            duration: const Duration(milliseconds: 250),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Text(
                            "Nama, Judul, Bebas",
                            style: TextStyle(
                              fontSize: 60,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consectetur, odio quis elementum aliquam, elit urna tempor magna, nec dictum tortor libero eu elit.",
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationColtroller: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isSignInShown = true;
                            });
                            customSignInDialog(
                              context,
                              onClosed: (_) {
                                setState(() {
                                  isSignInShown = false;
                                });
                              },
                            );
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Nunc a metus arcu. Etiam aliquam congue arcu eget ultricies. Quisque eu elit ut nulla ullamcorper efficitur. Aenean nec purus non libero tempor iaculis non a metus."),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
