import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_r_a_p_i_p/data/app_exceptions.dart';
import 'package:mvvm_r_a_p_i_p/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiServices(String url) async{
    dynamic responsejson;
   try{
     final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responsejson = returnResponse(response);
   }on SocketException {
     throw FetchDataExceptions('No internet exception');
   }
  return responsejson;
  }

  @override
  Future getPostApiServices(String url,dynamic data) async{
    dynamic responsejson;
    try{
    Response response= await post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
    responsejson = returnResponse(response);
    }on SocketException {
      throw FetchDataExceptions('No internet exception');
    }
    return responsejson;
  }
 dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      default:
        throw FetchDataExceptions('Error occured while communicationg with server'+
            "with status code"+
            response.statusCode.toString());
    }
 }
}



