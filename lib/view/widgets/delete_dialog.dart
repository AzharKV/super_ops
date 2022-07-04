import 'package:flutter/material.dart';
import 'package:super_ops/controllers/author_controller.dart';
import 'package:super_ops/data/models/authors_list_model.dart';
import 'package:super_ops/view/widgets/author_image_widget.dart';
import 'package:super_ops/view/widgets/outlined_delete_button.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog(
      {Key? key,
      required this.imagePath,
      required this.data,
      required this.isSearchList,
      required this.authorController,
      required this.index})
      : super(key: key);

  final String imagePath;
  final AuthorsListModel data;
  final bool isSearchList;
  final AuthorController authorController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      actionsPadding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      title: const Text(
        "Delete this author?",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Row(
        children: [
          AuthorImageWidget(imagePath: imagePath),
          const SizedBox(width: 12.0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14.0)),
              const SizedBox(height: 8.0),
              Text(data.updated, style: const TextStyle(fontSize: 14.0)),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel", style: TextStyle(color: Colors.black)),
        ),
        OutlinedDeletedButton(
            onTap: () => authorController.delete(context,
                id: data.id, isSearchList: isSearchList)),
      ],
    );
  }
}
