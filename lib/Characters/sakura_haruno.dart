import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:naruto_3d/Characters/minato_namikaze.dart';

class SakuraHaruno extends StatefulWidget {
  const SakuraHaruno({super.key});

  @override
  State<SakuraHaruno> createState() => _SakuraHarunoState();
}

class _SakuraHarunoState extends State<SakuraHaruno>
    with SingleTickerProviderStateMixin {
  final double _currentValue = 0.0;
  bool _expanded = false;

  late final animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
    lowerBound: 0,
    upperBound: 0.5,
  );

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 28.0),
              child: IconButton(
                icon: const Icon(
                  FeatherIcons.chevronLeft,
                  color: Colors.orange,
                  size: 30,
                ),
                onPressed: () {
                  Get.back();
                  // Navigator.pop(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const Beranda();
                  //     },
                  //   ),
                  // );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 300, top: 28.0),
              child: IconButton(
                icon: const Icon(
                  FeatherIcons.chevronRight,
                  color: Colors.orange,
                  size: 30,
                ),
                onPressed: () {
                  Get.to(const MinatoNamikaze());
                  // Navigator.pop(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const Beranda();
                  //     },
                  //   ),
                  // );
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: MouseRegion(
                    onEnter: (_) {
                      animationController.forward();
                    },
                    onExit: (_) {
                      animationController.reverse();
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (_expanded) {
                          animationController.forward();
                        } else {
                          animationController.reverse();
                        }
                        _expanded = !_expanded;
                      },
                      child: AnimatedBuilder(
                        animation: animationController,
                        builder: (context, _) {
                          return Card3DEffect(
                            //value: _currentValue,
                            value: animationController.value,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // Slider(
                //   value: _currentValue,
                //   min: 0,
                //   max: 0.5,
                //   onChanged: (val) {
                //     setState(
                //       () {
                //         _currentValue = val;
                //       },
                //     );
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final borderRadius = BorderRadius.circular(5);

class Card3DEffect extends StatelessWidget {
  final double value;
  const Card3DEffect({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final frontTranslation = (value / 0.5) * 0.25;
    return SizedBox(
      width: size.width / 1.5,
      child: AspectRatio(
        aspectRatio: 9 / 14,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(-value),
              child: const BackImage(),
            ),
            Opacity(
              opacity: value + 0.5,
              child: Transform.scale(
                alignment: Alignment.bottomCenter,
                scale: 1 + frontTranslation,
                child: const FrontImage(),
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(-value),
              child: const TextImage(),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(-value),
              child: const FrontImage(),
            ),
            Opacity(
              opacity: value + 0.5,
              child: Transform.scale(
                alignment: Alignment.bottomCenter,
                scale: 1 + frontTranslation,
                child: const FrontImage(),
              ),
            ),
            Opacity(
              opacity: value + 0.5,
              child: Transform.scale(
                alignment: Alignment.bottomCenter,
                scale: 1 + frontTranslation,
                child: const TextImage(),
              ),
            ),
            Opacity(
              opacity: value + 0.5,
              child: Transform.scale(
                alignment: Alignment.bottomCenter,
                scale: 1 + frontTranslation,
                child: const FrontImage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackImage extends StatelessWidget {
  const BackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.asset(
          'assets/Sakura Haruno.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FrontImage extends StatelessWidget {
  const FrontImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Sakura Haruno1.png',
      fit: BoxFit.cover,
    );
  }
}

class TextImage extends StatelessWidget {
  const TextImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Naruto_logo.png',
      fit: BoxFit.fill,
    );
  }
}
