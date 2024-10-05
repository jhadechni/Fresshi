import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette_util.dart';

class ImageGallery extends StatelessWidget {
  final List<String> images;
  final double width;
  final double height;
  final double borderRadius;

  const ImageGallery({
    Key? key,
    required this.images,
    required this.width,
    required this.height,
    this.borderRadius = 20.0, // Default corner radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imagesNew = List.from(images);
    if (imagesNew.length < 4) {
      for (int i = imagesNew.length; i < 4; i++) {
        imagesNew.add('');
      }
    }
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(), // Prevent scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2x2 grid
            crossAxisSpacing: 4.0, // Spacing between images
            mainAxisSpacing: 4.0,
          ),
          itemCount: imagesNew.length,
          itemBuilder: (context, index) {
            if (imagesNew[index].isEmpty) {
              return Container(
                color: ColorPalette.dividerColor
              );
            }
            return Image.network(
              imagesNew[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: ColorPalette.dividerColor,
                 
                );
              },
            );
          },
        ),
      ),
    );
  }
}
