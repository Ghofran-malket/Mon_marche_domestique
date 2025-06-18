import 'package:flutter/cupertino.dart';
import 'package:mon_marche_domestique/core/style.dart';

class CustomRichText extends StatelessWidget {
  final String title;
  final String details;
  CustomRichText({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
            text: '$title: ',
            style: itemDetails,
            children: <TextSpan>[
              TextSpan(
                text: details,
                style: itemDetailsBlack,
              )
            ],
          ),
      ),
    );
  }
}
