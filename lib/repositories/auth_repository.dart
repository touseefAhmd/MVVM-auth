import 'package:mvvm_r_a_p_i_p/data/network/base_api_service.dart';
import 'package:mvvm_r_a_p_i_p/data/network/network_api_service.dart';
import 'package:mvvm_r_a_p_i_p/res/app_url.dart';

class AuthRepository{
  BaseApiServices _baseApiServices = NetworkApiServices();
  Future<dynamic> logInApi(dynamic data)async{
    try{
    var response = await _baseApiServices.getPostApiServices(AppUrl.loginUrl,data);
    return response;
  }catch(e){
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data)async{
    try{
      var response = await _baseApiServices.getPostApiServices(AppUrl.registerUrl,data);
      return response;
    }catch(e){
      throw e;
    }

  }
}