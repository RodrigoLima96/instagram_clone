import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webPageLayout;
  final Widget mobilePageLayout;

  const ResponsiveLayout({
    Key? key,
    required this.webPageLayout,
    required this.mobilePageLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webPageSize) {
          return webPageLayout;
        }
        return mobilePageLayout;
      },
    );
  }
}
