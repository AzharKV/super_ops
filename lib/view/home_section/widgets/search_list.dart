import 'package:flutter/material.dart';
import 'package:super_ops/controllers/author_controller.dart';
import 'package:super_ops/view/home_section/widgets/author_list.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    Key? key,
    required this.authorController,
  }) : super(key: key);

  final AuthorController authorController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search Results",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16.0,
                ),
              ),
              Text(
                "${authorController.searchedAuthorsList.length} founds",
                style: const TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          AuthorList(
            authorController: authorController,
            totalCount: authorController.searchedAuthorsList.length,
            listData: authorController.searchedAuthorsList,
            paginationEnable: false,
          ),
        ],
      ),
    );
  }
}
