import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final bool isAsset;
  final String? imageUrl;
  const ProfilePic({super.key, required this.isAsset, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: Colors.grey[200],
      child: isAsset
          ? Image.asset(
              imageUrl!,
              height: 30,
              width: 30,
            )
          : Image.network(
              imageUrl!,
              height: 30,
              width: 30,
            ),
    );
  }
}
