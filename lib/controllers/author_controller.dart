import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_ops/const/config.dart';
import 'package:super_ops/data/models/authors_list_model.dart';
import 'package:super_ops/data/models/authors_model.dart';
import 'package:super_ops/data/repository/author_repository.dart';

class AuthorController extends GetxController {
  AuthorRepository authorRepository = AuthorRepository();

  ScrollController scrollController = ScrollController();

  RxBool loading = true.obs;
  RxBool paginationLoading = false.obs;
  String? paginationToken;

  RxList<AuthorsListModel> authorsList = <AuthorsListModel>[].obs;

  @override
  void onInit() {
    fetchAuthorList();
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  void scrollListener() {
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      fetchMoreAuthorList();
    }
  }

  Future<void> fetchAuthorList() async {
    loading.value = true;

    var result =
        await authorRepository.fetchAuthorsList(ConfigData.authorsListApi);

    await addFetchedData(result);
    loading.value = false;
  }

  Future<void> fetchMoreAuthorList() async {
    paginationLoading.value = true;

    String url = "${ConfigData.authorsListApi}?pageToken=$paginationToken";

    var result = await authorRepository.fetchAuthorsList(url);
    await addFetchedData(result);
    paginationLoading.value = false;
    scrollController.animateTo(scrollController.offset + 80.0,
        duration: const Duration(milliseconds: 800), curve: Curves.ease);
  }

  Future<void> addFetchedData(result) async {
    AuthorsModel authorsModel = result;
    paginationToken = authorsModel.pageToken;

    if (authorsModel.messages != null) {
      for (var element in authorsModel.messages!) {
        AuthorsListModel authorsListModel = AuthorsListModel(
            element.content ?? "",
            yearCalculation(element.updated ?? DateTime.now()),
            element.id ?? 0,
            element.author?.name ?? "",
            element.author?.photoUrl ?? "");
        authorsList.add(authorsListModel);
      }
    }
  }

  String yearCalculation(DateTime dateTime) {
    DateTime now = DateTime.now();

    return "${now.difference(dateTime).inDays ~/ 365} years ago";
  }
}
