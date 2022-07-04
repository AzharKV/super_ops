import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_ops/controllers/author_controller.dart';
import 'package:super_ops/data/models/authors_list_model.dart';
import 'package:super_ops/view/widgets/delete_dialog.dart';
import 'package:super_ops/view/widgets/outlined_delete_button.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    Key? key,
    required this.imagePath,
    required this.data,
    required this.isSearchList,
    required this.authorController,
    required this.index,
  }) : super(key: key);

  final String imagePath;
  final AuthorsListModel data;
  final bool isSearchList;
  final AuthorController authorController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          width: 0.2,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0) +
            const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(imagePath)),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(data.updated),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isSearchList)
                  IconButton(
                    onPressed: () => authorController.favouriteList[index] =
                        !authorController.favouriteList[index],
                    splashColor: Colors.transparent,
                    icon: Obx(() => authorController.favouriteList[index]
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite, color: Colors.grey)),
                  ),
                OutlinedDeletedButton(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => DeleteDialog(
                      imagePath: imagePath,
                      data: data,
                      isSearchList: isSearchList,
                      authorController: authorController,
                      index: index,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
