import 'package:super_ops/data/models/authors_model.dart';
import 'package:super_ops/services/http_services.dart';

class AuthorRepository {
  HttpService httpService = HttpService();

  fetchAuthorsList(String url) async {
    var response = await httpService.get(url);

    if (response.runtimeType.toString() == "Response") {
      return AuthorsModel.fromJson(response);
    } else {
      return response;
    }
  }
}
