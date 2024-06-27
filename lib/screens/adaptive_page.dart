import 'package:flutter/material.dart';
import 'package:harry_potter/screens/mobile_page.dart';
import 'package:harry_potter/screens/tablet_page.dart';

class AdaptivePage extends StatelessWidget {
  const AdaptivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobilePage();
        } else {
          return const TabletPage();
        }
      },
    );
  }
}
