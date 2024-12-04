import 'dart:convert';
import 'dart:developer';
import 'package:aifer_machinetest/constants/apikey.dart';
import 'package:aifer_machinetest/model/list_photos.dart';
import 'package:http/http.dart' as http;

class ListPhotosService {
  Future<List<ListPhotosModel>> fetchPhotos() async {
    const url = '${Apikey.baseurl}photos${Apikey.apikey}&per_page=30';
// const url ='https://api.unsplash.com/photos?client_id=m_Lr78ajgH72bZzUPsjlPw-LEmZyGdv6kBFeQY3T2H4&per_page=30';

    try {
      final response = await http.get(Uri.parse(url));
      log("response: $response");
      log("Response Headers: ${response.headers}");


      if (response.statusCode == 200) {
        final List<dynamic> responsebody = jsonDecode(response.body);
        log(response.body);
        return responsebody.map((data) {
          return ListPhotosModel.fromJson(data);
        }).toList();
      } else {
        log("invalid api request: ${response.statusCode}");
        throw Exception("invalid api request: ${response.statusCode}");
      }
    } catch (e) {
      log("Server error: $e");
      throw Exception(e);
    }
  }
}

