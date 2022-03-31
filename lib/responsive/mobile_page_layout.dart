import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MobilePageLayout extends StatefulWidget {
  const MobilePageLayout({Key? key}) : super(key: key);

  @override
  State<MobilePageLayout> createState() => _MobilePageLayoutState();
}

class _MobilePageLayoutState extends State<MobilePageLayout> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Center(
        child: Text(user.username),
      ),
    );
  }
}
