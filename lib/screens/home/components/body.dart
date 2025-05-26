import 'package:flutter/material.dart';
import 'package:cepidl_app/constants.dart';

import 'featurred_plants.dart';
import 'header_with_seachbox.dart';
import 'recomend_plants.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWithSearchBox(key: UniqueKey(), size: size),
                  const SizedBox(height: kDefaultPadding / 2),
                  TitleWithMoreBtn(title: "Recommended", press: () {}),
                  RecomendsPlants(key: UniqueKey()),
                  TitleWithMoreBtn(title: "Releasing Soon", press: () {}),
                  FeaturedPlants(key: UniqueKey()),
                  const SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
