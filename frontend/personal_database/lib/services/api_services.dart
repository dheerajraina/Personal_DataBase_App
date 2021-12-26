import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';

class APIService{
  // final API_KEY='django-insecure-hev289(b^vq%^kmbgal^8u6ri7*!lepr#z@k*j#9nd%^\$2blnr';
  APIService._instantiate();

  static final APIService instance= APIService._instantiate();

  final String _baseURL="http://10.0.2.2:8000/api/";

  Future <List> fetchContacts({required String view}) async{
    // String attributes
    String _finalUrl=_baseURL+view;
    print(_finalUrl);
    final response=await http.get(
      Uri.parse(_finalUrl),
      // headers: {
         
      //    HttpHeaders.authorizationHeader:API_KEY,
      // }
    );

    if(response.statusCode==200){
      // print(response.body);
      final data =await json.decode(response.body);
      // print(data);
      return data;
    }else{
      throw json.decode(response.body)['error']['message'];
    }
  }
}
