import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import './components/body.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchArguments arg =
        ModalRoute.of(context)!.settings.arguments as SearchArguments;

    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(index: arg.index),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/stroke/Arrow-left(stroke).svg",
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class SearchArguments {
  final int index;

  SearchArguments({required this.index});
}
