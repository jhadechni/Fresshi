import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fresshi/app/util/color_palette_util.dart';
import 'package:fresshi/presentation/reusables/banner.dart';
import 'package:fresshi/presentation/reusables/product_card.dart';
import 'package:fresshi/presentation/reusables/search_bar.dart';
import '../../reusables/category_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double width = size.width;

    // List of products
    final List<Map<String, dynamic>> products = [
      {
        'productName': 'Fresas',
        'currentPrice': 2500.0,
        'originalPrice': 7500.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image':
            'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728160476/berry-iso-straw-1-878x1024_mqcahu.webp',
        'tag': 'Fresco',
        'tagColor': Colors.lime,
      },
      {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
       {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
      {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
      {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
      {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
      {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
      {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
      {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
      {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
      {
        'productName': 'Naranjas',
        'currentPrice': 3000.0,
        'originalPrice': 5000.0,
        'weight': 1.0,
        'unitPrice': 0.0,
        'image': 'https://res.cloudinary.com/dduxonsd2/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1728163174/orange-04_jwwle9.webp',
        'tag': 'Vacile',
        'tagColor': ColorPalette.secondaryColor,
      },
      
      // Add more products as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Tu ubicación',
              style:
                  TextStyle(fontSize: 18, color: ColorPalette.primaryTextColor),
            ),
            Text(
              'Calle de prueba',
              style: TextStyle(
                fontSize: 20,
                color: ColorPalette.primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '¿De qué tienes antojo?',
                    style: TextStyle(
                      fontSize: 40,
                      color: ColorPalette.primaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomSearchBar(
                      width: width,
                      height: 50,
                      predictions: [''],
                      onSearch: (String query) {
                        print(query);
                      }),
                  const SizedBox(height: 20),
                  AutoSlidingBanner(
                      imageUrls: [
                        'https://res.cloudinary.com/dduxonsd2/image/upload/v1725851069/banner_fresshi.png',
                        'https://via.placeholder.com/200',
                        'https://via.placeholder.com/300'
                      ],
                      slideDuration: 5,
                      hasButton: false,
                      bannerWidth: width,
                      bannerHeight: 120,
                      dotSize: 10),
                  const SizedBox(height: 30),
                  const Text(
                    'Categorías',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.primaryTextColor),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CategoryCard(
                            icon: FontAwesomeIcons.carrot,
                            label: 'Verduras',
                            width: 120,
                            iconSize: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CategoryCard(
                            icon: FontAwesomeIcons.appleAlt,
                            label: 'Frutas',
                            width: 120,
                            iconSize: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CategoryCard(
                            icon: FontAwesomeIcons.breadSlice,
                            label: 'Panadería',
                            width: 120,
                            iconSize: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CategoryCard(
                            icon: FontAwesomeIcons.cheese,
                            label: 'Lácteos',
                            width: 120,
                            iconSize: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CategoryCard(
                            icon: FontAwesomeIcons.fish,
                            label: 'Pescados',
                            width: 120,
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'El mercado de Fresshi',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.primaryTextColor),
                  ),
                ],
              ),
            ),
          ),
          // GridView responsivo usando SliverGrid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width < 600 ? 2 : 3, // Ajuste basado en el ancho
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.7, // Proporción del tamaño de los productos
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = products[index];
                  return ProductCard(
                    productName: product['productName'],
                    currentPrice: product['currentPrice'],
                    originalPrice: product['originalPrice'],
                    weight: product['weight'],
                    unitPrice: product['unitPrice'],
                    onQuantityChanged: (int change) => {print(change)},
                    productImage: product['image'],
                    tag: product['tag'],
                    tagColor: product['tagColor'],
                  );
                },
                childCount: products.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
