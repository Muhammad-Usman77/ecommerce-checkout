import 'package:flutter/material.dart';
import 'package:scrview/constants.dart';

class Description extends StatelessWidget {
  final String description;
  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Text(
              "specifications",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Text(
              "Reviews",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: TextStyle(),
        )
      ],
    );
  }
}
