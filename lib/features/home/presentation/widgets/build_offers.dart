import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildOffers extends StatelessWidget {
  final String image, desc;
  const BuildOffers({super.key, required this.image, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Row(
          children: [
            Image.network(
              image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                 desc,
                  style: TextStyle(
                    fontFamily: "Suwannaphum",
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
