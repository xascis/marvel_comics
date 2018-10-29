import 'package:marvel_comics/common/api_marvel.dart';
import 'package:test/test.dart';

void main(){
  test('api character response', () async{
    ApiResponse response = await ApiMarvel().character();

    expect(response.apiResponseData.results.isNotEmpty, true);
  });
}