import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_ops/const/config.dart';
import 'package:super_ops/controllers/author_controller.dart';
import 'package:super_ops/data/models/authors_list_model.dart';
import 'package:super_ops/view/home_section/widgets/author_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthorController authorController = Get.put(AuthorController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0) + const EdgeInsets.only(top: 8.0),
          child: Obx(
            () => authorController.loading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 24.0),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                              borderSide: BorderSide.none),
                          fillColor: const Color(0xFFF5F5F5),
                          hintText: "Search...",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Expanded(
                        child: ListView.separated(
                          itemCount: authorController.authorsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            AuthorsListModel data =
                                authorController.authorsList[index];

                            String imagePath =
                                ConfigData.baseUrl + data.photoUrl;

                            return AuthorCard(imagePath: imagePath, data: data);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 16.0);
                          },
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
