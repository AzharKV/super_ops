import 'package:flutter/material.dart';

class AuthorImageWidget extends StatelessWidget {
  const AuthorImageWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(imagePath)),
      ),
    );
  }
}
