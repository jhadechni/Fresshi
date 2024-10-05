import 'package:flutter/material.dart';
import 'package:fresshi/presentation/reusables/info_banner.dart';
import 'package:get/get.dart';

import '../app/util/color_palette_util.dart';
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
        home: CustomNavbar()
        //getPages: appRoutes(),
        );
  }
}
