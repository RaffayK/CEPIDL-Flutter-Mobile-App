import 'package:flutter/material.dart';
import 'package:cepidl_app/screens/details_screen.dart';

import '../../../constants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/images/undraw_morning-workout_73u9.png",
            title: "Lunges",
            country: "Walking Lunges",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen()),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/undraw_working-out_6ksl.png",
            title: "Curls",
            country: "Hammer Curls",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScreen()),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/undraw_workout_wqgp.png",
            title: "Squats",
            country: "Basic Squats",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    super.key,
    required this.image,
    required this.title,
    required this.country,
    required this.press,
  });

  final String image, title, country;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.42,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Colors.grey[200],
              child: Image.asset(
                image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kPrimaryColor.withOpacity(0.15),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          country.toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.6),
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Price removed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
