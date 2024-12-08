import 'package:flutter/material.dart';
import 'package:scrview/constants.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: Image.asset(
              "images/icon.png",
              height: 20,
            )),
        IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: Icon(Icons.notifications))
      ],
    );
  }
}
