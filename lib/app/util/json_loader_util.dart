import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadJsonData(String lang) async {
  // Load the appropriate JSON file based on the language
  String jsonString = await rootBundle.loadString('lib/util/lang/texts_$lang.json');
  
  // Decode the JSON data
  Map<String, dynamic> jsonData = json.decode(jsonString);
  
  return jsonData;
}
