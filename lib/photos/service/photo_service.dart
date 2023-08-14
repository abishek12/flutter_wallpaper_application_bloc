import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../search/model/search_model.dart';
import '../model/photo_model.dart';
import '../utils/header.dart';

class PhotoService {
  final _baseUrl = dotenv.env['BaseUrl'];
  final _version = dotenv.env['VERSION'];

  Future<PhotoModel> fetchPhotos({
    int? page,
    int? limit,
  }) async {
    try {
      final url = '$_baseUrl/$_version/curated?per_page=$limit&page=$page';
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return PhotoModel.fromJson(data);
      } else {
        throw 'Unable to fetch';
      }
    } catch (err) {
      throw 'Catch - $err';
    }
  }

  Future<SearchModel> fetchSearchItem(
    String query, {
    int? limit,
    int? page,
  }) async {
    try {
      final url = '$_baseUrl/$_version/search?query=$query&=40';
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SearchModel.fromJson(data);
      } else {
        throw 'Unable to fetch';
      }
    } catch (err) {
      throw 'Catch - $err';
    }
  }
}
