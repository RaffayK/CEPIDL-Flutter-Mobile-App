import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cepidl_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "CEPIDL APP",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/notification.svg"),
          onPressed: () {
            // Handle notification icon press
          },
        ),
      ],
    );
  }
}
