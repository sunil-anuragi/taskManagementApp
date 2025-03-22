import 'package:jewellery/consts/extensions.dart';
import 'package:flutter/material.dart';


class ItemShimmerProfile extends StatelessWidget {
  const ItemShimmerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 16.0,
                color: Colors.white,
              ),
              8.vs,
              Container(
                width: 200,
                height: 16.0,
                color: Colors.white,
              )
            ],
          ),
        ),
      ],
    );
  }
}
