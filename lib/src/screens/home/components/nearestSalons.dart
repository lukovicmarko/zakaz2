// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/data/salonsData.dart';
import 'package:zakazi/src/screens/details/detailsScreen.dart';

import 'nearestSalonCard.dart';

// ignore: use_key_in_widget_constructors
class NearestSalons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<SalonsData>(context);
    return Consumer<SalonsData>(
      // ignore: sized_box_for_whitespace
      builder: (context, salons, child) => Expanded(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10.w);
          },
          itemCount: salons.salons.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            return NearestSalonCard(
              salon: salons.salons[index],
              press: () => {
                // salons.getSalonsById(salons.salons[index].id),
                Navigator.pushNamed(
                  context,
                  DetailsScreen.routeName,
                  // arguments: SalonDetailsArguments(salons.salons[index].id),
                ),
              },
            );
          },
        ),
      ),
    );
  }
}
