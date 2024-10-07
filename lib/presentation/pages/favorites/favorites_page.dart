import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fresshi/app/util/color_palette_util.dart';
import 'package:fresshi/presentation/reusables/image_gallery.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
            height: 20,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: ImageGallery(
                      images: [
                        'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728160476/berry-iso-straw-1-878x1024_mqcahu.webp',
                        'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp'
                      ],
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My shopping List ${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Fresa, Naranja',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: ColorPalette.secondaryColor,
                      size: 28,
                    ),
                    onPressed: () {
                      // Acción al hacer clic en el icono del corazón
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
