import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_page_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_page.dart';
import 'package:instagram_clone/responsive/web_page_layout.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const ResponsiveLayout(
        webPageLayout: WebPageLayout(),
        mobilePageLayout: MobilePageLayout(),
      ),
    );
  }
}
