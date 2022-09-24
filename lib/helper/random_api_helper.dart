import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_datas/models/random.dart';

class RandomAPIHelper {
  RandomAPIHelper._();

  static final RandomAPIHelper apiHelper = RandomAPIHelper._();

  final String baseURL = "https://randomuser.me/api/";
  final String endPoint = "/posts/99";

  Future<Randomdata?> fetchRandomPepoleData() async {
    http.Response res = await http.get(
      Uri.parse(baseURL),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      Randomdata random = Randomdata.fromJson(json: decodedData);
      return random;
    }
    return null;
  }
}
