import 'package:super_ops/data/models/authors_model.dart';
import 'package:super_ops/services/http_services.dart';

class AuthorRepository {
  HttpService httpService = HttpService();

  Future<dynamic> fetchAuthorsList(String url) async {
    var response = await httpService.get(url);

    return AuthorsModel.fromJson(response);
  }
}
