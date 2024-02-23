import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  getData() async {
    String uri = 'https://api.alquran.cloud/v1/surah';

    http.Response response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}
