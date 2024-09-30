import 'package:flutter/material.dart';
import 'package:fresshi/presentation/reusables/banner.dart';
import 'package:fresshi/presentation/reusables/image_gallery.dart';
import 'package:fresshi/presentation/reusables/info_banner.dart';
import 'package:get/get.dart';

import '../app/util/color_palette.dart';
import 'pages/bottom_navigation/bottom_navigation_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      //initialBinding: AuthBinding(),
      title: 'Fresshi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ColorPalette.primaryColor,
          primarySwatch: Colors.indigo,
          fontFamily: 'ProductSans'),
      //home: const NavBar(),
      home: Scaffold(
        body: const Column(
          children: [
            Expanded(
                child: Center(
              child: InfoBanner(
                bannerHeight: 120,
                bannerWidth: 327,
                bannerTittle: 999999, // A number that will animate
                bannerDescription: "De alimentos salvados",
                bannerColor: ColorPalette.primaryColor,
                tittleFontSize: 40,
                isRounded: true,
                animationDuration:
                    Duration(seconds: 2), // Control animation duration here
              ),
            )),
          ],
        ),
        appBar: AppBar(
          title: Text('Fresshi'),
        ),
        bottomNavigationBar: CustomNavbar(),
      ),
      //getPages: appRoutes(),
    );
  }
}
