import 'package:http/http.dart';

abstract class IBehiarRepository{
  Future<Response> getToken(int mobile);
}