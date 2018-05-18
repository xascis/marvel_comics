import 'character_model.dart';

import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<Character>> GetData() async{
  var response =  await http.get('https://gateway.marvel.com/v1/public/characters?apikey=2c8c7e04677efe9a1a8625342ae2bac8&ts=10&hash=f8a89c483b2f946c754fc7262c34db1a&orderBy=name' + '&nameStartsWith=gambit');
  final responseJson = jsonDecode(response.body);

  print(data['data']['results']);

}