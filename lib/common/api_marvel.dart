import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:marvel_comics/common/utils/constants_utils.dart';
import 'package:marvel_comics/common/utils/secret_constants_utils.dart';

class ApiMarvel {

  http.Client client = http.Client();
  
  Future<ApiResponse> call({@required String url}) async{
    int ts = DateTime.now().millisecond;
    String path = "$marvelHost/$url?apikey=$marvelPublicKey&ts=$ts&hash=${createHash(ts)}&orderBy=name";

    final response = await this.client.get(path);
    client.close();
    
    if(!_responseSuccess(response)) throw http.ClientException(response.body);

    ApiResponse responseObj = responseToApiResponse(response);

    return responseObj;
  }

  String createHash(int ts){
  var text = "$ts$marvelPrivateKey$marvelPublicKey";
  var bytes = utf8.encode(text);
  var digest = md5.convert(bytes);
  return hex.encode(digest.bytes);
}

  ApiResponse responseToApiResponse(http.Response response) {
    // final responseMap = json.decode(utf8.decode(response.bodyBytes));
    final responseMap = json.decode(response.body);
    ApiResponse responseObject = ApiResponse.fromJson(responseMap);
    return responseObject;
  }
  bool _responseSuccess(response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
  
}

class ApiResponse {
  final int code;
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
  final List results;

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