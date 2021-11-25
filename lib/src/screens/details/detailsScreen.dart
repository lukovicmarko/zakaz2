import 'package:flutter/material.dart';
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
      body: Body(salon: arg.salon),
    );
  }
}

class SalonDetailsArguments {
  final Salon salon;

  SalonDetailsArguments({required this.salon});
}
