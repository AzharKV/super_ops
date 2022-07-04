import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_ops/const/my_colors.dart';
import 'package:super_ops/controllers/author_controller.dart';
import 'package:super_ops/view/home_section/widgets/author_list.dart';
import 'package:super_ops/view/widgets/sizedbox.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    Key? key,
    required this.authorController,
  }) : super(key: key);

  final AuthorController authorController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Search Results",
                    style:
                        TextStyle(color: MyColors.lightBlack, fontSize: 16.0)),
                Text("${authorController.searchedAuthorsList.length} founds",
                    style: const TextStyle(color: Colors.red, fontSize: 16.0)),
              ],
            ),
            sizedBoxH8,
            AuthorList(
              authorController: authorController,
              totalCount: authorController.searchedAuthorsList.length,
              listData: authorController.searchedAuthorsList,
              paginationEnable: false,
              isSearchList: true,
            ),
          ],
        ),
      ),
    );
  }
}
