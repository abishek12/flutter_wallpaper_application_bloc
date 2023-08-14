import 'package:flutter_dotenv/flutter_dotenv.dart';

final _apiKey = dotenv.env['APIKEY'];

Map<String, String> headers = {
  'content-type': 'application/json',
  'authorization': '$_apiKey'
};
