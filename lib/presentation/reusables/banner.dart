import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette.dart';

class AutoSlidingBanner extends StatefulWidget with Diagnosticable {
  ///The [imageUrls] parameter is a list of URLs of the images to be displayed in the banner.
  final List<String> imageUrls;

  ///The [slideDuration] parameter is the duration in seconds for each slide.
  final int slideDuration;

  ///The [buttonText] parameter is the text to be displayed on the button.
  final String? buttonText;

  ///The [bannerWidth] parameter is the width of the banner.
  final double bannerWidth;

  ///The [bannerHeight] parameter is the height of the banner.
  final double bannerHeight;

  ///The [dotSize] parameter is the size of the dots indicator.
  final double dotSize;

  ///The [activeDotColor] parameter is the color of the active dot.
  final Color activeDotColor;

  ///The [inactiveDotColor] parameter is the color of the inactive dots.
  final Color inactiveDotColor;

  ///The [hasButton] parameter is a boolean to determine if the button should be displayed.
  final bool hasButton;

  ///The [buttonColor] parameter is the color of the button.
  final Color? buttonColor;

  ///The [onButtonPressed] parameter is a callback function for the button.
  final VoidCallback? onButtonPressed; // Callback for the button

  ///The [AutoSlidingBanner] widget is a stateful widget that displays a banner with auto-sliding images.
  ///The banner displays a list of images with dot indicators at the bottom to show the current image.
  ///The banner also has a button that can be used to perform an action.
  const AutoSlidingBanner({
    required this.imageUrls,
    required this.slideDuration,
    required this.hasButton, // Default slide duration of 5 seconds
    this.buttonText = 'Button',
    required this.bannerWidth,
    required this.bannerHeight,
    required this.dotSize,
    this.activeDotColor = ColorPalette.primaryColor,
    this.inactiveDotColor = ColorPalette.dividerColor,
    this.buttonColor = ColorPalette.primaryColor,
    this.onButtonPressed,
    super.key,
  });

  @override
  _AutoSlidingBannerState createState() => _AutoSlidingBannerState();
}

class _AutoSlidingBannerState extends State<AutoSlidingBanner> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to auto-slide
    _timer =
        Timer.periodic(Duration(seconds: widget.slideDuration), (Timer timer) {
      if (_currentPage < widget.imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.bannerWidth,
          height: widget.bannerHeight,
          decoration: BoxDecoration(
            color: Colors.grey[300], // Set background color
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          child: Stack(
            children: [
              // PageView to show images
              PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: widget.imageUrls.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                    child: Image.network(
                      widget.imageUrls[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: ColorPalette.dividerColor,
                        );
                      },
                    ),
                  );
                },
              ),
              // Positioned button at the bottom left
              widget.hasButton
                  ? Positioned(
                      bottom: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: widget.onButtonPressed,
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color:
                                widget.buttonColor, // Button background color
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              widget.buttonText!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Dot indicators for the number of images
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imageUrls.length,
            (index) => buildDot(index, context),
          ),
        ),
      ],
    );
  }

  // Widget to build the dots indicator
  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Animation duration
      margin: const EdgeInsets.only(right: 8),
      height: widget.dotSize,
      width: _currentPage == index ? widget.dotSize * 4 : widget.dotSize,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? widget.activeDotColor
            : widget.inactiveDotColor,
        borderRadius: _currentPage == index
            ? BorderRadius.circular(
                widget.dotSize * 0.5) // Rounded corners for active dot
            : BorderRadius.circular(
                widget.dotSize), // Full circle for inactive dots
      ),
    );
  }
}
