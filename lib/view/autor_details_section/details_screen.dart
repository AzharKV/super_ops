import 'package:flutter/material.dart';
import 'package:super_ops/controllers/author_controller.dart';
import 'package:super_ops/data/models/authors_list_model.dart';
import 'package:super_ops/view/widgets/favourite_button.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.data,
    required this.imagePath,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.red),
        actions: [
          FavouriteButton(authorController: authorController, index: index),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 1.8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(imagePath)),
              ),
            ),
            Text(data.name, style: Theme.of(context).textTheme.titleLarge),
            Text(
              data.content,
              textAlign: TextAlign.justify,
            ),
          ]
              .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: e))
              .toList(),
        ),
      ),
    );
  }
}
