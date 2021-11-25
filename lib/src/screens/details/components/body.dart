import 'package:flutter/material.dart';

import '../../../models/Salon.dart';

class Body extends StatelessWidget {
  final Salon salon;

  const Body({Key? key, required this.salon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Hero(
        tag: salon.name,
        child: Text(salon.name),
      ),
    );
  }
}
