import 'package:flutter/material.dart';

class AssetsBox extends StatelessWidget {
  final Icon icon;
  final String assetName, pricePM;

  const AssetsBox({
    super.key,
    required this.icon,
    required this.assetName,
    required this.pricePM,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 110,
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(assetName), Text(pricePM)],
            ),
          ],
        ),
      ),
    );
  }
}
