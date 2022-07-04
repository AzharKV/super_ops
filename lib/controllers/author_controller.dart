import 'package:get/get.dart';
import 'package:super_ops/const/config.dart';
import 'package:super_ops/data/models/authors_list_model.dart';
import 'package:super_ops/data/models/authors_model.dart';
import 'package:super_ops/data/repository/author_repository.dart';

class AuthorController extends GetxController {
  AuthorRepository authorRepository = AuthorRepository();

  RxBool loading = true.obs;

  RxList<AuthorsListModel> authorsList = <AuthorsListModel>[].obs;

  @override
  void onInit() {
    fetchAuthorList();
    super.onInit();
  }

  Future<void> fetchAuthorList() async {
    loading.value = true;

    var result =
        await authorRepository.fetchAuthorsList(ConfigData.authorsListApi);

    AuthorsModel authorsModel = result;

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
      loading.value = false;
    }
  }

  String yearCalculation(DateTime dateTime) {
    DateTime now = DateTime.now();

    return "${now.difference(dateTime).inDays ~/ 365} years ago";
  }
}
