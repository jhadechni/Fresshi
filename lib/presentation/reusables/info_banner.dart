import 'package:flutter/material.dart';

class InfoBanner extends StatelessWidget {
  final double bannerHeight;
  final double bannerWidth;
  final double? bannerTittle; // Numeric tittle (int or double)
  final String? bannerDescription;
  final Color bannerColor;
  final double? tittleFontSize;
  final double? descriptionFontSize;
  final bool isRounded;
  final Duration animationDuration; // Parameter for animation duration

  const InfoBanner({
    super.key,
    required this.bannerHeight,
    required this.bannerWidth,
    this.bannerTittle,
    this.bannerDescription,
    required this.bannerColor,
    this.tittleFontSize,
    this.descriptionFontSize,
    required this.isRounded,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: bannerWidth,
      height: bannerHeight,
      decoration: BoxDecoration(
        color: bannerColor,
        borderRadius: isRounded ? BorderRadius.circular(20) : BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (bannerTittle != null)
              TweenAnimationBuilder<double>(
                tween: Tween<double>(
                    begin: 0,
                    end: bannerTittle!), // Animate to bannerTittle value
                duration: animationDuration, // Use dynamic animation duration
                builder: (context, value, child) {
                  return Text(
                    '${value.toInt().toString()}Kg', // Display the value as an integer
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: tittleFontSize ?? 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            if (bannerDescription != null)
              Text(
                bannerDescription!,
                style: TextStyle(
                  fontSize: descriptionFontSize ?? 20,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
