import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:marvel_comics/common/utils/constants_utils.dart';
import 'package:marvel_comics/common/utils/format_utils.dart';

class ApiMarvel {
    static final ApiMarvel _instance = ApiMarvel._internal();

  factory ApiMarvel(){
    return _instance;
  }

  ApiMarvel._internal();

  // characters
  Future<Map<String,dynamic>> character() async{
    int ts = 12345;
    String path = "$marvelHost/characters?apikey=$marvelPublicKey&ts=$ts&hash=${createHash(ts)}&orderBy=name";

    final response = await http.get(path);
    
    if(!_responseSuccess(response)) throw http.ClientException(response.body);

    final responseMap = json.decode(response.body);

    return responseMap;
  }

  bool _responseSuccess(response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
  
}

class ApiResponse {
  final String code;
  final String status;
  final String copyright;
  final String attributionText;
  final String etag;
  final ApiResponseData apiResponseData;

  ApiResponse({this.code, this.status, this.copyright, this.attributionText, this.etag, this.apiResponseData});

  factory ApiResponse.fromJson(Map json){
    return ApiResponse(
      code: json['code'],
      status: json['status'],
      copyright: json['copyright'],
      attributionText: json['attributionText'],
      etag: json['etag'],
      apiResponseData: ApiResponseData.fromJson(json['data']),
    );
  }
}
class ApiResponseData {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Map> results;

  ApiResponseData({this.offset, this.limit, this.total, this.count, this.results});

  factory ApiResponseData.fromJson(Map json){
    return ApiResponseData(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: json['results'],
    );
  }
}
class ApiException implements Exception {
  final String error;

  ApiException(this.error);

  toString(){
    if(this.error == null) return "ApiException";
    return "ApiException: ${this.error}";
  }
}