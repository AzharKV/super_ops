import 'package:flutter/material.dart';
import 'package:super_ops/const/my_colors.dart';
import 'package:super_ops/controllers/author_controller.dart';
import 'package:super_ops/data/models/authors_list_model.dart';
import 'package:super_ops/view/autor_details_section/details_screen.dart';
import 'package:super_ops/view/widgets/author_image_widget.dart';
import 'package:super_ops/view/widgets/delete_dialog.dart';
import 'package:super_ops/view/widgets/favourite_button.dart';
import 'package:super_ops/view/widgets/outlined_delete_button.dart';
import 'package:super_ops/view/widgets/sizedbox.dart';

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
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
              data: data,
              imagePath: imagePath,
              isSearchList: isSearchList,
              authorController: authorController,
              index: index),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(width: 0.2, color: MyColors.lightBlack)),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0) +
              const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              AuthorImageWidget(imagePath: imagePath),
              sizedBoxW12,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    sizedBoxH8,
                    Text(data.updated),
                  ],
                ),
              ),
              sizedBoxW8,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isSearchList)
                    FavouriteButton(
                        authorController: authorController, index: index),
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
      ),
    );
  }
}
