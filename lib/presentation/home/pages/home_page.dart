import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_bloc.dart';
import 'package:sunshine/presentation/home/bloc/home_event.dart';
import 'package:sunshine/presentation/home/bloc/location_bloc.dart';
import 'package:sunshine/presentation/home/bloc/location_event.dart';
import 'package:sunshine/presentation/home/pages/tablet/home_tablet_page.dart';
import 'package:sunshine/presentation/home/pages/web/home_web_page.dart';

import '../../widgets/responsive.dart';
import 'mobile/home_mobile_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: HomeWebPage(),
      mobile: HomeMobilePage(),
      tablet: HomeTabletPage(),
    );
  }
}
