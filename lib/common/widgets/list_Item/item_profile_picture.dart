import 'package:flutter/material.dart';

class ItemProfilePicture extends StatelessWidget {

  final String? userImage;
  const ItemProfilePicture({super.key, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(userImage ?? ""),
            fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
    );
  }
}
