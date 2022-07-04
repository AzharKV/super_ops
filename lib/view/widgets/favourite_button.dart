import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_ops/controllers/author_controller.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    Key? key,
    required this.authorController,
    required this.index,
  }) : super(key: key);

  final AuthorController authorController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => authorController.favouriteList[index] =
          !authorController.favouriteList[index],
      splashColor: Colors.transparent,
      icon: Obx(() => authorController.favouriteList[index]
          ? const Icon(Icons.favorite, color: Colors.red)
          : const Icon(Icons.favorite, color: Colors.grey)),
    );
  }
}
