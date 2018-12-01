import 'dart:convert';

import 'package:marvel_comics/common/api_marvel.dart';
import 'package:marvel_comics/common/utils/constants_utils.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){
  test('api character response', () async{
    ApiMarvel apiMarvel = ApiMarvel();
    Map jsonResponse = {
      "code": 200,
      "status": "Ok",
      "copyright": "© 2018 MARVEL",
      "attributionText": "Data provided by Marvel. © 2018 MARVEL",
      "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2018 MARVEL</a>",
      "etag": "c7e2d739e0c1069a6c0cf8cc67edfa7a0ab272e0",
      "data": {
        "offset": 0,
        "limit": 20,
        "total": 1491,
        "count": 20,
        "results": [],
      },
    };
    apiMarvel.client = MockClient((request) async{
      return Response(json.encode(jsonResponse), 200);
    });

    ApiResponse response = await apiMarvel(url: marvelCharactersUrl);

    expect(response.apiResponseData.results, isEmpty);
  });

  test('character exception', () async{
    ApiMarvel apiMarvel = ApiMarvel();

    apiMarvel.client = MockClient((resquest) async{
      return Response(json.encode({"code": 404}), 404);
    });

    expect(() => apiMarvel(url:marvelCharactersUrl), throwsException);
  });
}