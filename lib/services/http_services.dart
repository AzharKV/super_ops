import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:super_ops/utility/utility.dart';

class HttpService {
  Future<dynamic> get(String url) async {
    Utility().customDebugPrint("requesting for get $url ");

    var response = await http.get(Uri.parse(url));

    Utility().customDebugPrint(
        "url: $url \nstatusCode: ${response.statusCode} \nresponse ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return Exception("Failed to load data");
    }
  }
}
