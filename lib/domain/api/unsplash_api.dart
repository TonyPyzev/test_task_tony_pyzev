import 'dart:convert';

import 'package:http/http.dart' as http;

class UnsplashApi {
  final String _adreess = 'https://api.unsplash.com/photos/';
  final String _accessToken =
      'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

  Future<dynamic> fetchData(bool isRandom, int count) async {
    try {
      final responce = await http.get(Uri.parse(_generateUrl(isRandom, count)));
      if (responce.statusCode == 200) {
        return json.decode(responce.body);
      } else {
        throw Exception('Request error. Status code: ${responce.statusCode}');
      }
    } catch (e) {
      print(Uri.parse(_generateUrl(isRandom, count)));
      throw Exception(e);
    }
  }

  String _generateUrl(bool isRandom, int count) {
    return '$_adreess${isRandom ? 'random/?count=$count&' : '?'}client_id=$_accessToken';
  }
}
