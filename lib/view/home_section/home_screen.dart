import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_ops/controllers/author_controller.dart';
import 'package:super_ops/view/home_section/widgets/author_list.dart';
import 'package:super_ops/view/home_section/widgets/search_field.dart';
import 'package:super_ops/view/home_section/widgets/search_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthorController authorController = Get.put(AuthorController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
          child: Obx(
            () => authorController.loading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      SearchField(authorController: authorController),
                      const SizedBox(height: 16.0),
                      authorController.isSearchList.value
                          ? SearchList(authorController: authorController)
                          : AuthorList(
                              authorController: authorController,
                              totalCount: authorController.authorsList.length,
                              listData: authorController.authorsList,
                              isSearchList: false,
                            ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
