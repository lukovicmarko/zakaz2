import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zakazi/src/data/salonsData.dart';

class Body extends StatefulWidget {
  // ignore: use_key_in_widget_constructors

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final salon = Provider.of<SalonsData>(context).salon;
    return Column(
      children: [
        Hero(
          tag: salon!.name,
          child: Image.network(
            salon.image,
            fit: BoxFit.cover,
            height: 336.h,
            width: size.width,
          ),
        )
      ],
    );
  }
}
