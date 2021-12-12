import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zakazi/src/models/Salon.dart';
import 'package:zakazi/src/screens/details/components/body.dart';

// ignore: use_key_in_widget_constructors
class DetailsScreen extends StatefulWidget {
  static String routeName = '/details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final SalonDetailsArguments arg =
        ModalRoute.of(context)!.settings.arguments as SalonDetailsArguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: Body(salon: arg.salon),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/stroke/Arrow-left(stroke).svg",
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/stroke/Heart(stroke).svg",
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

class SalonDetailsArguments {
  final Salon salon;

  SalonDetailsArguments({required this.salon});
}
