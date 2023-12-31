import 'package:flutter/material.dart';
import 'package:sunshine/presentation/home/pages/tablet/home_tablet_page.dart';
import 'package:sunshine/presentation/home/pages/web/home_web_page.dart';
import '../../../core/constants/screen_size.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/weather_widget.dart';
import 'mobile/home_mobile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= desktopChangePoint) {
        return const HomeWebPage();
      } else if (constraints.maxWidth >= tabletChangePoint) {
        return const HomeTabletPage();
      } else {
        return const HomeMobilePage();
      }
    });
  }
}
