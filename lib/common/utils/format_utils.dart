import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:marvel_comics/common/utils/constants_utils.dart';
import 'package:marvel_comics/common/utils/secret_constants_utils.dart';

String createHash(int ts){
  var text = "$ts$marvelPrivateKey$marvelPublicKey";
  var bytes = utf8.encode(text);
  var digest = md5.convert(bytes);
  return utf8.decode(digest.bytes);
}