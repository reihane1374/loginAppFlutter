import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../ConstVariables.dart';
import 'IBehiarRepository.dart';


class BehiarService extends IBehiarRepository{

  @override
  Future<Response> getToken(int mobile) async {
    var url = Uri.https(ConstVariables().url,'/v1/signin');
    var client = http.Client();
    try {
      var uriResponse = await client.post( url,
        headers:
        {
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: {
          "mobile": '${mobile}',

        },

      );
      return uriResponse;
    }
    catch(error)
    {

    }
    finally {
      client.close();
    }
  }

}
