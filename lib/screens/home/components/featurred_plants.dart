import 'package:flutter/material.dart';

import '../../../constants.dart';

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              top: kDefaultPadding / 2,
              bottom: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: FeaturePlantCard(
              key: UniqueKey(),
              image: "assets/images/undraw_pilates_i5uo.png",
              width: 290,
              height: 190,
              press: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              top: kDefaultPadding / 2,
              bottom: kDefaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: FeaturePlantCard(
              key: UniqueKey(),
              image: "assets/images/undraw_stability-ball_fxne.png",
              width: 270,
              height: 190,
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    required Key key,
    required this.image,
    required this.press,
    this.width,
    this.height,
  }) : super(key: key);
  final String image;
  final VoidCallback press;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: width ?? size.width * 0.8,
        height: height ?? 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
      ),
    );
  }
}
