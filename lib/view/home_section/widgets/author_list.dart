import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_ops/const/config.dart';
import 'package:super_ops/controllers/author_controller.dart';
import 'package:super_ops/data/models/authors_list_model.dart';
import 'package:super_ops/view/home_section/widgets/author_card.dart';

class AuthorList extends StatelessWidget {
  const AuthorList({
    Key? key,
    required this.authorController,
    required this.totalCount,
    required this.listData,
    this.paginationEnable = true,
    required this.isSearchList,
  }) : super(key: key);

  final AuthorController authorController;
  final RxList<AuthorsListModel> listData;

  final int totalCount;
  final bool paginationEnable;
  final bool isSearchList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: paginationEnable ? authorController.scrollController : null,
        itemCount: totalCount,
        itemBuilder: (BuildContext context, int index) {
          AuthorsListModel data = listData[index];

          String imagePath = ConfigData.baseUrl + data.photoUrl;

          return Obx(
            () => Column(
              children: [
                AuthorCard(
                  authorController: authorController,
                  imagePath: imagePath,
                  data: data,
                  isSearchList: isSearchList,
                  index: index,
                ),
                if (authorController.paginationLoading.value &&
                    (index + 1) == totalCount)
                  const CircularProgressIndicator()
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}
